let currentPage = 1;
const recordsPerPage = 5;
let allAnnouncements = [];

// 1. Navigation Logic
function scrollToSection(id) {
    const element = document.getElementById(id);
    if (element) {
        const headerOffset = 160;
        const elementPosition = element.getBoundingClientRect().top;
        const offsetPosition = elementPosition + window.pageYOffset - headerOffset;

        window.scrollTo({
            top: offsetPosition,
            behavior: "smooth"
        });
    }
}

// 2. Load Data from DB
async function loadAnnouncements() {
    try {
        const res = await fetch(`${API_BASE_URL}/announcements`);
        allAnnouncements = await res.json();
        displayPage(1); // Initialize first page
    } catch (err) {
        console.error("Error loading announcements:", err);
    }
}

// 3. Pagination & Display Logic
function displayPage(page) {
    currentPage = page;
    const container = document.getElementById("announcementsContainer");
    if (!container) return;
    
    container.innerHTML = "";

    const start = (page - 1) * recordsPerPage;
    const end = start + recordsPerPage;
    const paginatedItems = allAnnouncements.slice(start, end);

    renderAnnouncements(paginatedItems);
    renderPagination();
}

// 4. THE CORE RENDERING FUNCTION (Fixed 'ann' scoping)
function renderAnnouncements(items) {
    const container = document.getElementById("announcementsContainer");

    items.forEach(ann => {
        const card = document.createElement("div");
        card.classList.add("announcement-card");

        card.innerHTML = `
            <h3>${ann.title}</h3>
            <p class="short-desc">${ann.short_description}</p>
            <p class="long-desc">${ann.long_description || ""}</p>
            <small>Posted on: ${new Date(ann.created_at).toLocaleDateString()}</small>
        `;

        // --- Handle Attachments Section ---
        if (ann.attachments && ann.attachments !== 'None' && ann.attachments !== '') {
    const attachmentsDiv = document.createElement("div");
    attachmentsDiv.classList.add("attachments-section");
    attachmentsDiv.innerHTML = "<strong>Attachments: </strong>";

    // Split by comma in case there are multiple files
    const files = ann.attachments.split(",");
    
    // Inside your renderAnnouncements function
items.forEach(ann => {
    // ... existing card creation logic ...

    if (ann.attachments && ann.attachments !== 'None') {
        const files = ann.attachments.split(",");
        
        files.forEach(fileUrl => {
            const url = fileUrl.trim();
            if (!url) return;

            const a = document.createElement("a");
            a.href = url; // The full working link from the DB
            a.target = "_blank"; 
            
            // Nice label logic
            const isPdf = url.toLowerCase().endsWith('.pdf');
            a.textContent = isPdf ? "📄 View PDF" : "🖼️ View Image";
            
            a.style.marginLeft = "15px";
            a.style.color = "#007bff";
            a.style.fontWeight = "bold";
            
            attachmentsDiv.appendChild(a);
        });
        card.appendChild(attachmentsDiv);
    }
    container.appendChild(card);
});
    card.appendChild(attachmentsDiv);
}
      



        container.appendChild(card);
    });
}

// 5. Render Pagination UI
function renderPagination() {
    const oldPagination = document.querySelector(".pagination-container");
    if (oldPagination) oldPagination.remove();

    const pageCount = Math.ceil(allAnnouncements.length / recordsPerPage);
    if (pageCount <= 1) return;

    const paginationContainer = document.createElement("div");
    paginationContainer.classList.add("pagination-container");

    const createBtn = (i, label = i) => {
        const btn = document.createElement("button");
        btn.innerText = label;
        btn.className = (i === currentPage) ? "page-btn active" : "page-btn";
        btn.onclick = () => {
            displayPage(i);
            scrollToSection('announcements');
        };
        return btn;
    };

    paginationContainer.appendChild(createBtn(1));

    if (currentPage > 3) {
        const dots = document.createElement("span");
        dots.innerText = "...";
        paginationContainer.appendChild(dots);
    }

    for (let i = Math.max(2, currentPage - 1); i <= Math.min(pageCount - 1, currentPage + 1); i++) {
        paginationContainer.appendChild(createBtn(i));
    }

    if (currentPage < pageCount - 2) {
        const dots = document.createElement("span");
        dots.innerText = "...";
        paginationContainer.appendChild(dots);
    }

    if (pageCount > 1) {
        paginationContainer.appendChild(createBtn(pageCount));
    }

    document.getElementById("announcementsContainer").after(paginationContainer);
}

// 6. Search Logic
document.getElementById("searchBox").addEventListener("input", (e) => {
    const query = e.target.value.toLowerCase();
    const filtered = allAnnouncements.filter(ann =>
        ann.title.toLowerCase().includes(query)
    );
    // Temporarily swap list to show filtered results
    const fullList = allAnnouncements;
    allAnnouncements = filtered;
    displayPage(1);
    allAnnouncements = fullList; 
});

// Initial Load
loadAnnouncements();
