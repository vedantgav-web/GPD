/* ================== LOAD GALLERY ================== */
document.addEventListener("DOMContentLoaded", loadGallery);

async function loadGallery() {
  const galleryContainer = document.getElementById("gallery");
  
  try {
    // 1. Fetch images from the backend
    const res = await fetch(`${API_BASE_URL}/common/images`);
    if (!res.ok) throw new Error("Failed to fetch gallery data");
    
    const data = await res.json();
    const albums = {};

    // 2. Process each image path
    data.forEach(item => {
      if (!item.image) return;

      const albumName = item.album_name && item.album_name.trim() 
        ? item.album_name.trim() 
        : "Other";
      
      let imgPath;

      // Check if it's a Cloudinary URL (starts with http)
      if (item.image.startsWith('http')) {
        imgPath = item.image;
      } else {
        // It's a local file - we must add the /uploads/ prefix
        // We also fix backslashes just in case they exist in the DB
        const cleanPath = item.image.replace(/\\/g, "/");
        
        // Ensure we don't double up on slashes
        const folderPrefix = cleanPath.startsWith('/') ? 'uploads' : '/uploads/';
        imgPath = `${IMAGE_BASE_URL}${folderPrefix}${cleanPath}`;
      }

      if (!albums[albumName]) albums[albumName] = [];
      albums[albumName].push(imgPath);
    });

    // 3. Render the processed albums
    render3DAlbums(albums);

  } catch (error) {
    console.error("Gallery Error:", error);
    if (galleryContainer) {
      galleryContainer.innerHTML = `<p class="error-msg">Unable to load gallery: ${error.message}</p>`;
    }
  }
}

/* ================== RENDER 3D ALBUMS ================== */
function render3DAlbums(albums) {
  const galleryContainer = document.getElementById("gallery");
  if (!galleryContainer) return;
  
  galleryContainer.innerHTML = "";

  const albumKeys = Object.keys(albums);
  if (albumKeys.length === 0) {
    galleryContainer.innerHTML = "<p class='no-data'>No photos found in the gallery.</p>";
    return;
  }

  albumKeys.forEach(albumName => {
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
    sliderContainer.className = "gallery-container"; 
    albumSection.appendChild(sliderContainer);

    galleryContainer.appendChild(albumSection);

    // Initialize the 3D Logic
    setup3DLogic(sliderContainer, images);
  });
}

/* ================== 3D SLIDER LOGIC ================== */
function setup3DLogic(container, images) {
  let currentIndex = 0;

  // Create the 3 image elements
  const leftImg = document.createElement("img");
  const mainImg = document.createElement("img");
  const rightImg = document.createElement("img");

  leftImg.className = "gallery-image small left";
  mainImg.className = "gallery-image main";
  rightImg.className = "gallery-image small right";

  // Add error handling for broken images
  [leftImg, mainImg, rightImg].forEach(img => {
    img.onerror = () => {
      img.src = "https://via.placeholder.com/400x300?text=Image+Not+Found";
    };
  });

  container.append(leftImg, mainImg, rightImg);

  function update() {
    if (images.length === 0) return;
    
    const leftIdx = (currentIndex - 1 + images.length) % images.length;
    const rightIdx = (currentIndex + 1) % images.length;

    leftImg.src = images[leftIdx];
    mainImg.src = images[currentIndex];
    rightImg.src = images[rightIdx];
  }

  // Click Navigation
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
