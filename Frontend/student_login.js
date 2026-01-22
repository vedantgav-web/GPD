const enrollmentNo = localStorage.getItem("enrollment_no");

if (!enrollmentNo) {
  window.location.href = "index.html";
}
