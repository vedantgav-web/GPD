document.addEventListener("DOMContentLoaded", async () => {
    const searchBox = document.getElementById("searchBox");

    try {
        // ONE fetch call to get all data
        const res = await fetch(`${API_BASE_URL}/admin-view/all`);
        const data = await res.json();

        // Populate all tables using the helper function
        renderTable("studentViewTable", data.students, (s) => `
    <td><strong>${s.enrollment_no}</strong></td>
    <td>${s.name}</td>
    <td>${s.roll_no}</td>
    <td>${s.branch}</td>
    <td>${s.semester}</td>
    <td>${s.academic_year}</td>
    <td>${s.phone_no || '-'}</td>
    <td>${s.parents_phone_no || '-'}</td>
    <td>${s.email || '-'}</td>
    <td>${s.address || '-'}</td>
    <td>
        <button class="view-btn" onclick="viewAcademicHistory('${s.enrollment_no}')">
            View Records
        </button>
    </td>
`);
        renderTable("announcementViewTable", data.announcements, (a) => `
    <td><strong>${a.announcement_id}</strong></td>
    <td>${a.title}</td>
    <td>${a.short_description}</td>
    <td>${a.long_description || '-'}</td>
    <td>${a.attachments || 'No files'}</td>
    <td>${new Date(a.created_at).toLocaleDateString()}</td>
`);
        renderTable("photoViewTable", data.photos, (p) => `<td>${p.image_id}</td><td>${p.title || 'Untitled'}</td><td><img src="http://localhost:5000/${p.image.replace(/\\/g, '/')}" class="table-preview-img"></td><td>${p.album_name || 'Untitled'}</td>`);
        renderTable("linkViewTable", data.links, (l) => `<td>${l.link_id}</td><td>${l.name}</td><td>${l.link}</td>`);

        // Change data.admins to data.staff
        renderTable("adminViewTable", data.staff, (st) => `
    <td><strong>${st.staff_id}</strong></td>
    <td>${st.username}</td>
    <td>${st.full_name}</td>
    <td>${st.phone || '-'}</td>
    <td>${st.email || '-'}</td>
    <td>${new Date(st.created_at).toLocaleDateString()}</td>
`);

    } catch (err) {
        console.error("Dashboard Load Error:", err);
    }

    // Universal Search Logic
    searchBox.addEventListener("keyup", (e) => {
        const term = e.target.value.toLowerCase();
        document.querySelectorAll(".table-wrapper tbody tr").forEach(row => {
            row.style.display = row.textContent.toLowerCase().includes(term) ? "" : "none";
        });
    });
});

function renderTable(tableId, data, rowTemplate) {
    const tbody = document.querySelector(`#${tableId} tbody`);
    if (!data || data.length === 0) {
        tbody.innerHTML = "<tr><td colspan='3' style='text-align:center'>No data available</td></tr>";
        return;
    }
    tbody.innerHTML = data.map(item => `<tr>${rowTemplate(item)}</tr>`).join('');
}

// Toggle the visibility of the filter dropdown
function toggleFilter(id) {
    const dropdown = document.getElementById(id);
    const isVisible = dropdown.style.display === "block";

    // Close all other filters first
    document.querySelectorAll('.filter-dropdown').forEach(el => el.style.display = 'none');

    // Toggle current
    dropdown.style.display = isVisible ? "none" : "block";
}

// Apply the actual filtering logic
function applyFilters() {
    const branchValue = document.getElementById("branchSelect").value.toLowerCase();
    const semValue = document.getElementById("semSelect").value;
    const rows = document.querySelectorAll("#studentViewTable tbody tr");

    rows.forEach(row => {
        // Index 3 is Branch, Index 4 is Semester (matching your <td> order)
        const branchCell = row.cells[3].textContent.toLowerCase();
        const semCell = row.cells[4].textContent;

        const matchesBranch = (branchValue === "all" || branchCell.includes(branchValue));
        const matchesSem = (semValue === "all" || semCell === semValue);

        if (matchesBranch && matchesSem) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    });
}

