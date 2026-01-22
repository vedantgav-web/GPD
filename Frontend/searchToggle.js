const searchContainer = document.querySelector(".search-container");
const searchIcon = document.querySelector(".search-icon");

searchIcon.addEventListener("click", () => {
  searchContainer.classList.toggle("active");
  if (searchContainer.classList.contains("active")) {
    document.getElementById("searchBox").focus();
  }
});
