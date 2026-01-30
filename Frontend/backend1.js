/* ================= STUDENT LOGIN ================= */
async function studentLogin() {
  const enrollment_no = document.getElementById("studentUsername").value;
  const phone_no = document.getElementById("studentPassword").value;

  try {
    const res = await fetch(`${API_BASE_URL}/auth/student-login`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ enrollment_no, phone_no })
    });

    const data = await res.json();
    console.log("Login API response:", data);
    if (res.ok) {
      localStorage.setItem("enrollment_no",data.enrollment_no);
      window.location.href = "post_login.html";
    } else {
      alert(data.message);
    }
  } catch (err) {
    alert("Server not reachable");
  }
}

/* ================= ADMIN LOGIN ================= */
async function adminLogin() {
  const username = document.getElementById("adminUsername").value;
  const password = document.getElementById("adminPassword").value;

  try {
    const res = await fetch(`${API_BASE_URL}/auth/staff-login`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ username, password })
    });

    const data = await res.json();

    if (res.ok) {
      localStorage.setItem("staff", JSON.stringify(data.staff));
      window.location.href = "admin_dashboard.html";
    } else {
      alert(data.message);
    }
  } catch (err) {
    alert("Server not reachable");
  }
}