// Close filters if clicking outside
window.onclick = function (event) {
    if (!event.target.matches('.filter-btn') && !event.target.closest('.filter-dropdown')) {
        document.querySelectorAll('.filter-dropdown').forEach(el => el.style.display = 'none');
    }
}
function handleStudentSort() {
    const sortBy = document.getElementById("studentSortBtn").value;
    const tbody = document.querySelector("#studentViewTable tbody");
    const rows = Array.from(tbody.querySelectorAll("tr"));

    // Skip sorting if table is empty
    if (rows.length === 0 || rows[0].textContent.includes("No data")) return;

    rows.sort((a, b) => {
        // Column indices: Enrollment = 0, Name = 1
        const enrollA = a.cells[0].textContent.trim();
        const enrollB = b.cells[0].textContent.trim();
        const nameA = a.cells[1].textContent.trim().toLowerCase();
        const nameB = b.cells[1].textContent.trim().toLowerCase();

        switch (sortBy) {
            case "enroll_asc":
                return enrollA.localeCompare(enrollB, undefined, { numeric: true });
            case "enroll_desc":
                return enrollB.localeCompare(enrollA, undefined, { numeric: true });
            case "name_asc":
                return nameA.localeCompare(nameB);
            case "name_desc":
                return nameB.localeCompare(nameA);
            case "original":
                // Assumes the data was fetched latest-first from DB
                return 0;
            case "oldest":
                // This reverses the current view to show oldest at top
                return 1;
            default:
                return 0;
        }
    });

    // If "Latest First" or "Oldest First" is picked as a toggle
    if (sortBy === "oldest") {
        // Re-fetch logic or simple reverse if original was latest-first
        tbody.append(...rows.reverse());
    } else {
        tbody.append(...rows);
    }
}
// This defines which subjects appear for which class
let currentSort = { column: 'enrollment_no', direction: 'asc' };
let cachedStudents = [];
let cachedColumns = [];

async function loadClassForMarks() {
    const branch = document.getElementById("marksBranch").value;
    const sem = document.getElementById("marksSem").value;
    const year = document.getElementById("marksYear").value;

    if (!branch || !sem || !year) return alert("Please select all fields");

    const [colRes, stuRes] = await Promise.all([
        fetch(`${API_BASE_URL}/results/get-columns?branch=${branch}&sem=${sem}`),
        fetch(`${API_BASE_URL}/results/get-class?branch=${branch}&sem=${sem}&year=${year}`)
    ]);

    cachedColumns = await colRes.json();
    cachedStudents = await stuRes.json();

    renderMarksTable();
}

function applySort(sortValue) {
    const parts = sortValue.split('_');
    const direction = parts.pop(); // 'asc' or 'desc'
    const column = parts.join('_'); // 'enrollment_no' or 'rank_no'

    currentSort = { column, direction };

    // Use a tiny timeout to let the dropdown close before redrawing the table
    setTimeout(() => {
        renderMarksTable();
    }, 10);
}

