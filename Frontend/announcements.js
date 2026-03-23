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
    container.innerHTML = ""; // Clear container before rendering

    items.forEach(ann => {
        const card = document.createElement("div");
        card.classList.add("announcement-card");

        card.innerHTML = `
            <h2>${ann.title}</h2>
            <h4>${ann.short_description}</h4>
            <p>${ann.long_description || ""}</p>
            <small>Posted on: ${new Date(ann.created_at).toLocaleDateString()}</small>
        `;

        // IMPORTANT: Create a FRESH div for THIS announcement's attachments
        if (ann.attachments && ann.attachments !== 'None' && ann.attachments !== '') {
            const attachmentsDiv = document.createElement("div");
            attachmentsDiv.classList.add("attachments-section");
            attachmentsDiv.innerHTML = "<strong>Attachments: </strong>";

            const files = ann.attachments.split(",");
            
            files.forEach(fileUrl => {
                const url = fileUrl.trim();
                if (!url) return;

                const a = document.createElement("a");
                a.href = url;
                a.target = "_blank"; 
                
                const isPdf = url.toLowerCase().endsWith('.pdf');
                a.innerHTML = isPdf ? "📄 View PDF" : "🖼️ View Image";
                
                // Add your styles
                a.style.marginLeft = "10px";
                
                // Append the link ONLY to the current announcement's div
                attachmentsDiv.appendChild(a);
            });

            // Append the div ONLY to the current announcement's card
            card.appendChild(attachmentsDiv);
        }

        // Finally, add the finished card to the main container
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
