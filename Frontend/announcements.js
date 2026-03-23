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
        // Updated to use your API_BASE_URL
        const res = await fetch(`${API_BASE_URL}/announcements`);
        allAnnouncements = await res.json();
        displayPage(1); 
    } catch (err) {
        console.error("Error loading announcements:", err);
    }
}

// 3. Pagination Logic
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

// 4. THE CORE RENDERING FUNCTION (Fixed for Cloudinary + Individual Attachments)
function renderAnnouncements(list) {
    const container = document.getElementById("announcementsContainer");

    if (!list || list.length === 0) {
        container.innerHTML = "<p>No announcements available</p>";
        return;
    }

    list.forEach(ann => {
        const card = document.createElement("div");
        card.classList.add("announcement"); // Matches your CSS class

        // Building the HTML structure
        card.innerHTML = `
            <div class="title">${ann.title}</div>
            <div class="short-desc">${ann.short_description}</div>
            <div class="long-desc" style="display: none; margin-top: 10px;">${ann.long_description || ''}</div>
            <div class="show-more" style="cursor:pointer; color: #007bff; margin-top: 5px;">Show more</div>
            <div class="date" style="font-size: 0.8em; color: #888; margin-top: 10px;">
                Posted on: ${new Date(ann.created_at).toLocaleDateString()}
            </div>
        `;

        // Handle Attachments (Fixed to prevent "bleeding" to other cards)
        if (ann.attachments && ann.attachments !== 'None' && ann.attachments !== '') {
            const attachmentsDiv = document.createElement("div");
            attachmentsDiv.classList.add("attachments-section");
            attachmentsDiv.style.marginTop = "10px";
            attachmentsDiv.innerHTML = "<strong>Attachments: </strong>";

            // Split and loop through specific attachments for THIS announcement only
            const files = ann.attachments.split(",");
            files.forEach(fileUrl => {
                const url = fileUrl.trim();
                if (!url) return;

                const a = document.createElement("a");
                a.href = url; // Directly uses the Cloudinary URL from DB
                a.target = "_blank";
                
                // Smart label based on file type
                const isPdf = url.toLowerCase().endsWith('.pdf');
                a.innerHTML = isPdf ? "📄 View PDF" : "🖼️ View Image";
                
                // Styling from your request
                a.style.marginLeft = "10px";
                a.style.textDecoration = "underline";
                a.style.color = "#007bff";
                a.style.fontSize = "0.9em";

                attachmentsDiv.appendChild(a);
            });
            card.appendChild(attachmentsDiv);
        }

        // Show More/Less Logic for this specific card
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

// 5. Render Pagination UI (Smart Logic)
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
        dots.style.margin = "0 5px";
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

    // Append pagination after the container
    document.getElementById("announcementsContainer").after(paginationContainer);
}

// 6. Search Logic
const searchBox = document.getElementById("searchBox");
if (searchBox) {
    searchBox.addEventListener("input", (e) => {
        const query = e.target.value.toLowerCase();
        const filtered = allAnnouncements.filter(ann =>
            ann.title.toLowerCase().includes(query) || 
            ann.short_description.toLowerCase().includes(query)
        );
        
        // Use a temporary swap to avoid losing original data
        const originalData = allAnnouncements;
        allAnnouncements = filtered;
        displayPage(1);
        allAnnouncements = originalData; 
    });
}

// Initial Load
loadAnnouncements();