function renderMarksTable() {
    const systemFields = [
        'seat_no',
        'max_total_marks',
        'enrollment_no',
        'academic_year',
        'total_marks_obtained',
        'percentage',
        'result_status',
        'rank_no'
    ];
    const tableDiv = document.getElementById("marksTableContainer");
    if (!cachedStudents.length) return;

    // 2. IMPROVED SORTING LOGIC
    cachedStudents.sort((a, b) => {
        let valA = a[currentSort.column];
        let valB = b[currentSort.column];

        // Convert to numbers if possible (important for Rank and Marks)
        let numA = parseFloat(valA);
        let numB = parseFloat(valB);

        if (!isNaN(numA) && !isNaN(numB)) {
            return currentSort.direction === 'asc' ? numA - numB : numB - numA;
        }

        // String fallback
        valA = (valA || "").toString().toLowerCase();
        valB = (valB || "").toString().toLowerCase();
        return currentSort.direction === 'asc' ? valA.localeCompare(valB) : valB.localeCompare(valA);
    });

    // 3. GENERATE HTML
    let html = `
        <div class="table-actions">
            <div class="btn-group">
                <button id="masterEditBtn" class="btn-edit" onclick="toggleTableEdit()">✏️ Edit Marks</button>
                <button id="masterSaveBtn" class="btn-save" onclick="submitAllMarks()" style="display:none; margin-left:10px;">💾 Save All Marks</button>
            </div>
            <div class="sort-container">
                <label><strong>Sort By:</strong></label>
                <select class="sort-select" onchange="applySort(this.value)">
                    <option value="enrollment_no_asc" ${currentSort.column === 'enrollment_no' && currentSort.direction === 'asc' ? 'selected' : ''}>Enrollment (0 → 9)</option>
                    <option value="enrollment_no_desc" ${currentSort.column === 'enrollment_no' && currentSort.direction === 'desc' ? 'selected' : ''}>Enrollment (9 → 0)</option>
                    <option value="name_asc" ${currentSort.column === 'name' && currentSort.direction === 'asc' ? 'selected' : ''}>Name (A → Z)</option>
                    <option value="total_marks_obtained_desc" ${currentSort.column === 'total_marks_obtained' && currentSort.direction === 'desc' ? 'selected' : ''}>Marks (High → Low)</option>
                    <option value="rank_no_asc" ${currentSort.column === 'rank_no' && currentSort.direction === 'asc' ? 'selected' : ''}>Rank (Top #1 First)</option>
                </select>
            </div>
        </div>
        <div class="table-wrapper">
            <table class="marks-table">
                <thead><tr><th>Enrollment</th><th>Seat No</th><th>Name</th>`;

    cachedColumns.forEach(col => {
        if (!systemFields.includes(col)) {
            const p = col.split('_');
            html += `<th>${p[0]}<br><small>${p.slice(1).join(' ')}</small></th>`;
        }
    });

    html += `<th>Total</th><th>Max Total</th><th>%</th><th>Grade</th><th>Rank</th></tr></thead><tbody>`;

    cachedStudents.forEach(stu => {
        html += `<tr class="student-mark-row" data-enroll="${stu.enrollment_no}">
            <td>${stu.enrollment_no}</td>
            <td>
            <input type="text" value="${stu.seat_no || ""}" 
                   class="m-input" data-field="seat_no" 
                   placeholder="Enter Seat No" disabled>
        </td>
            <td style="text-align:left;">${stu.name}</td>`;

        cachedColumns.forEach(col => {
            if (!systemFields.includes(col)) {
                html += `<td><input type="text" value="${stu[col] ?? ""}" class="m-input" data-field="${col}" disabled></td>`;
            }
        });

        html += `
            <td>${stu.total_marks_obtained || 0}</td>
            <td>
            <input type="number" value="${stu.max_total_marks || ""}" 
                   class="m-input" data-field="max_total_marks" 
                   placeholder="e.g. 850" style="width:60px;" disabled>
        </td>
            <td>${stu.percentage || 0}%</td>
            <td>
    <select class="m-input-status" data-field="result_status" ${stu.result_status ? '' : ''} disabled>
        <option value="-" ${stu.result_status === '-' ? 'selected' : ''}>- Select -</option>
        <option value="FIRST CLASS WITH DISTINCTION" ${stu.result_status === 'FIRST CLASS WITH DISTINCTION' ? 'selected' : ''}>Distinction</option>
        <option value="FIRST CLASS" ${stu.result_status === 'FIRST CLASS' ? 'selected' : ''}>First Class</option>
        <option value="FIRST CLASS CON" ${stu.result_status === 'FIRST CLASS CON' ? 'selected' : ''}>First Class Con</option>
        <option value="SECOND CLASS" ${stu.result_status === 'SECOND CLASS' ? 'selected' : ''}>Second Class</option>
        <option value="SECOND CLASS CON" ${stu.result_status === 'SECOND CLASS CON' ? 'selected' : ''}>Second Class Con</option>
        <option value="DISTINCTION CON" ${stu.result_status === 'DISTINCTION CON' ? 'selected' : ''}>Distinction Con</option>
        <option value="PASS" ${stu.result_status === 'PASS' ? 'selected' : ''}>Pass</option>
        <option value="PASS CLASS CON" ${stu.result_status === 'PASS CON' ? 'selected' : ''}>Pass Con</option>
        <option value="ATKT" ${stu.result_status === 'ATKT' ? 'selected' : ''}>ATKT</option>
        <option value="FAIL" ${stu.result_status === 'FAIL' ? 'selected' : ''}>Fail</option>
        <option value="FT" ${stu.result_status === 'FT' ? 'selected' : ''}>F.T.</option>
    </select>
</td>
            <td><strong>#${stu.rank_no || '-'}</strong></td>
        </tr>`;
    });

    html += `</tbody></table></div>`;
    tableDiv.innerHTML = html;
}

function toggleTableEdit() {
    // Select both the text inputs and the new dropdown selects
    const inputs = document.querySelectorAll('.m-input, .m-input-status');
    const editBtn = document.getElementById('masterEditBtn');
    const saveBtn = document.getElementById('masterSaveBtn');

    const isCurrentlyLocked = inputs[0].disabled;

    if (isCurrentlyLocked) {
        inputs.forEach(input => input.disabled = false);
        editBtn.innerHTML = "❌ Cancel";
        editBtn.style.backgroundColor = "#dc3545";
        saveBtn.style.display = "inline-block";
    } else {
        inputs.forEach(input => input.disabled = true);
        editBtn.innerHTML = "✏️ Edit Marks";
        editBtn.style.backgroundColor = "#007bff";
        saveBtn.style.display = "none";
    }
}


