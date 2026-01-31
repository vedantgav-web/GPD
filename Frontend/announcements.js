
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
// --- Updated Handle Attachments Section ---
if (ann.attachments && ann.attachments !== 'None' && ann.attachments !== '') {
    const attachmentsDiv = document.createElement("div");
    attachmentsDiv.classList.add("attachments-section");
    attachmentsDiv.innerHTML = "<strong>Attachments: </strong>";

    // Cloudinary stores single URLs, but if you eventually allow multiple, 
    // we split by comma just in case.
    const files = ann.attachments.split(",");
    
    files.forEach(fileUrl => {
        // 1. Logic Check: If it's a Cloudinary URL, use it directly. 
        // If it's an old local path, we handle it gracefully.
        const isCloudinary = fileUrl.startsWith('http');
        const finalUrl = isCloudinary ? fileUrl : `${API_BASE_URL}/${fileUrl.replace(/\\/g, '/')}`;

        // 2. Get a nice display name
        const fileName = isCloudinary ? "View Attachment" : fileUrl.split(/[\\/]/).pop();

        const a = document.createElement("a");
        a.href = finalUrl;
        a.textContent = fileName;
        a.target = "_blank"; // Opens PDF/Image in new tab
        a.style.marginLeft = "10px";
        a.style.textDecoration = "underline";
        a.style.color = "#007bff";
        
        attachmentsDiv.appendChild(a);
    });
    card.appendChild(attachmentsDiv);
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
