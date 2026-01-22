const enrollment_no = localStorage.getItem("enrollment_no");
console.log("Student in storage:", enrollment_no);

if (!enrollment_no) {
    window.location.href = "index.html";
}

async function switchView(buttonElement, viewId) {
    // Standard Tab Switching
    document.querySelectorAll('.nav-item').forEach(btn => btn.classList.remove('active'));
    buttonElement.classList.add('active');

    document.querySelectorAll('.view-container').forEach(view => {
        view.classList.remove('active');
        view.style.display = 'none';
    });

    const targetView = document.getElementById(viewId);
    targetView.classList.add('active');
    targetView.style.display = 'block';

    // SPECIAL LOGIC: If user clicks Results, load their specific data
    if (viewId === 'viewResults') {
        const loggedInEnrollment = localStorage.getItem("enrollment_no");
        if (loggedInEnrollment) {
            loadLoggedInResult(loggedInEnrollment);
        }
    }
}

async function loadLoggedInResult(enrollment) {
    const summaryContainer = document.getElementById('resultSummaryCards');

    try {
        const res = await fetch(`${API_BASE_URL}/results/student/${enrollment}`);
        const data = await res.json();

        if (!data || !data.marks || data.marks.length === 0) {
            summaryContainer.innerHTML = "<div class='info-box'>No records found.</div>";
            return;
        }

        let summaryHTML = "";
        data.marks.forEach(record => {
            // Determine status color
            const statusClass = record.result_status?.toLowerCase() === 'pass' ? 'status-pass' : 'status-fail';

            summaryHTML += `
                <div class="result-summary-card">
                    <div class="sem-title">SEMESTER ${record.semester_label}</div>
                    <div class="summary-body">
                        <div class="stat-item">
                            <span class="label">Total Marks</span>
                            <span class="value">${record.total_marks_obtained} / ${record.max_total_marks || '---'}</span>
                        </div>
                        <div class="stat-item">
                            <span class="label">Percentage</span>
                            <span class="value">${record.percentage}%</span>
                        </div>
                        <div class="stat-item">
                            <span class="label">Rank</span>
                            <span class="value">#${record.rank_no || 'N/A'}</span>
                        </div>
                        <div class="stat-item status-badge ${statusClass}">
                            ${record.result_status || 'N/A'}
                        </div>
                    </div>
                </div>`;
        });

        summaryContainer.innerHTML = summaryHTML;

    } catch (err) {
        summaryContainer.innerHTML = "<div class='error-box'>Failed to load summary. Check connection.</div>";
    }
}

// Function to open the detailed file in a new tab
function openDetailedTranscript() {
    // 1. Get the logged-in student's enrollment from storage
    const enrollment = localStorage.getItem('enrollment_no');

    if (!enrollment || enrollment === "null") {
        alert("Error: Logged-in enrollment ID not found. Please log in again.");
        return;
    }

    console.log("Saving student enrollment to memory and opening window:", enrollment);

    // 2. Save to 'current_enrollment' so academic_record.html can find it
    localStorage.setItem('current_enrollment', enrollment);

    // 3. Open the page in a new tab
    window.open('academic_record.html', '_blank');
}

document.addEventListener("DOMContentLoaded", () => {
    const quotes = [
        "Education is the most powerful weapon which you can use to change the world.",
        "The beautiful thing about learning is that no one can take it away from you.",
        "Success is the sum of small efforts, repeated day in and day out.",
        "Don’t let what you cannot do interfere with what you can do.",
        "The mind is not a vessel to be filled, but a fire to be kindled.",
        "Hard work beats talent when talent doesn't work hard."
    ];

    // Pick a random index from 0 to quotes.length - 1
    const randomIndex = Math.floor(Math.random() * quotes.length);

    // Update the text in the HTML
    document.getElementById("inspirationText").innerText = `"${quotes[randomIndex]}"`;
});