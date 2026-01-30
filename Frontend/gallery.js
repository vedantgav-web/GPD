/* ================== LOAD GALLERY ================== */
document.addEventListener("DOMContentLoaded", loadGallery);

async function loadGallery() {
  try {
    const res = await fetch(`${API_BASE_URL}/common/images`);
    const data = await res.json();

    const albums = {};

    data.forEach(item => {
      if (!item.image) return;

      const albumName = item.album_name && item.album_name.trim() ? item.album_name.trim() : "Other";
      const imgPath = `${IMAGE_BASE_URL}/${item.image.replace(/\\/g, "/")}`;

      if (!albums[albumName]) albums[albumName] = [];
      albums[albumName].push(imgPath);
    });

    render3DAlbums(albums);
  } catch (error) {
    console.error("Failed to load gallery:", error);


  }
}

/* ================== RENDER 3D ALBUMS ================== */
function render3DAlbums(albums) {
  const galleryContainer = document.getElementById("gallery");
  galleryContainer.innerHTML = "";

  Object.keys(albums).forEach(albumName => {
    const images = albums[albumName];
    if (images.length === 0) return;

    // Create Album Section
    const albumSection = document.createElement("div");
    albumSection.className = "album-3d-section";

    const title = document.createElement("h2");
    title.className = "album-title";
    title.textContent = albumName;
    albumSection.appendChild(title);

    // Create 3D Slider Container
    const sliderContainer = document.createElement("div");
    sliderContainer.className = "gallery-container"; // Uses your previous CSS class
    albumSection.appendChild(sliderContainer);

    galleryContainer.appendChild(albumSection);

    // Initialize the 3D Logic for this specific slider
    setup3DLogic(sliderContainer, images);
  });
}

function setup3DLogic(container, images) {
  let currentIndex = 0;

  // Create the 3 image elements
  const leftImg = document.createElement("img");
  const mainImg = document.createElement("img");
  const rightImg = document.createElement("img");

  leftImg.className = "gallery-image small left";
  mainImg.className = "gallery-image main";
  rightImg.className = "gallery-image small right";

  container.append(leftImg, mainImg, rightImg);

  function update() {
    const leftIdx = (currentIndex - 1 + images.length) % images.length;
    const rightIdx = (currentIndex + 1) % images.length;

    leftImg.src = images[leftIdx];
    mainImg.src = images[currentIndex];
    rightImg.src = images[rightIdx];
  }

  // Navigation Logic
  leftImg.onclick = () => {
    currentIndex = (currentIndex - 1 + images.length) % images.length;
    update();
  };

  rightImg.onclick = () => {
    currentIndex = (currentIndex + 1) % images.length;
    update();
  };

  mainImg.onclick = () => {
    currentIndex = (currentIndex + 1) % images.length;
    update();
  };

  update();
}
