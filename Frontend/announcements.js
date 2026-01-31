
let currentPage = 1;
const recordsPerPage = 5;
let allAnnouncements = [];

// 1. Navigation Logic
function scrollToSection(id) {
    const element = document.getElementById(id);
    if (element) {
        element.scrollIntoView({ behavior: 'smooth' });
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

// 3. Pagination Logic
function displayPage(page) {
    currentPage = page;
    const container = document.getElementById("announcementsContainer");
    container.innerHTML = "";

    // Calculate start and end for slicing
    const start = (page - 1) * recordsPerPage;
    const end = start + recordsPerPage;
    const paginatedItems = allAnnouncements.slice(start, end);

    // Call the rendering function (Defined below)
    renderAnnouncements(paginatedItems);

    // Update Pagination Buttons
    renderPagination();
}

// 4. THE CORE RENDERING FUNCTION (MUST BE UNCOMMENTED)
function renderAnnouncements(list) {
    const container = document.getElementById("announcementsContainer");

    if (!list || list.length === 0) {
        container.innerHTML = "<p>No announcements available</p>";
        return;
    }

    list.forEach(ann => {
        const card = document.createElement("div");
        card.classList.add("announcement");

        card.innerHTML = `
            <div class="title">${ann.title}</div>
            <div class="short-desc">${ann.short_description}</div>
            <div class="long-desc" style="display: none;">${ann.long_description || ''}</div>
            <div class="show-more" style="cursor:pointer; color: #007bff;">Show more</div>
            <div class="date">${new Date(ann.created_at).toLocaleDateString()}</div>
        `;

        // Handle Attachments
        if (ann.attachments && ann.attachments !== 'None') {
            const attachmentsDiv = document.createElement("div");
            attachmentsDiv.classList.add("attachments-section");
            attachmentsDiv.innerHTML = "<strong>Attachments: </strong>";

            const files = ann.attachments.split(",");
            files.forEach(filePath => {
                const cleanPath = filePath.replace(/\\/g, '/');
                const fileUrl = `${API_BASE_URL}/${cleanPath}`;
                const fileName = cleanPath.split('/').pop();

                const a = document.createElement("a");
                a.href = fileUrl;
                a.textContent = fileName;
                a.target = "_blank";
                a.style.marginLeft = "10px";
                a.style.textDecoration = "underline";
                attachmentsDiv.appendChild(a);
            });
            card.appendChild(attachmentsDiv);
        }

        // Show More/Less Logic
        const showMoreBtn = card.querySelector(".show-more");
        const longDesc = card.querySelector(".long-desc");
        showMoreBtn.addEventListener("click", () => {
            const isHidden = longDesc.style.display === "none";
            longDesc.style.display = isHidden ? "block" : "none";
            showMoreBtn.textContent = isHidden ? "Show less" : "Show more";
        });

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

    // Helper to create buttons
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

    // --- SMART LOGIC ---
    // Always show First Page
    paginationContainer.appendChild(createBtn(1));

    if (currentPage > 3) {
        const dots = document.createElement("span");
        dots.innerText = "...";
        dots.style.margin = "0 5px";
        paginationContainer.appendChild(dots);
    }

    // Show pages around current page
    for (let i = Math.max(2, currentPage - 1); i <= Math.min(pageCount - 1, currentPage + 1); i++) {
        paginationContainer.appendChild(createBtn(i));
    }

    if (currentPage < pageCount - 2) {
        const dots = document.createElement("span");
        dots.innerText = "...";
        dots.style.margin = "0 5px";
        paginationContainer.appendChild(dots);
    }

    // Always show Last Page
    if (pageCount > 1) {
        paginationContainer.appendChild(createBtn(pageCount));
    }

    document.getElementById("announcementsContainer").after(paginationContainer);
}

// Search Logic
document.getElementById("searchBox").addEventListener("input", (e) => {
    const query = e.target.value.toLowerCase();
    const filtered = allAnnouncements.filter(ann =>
        ann.title.toLowerCase().includes(query)
    );
    // Reset to page 1 for search results
    const tempStore = allAnnouncements;
    allAnnouncements = filtered;
    displayPage(1);
    allAnnouncements = tempStore; // Restore full list
});


function setActive(element, sectionId) {
    // 1. Remove 'active' class from all nav items
    const navItems = document.querySelectorAll('.nav-item');
    navItems.forEach(item => item.classList.remove('active'));

    // 2. Add 'active' class to the clicked item
    element.classList.add('active');

    // 3. Perform the scroll
    scrollToSection(sectionId);
}

// Update your scrollToSection to be more precise with the fixed header
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

// Initial Load
loadAnnouncements();