async function submitAllMarks() {
    const branch = document.getElementById("marksBranch").value;
    const sem = document.getElementById("marksSem").value;
    const year = document.getElementById("marksYear").value;
    const rows = document.querySelectorAll(".student-mark-row");

    // 1. Collect Data
    // Inside submitAllMarks function
    const allData = Array.from(rows).map(row => {
        const enrollment_no = row.dataset.enroll;
        const data = {};

        // Collect subject marks from text inputs
        row.querySelectorAll(".m-input").forEach(input => {
            const colName = input.dataset.field;
            data[colName] = input.value === "" ? null : input.value;
        });

        // Collect result_status from the dropdown
        const statusDropdown = row.querySelector(".m-input-status");
        if (statusDropdown) {
            data['result_status'] = statusDropdown.value;
        }

        return { enrollment_no, ...data };
    });

    try {
        // 2. API Call
        const res = await fetch(`${API_BASE_URL}/results/save-marks`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ branch, sem, year, allData })
        });

        const result = await res.json();

        if (res.ok) {
            alert("✅ Marks Saved! Ranks and Status recalculated.");

            // 3. Auto-Lock and Refresh UI
            await loadClassForMarks(); // This re-fetches the updated data from DB
        } else {
            alert("❌ Error: " + result.message);
        }
    } catch (err) {
        console.error("Save Error:", err);
        alert("Server connection failed.");
    }
}


function viewAcademicHistory(enrollment) {
    console.log("Saving to memory and opening window:", enrollment);

    // Save to browser storage
    localStorage.setItem('current_enrollment', enrollment);

    // Open the page
    window.open('academic_record.html', '_blank');
}
async function searchExStudents() {
    const query = document.getElementById('exStudentSearchInput').value.trim();
    const tbody = document.getElementById('exStudentTableBody');

    if (!query) {
        alert("Please enter a name or enrollment number.");
        return;
    }

    tbody.innerHTML = '<tr><td colspan="7" style="text-align:center; padding: 20px;">🔍 Searching the archive...</td></tr>';

    try {
        // Calling your NEW router endpoint
        const response = await fetch(`${API_BASE_URL}/exstudents/search-ex?query=${encodeURIComponent(query)}`);
        const results = await response.json();

        if (results.length === 0) {
            tbody.innerHTML = '<tr><td colspan="7" style="text-align:center; padding: 20px; color: #cc0000;">No records found for that query in the Passed Out database.</td></tr>';
            return;
        }

        tbody.innerHTML = results.map(student => {
            // Logic to calculate Passing Year (e.g., "2023-24" becomes 2026)
            let passingYear = "N/A";
            if (student.academic_year) {
                // Extract the first 4 digits (e.g., 2023) and add 3
                const startYear = parseInt(student.academic_year.substring(0, 4));
                if (!isNaN(startYear)) {
                    passingYear = startYear + 3;
                }
            }

            return `
        <tr style="background: #fdfdfd;">
            <td><strong>${student.enrollment_no}</strong></td>
            <td>${student.name.toUpperCase()}</td>
            <td>${student.branch}</td>
            <td>${passingYear}</td> <td>${student.phone_no || 'N/A'}</td> <td><span style="background: #6c757d; color: white; padding: 2px 8px; border-radius: 12px; font-size: 11px;">ALUMNI</span></td>
            <td>
                <button class="view-btn" onclick="openArchiveTranscript('${student.enrollment_no}')" style="background: #007bff; color: white; border: none; padding: 5px 10px; border-radius: 3px; cursor: pointer;">
                    View Result
                </button>
            </td>
        </tr>
    `;
        }).join('');

    } catch (err) {
        console.error("Search failed:", err);
        tbody.innerHTML = '<tr><td colspan="7" style="text-align:center; padding: 20px; color: red;">Error: Could not connect to the archive server.</td></tr>';
    }
}

// Clear function
function clearExSearch() {
    document.getElementById('exStudentSearchInput').value = "";
    document.getElementById('exStudentTableBody').innerHTML = '<tr><td colspan="7" style="text-align:center; padding: 40px; color: #999;">Search for a student to load archived results.</td></tr>';
}

// Result View function
function openArchiveTranscript(enrollment) {
    localStorage.setItem('current_enrollment', enrollment);
    window.location.href = `academic_record.html?enrollment_no=${enrollment}`;
}

// Listen for "Enter" key on the input
document.getElementById('exStudentSearchInput').addEventListener('keypress', function (e) {
    if (e.key === 'Enter') {
        searchExStudents();
    }
});