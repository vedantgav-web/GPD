// Link this file in your HTML: <script src="admin_operations.js"></script>

document.addEventListener("DOMContentLoaded", () => {

    // --- 1. HANDLE ADD STUDENT FORM ---
    const addStudentForm = document.getElementById("addStudentForm");

    if (addStudentForm) {
        addStudentForm.addEventListener("submit", async (e) => {
            e.preventDefault(); // Stop page reload
            const semesterValue = document.getElementById("stuSem").value;
            // Gather data
            const studentData = {
                name: document.getElementById("stuName").value,
                enrollment_no: document.getElementById("stuEnroll").value,
                roll_no: document.getElementById("stuRoll").value,
                branch: document.getElementById("stuBranch").value,
                semester: semesterValue === "" ? 1 : semesterValue,
                academic_year: document.getElementById("stuYear").value,
                phone_no: document.getElementById("stuPhone").value,
                email: document.getElementById("stuEmail").value
            };

            try {
                const res = await fetch(`${API_BASE_URL}/students/addStudent`, {
                    method: "POST",
                    headers: { "Content-Type": "application/json" },
                    body: JSON.stringify(studentData)
                });

                const result = await res.json();

                if (res.ok) {
                    alert("✅ Student Added Successfully!");
                    addStudentForm.reset(); // Clear the form
                } else {
                    alert("❌ Error: " + result.message);
                }
            } catch (err) {
                console.error(err);
                alert("Server error. Check console.");
            }
        });
    }

    // You will add listeners for other forms (Add Admin, Add Announcement) here later...
});

// ... existing addStudent logic ...

// --- 2. HANDLE UPDATE STUDENT FORM ---
const updateStudentForm = document.getElementById("updateStudentForm");
if (updateStudentForm) {
    updateStudentForm.addEventListener("submit", async (e) => {
        e.preventDefault();

        const updateData = {
            enrollment_no: document.getElementById("updateEnroll").value,
            name: document.getElementById("updateName").value,
            roll_no: document.getElementById("updateRoll").value,
            branch: document.getElementById("updateBranch").value,
            semester: document.getElementById("updateSem").value,
            phone_no: document.getElementById("updatePhone").value,
            email: document.getElementById("updateEmail").value
        };

        // Basic check to ensure enrollment no is provided
        if (!updateData.enrollment_no) {
            alert("Please enter Enrollment Number");
            return;
        }

        try {
            const res = await fetch(`${API_BASE_URL}/students/updateStudent`, {
                method: "PUT",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(updateData)
            });

            const result = await res.json();
            if (res.ok) {
                alert("✅ " + result.message);
                updateStudentForm.reset();
            } else {
                alert("❌ Error: " + result.message);
            }
        } catch (err) {
            console.error(err);
            alert("Server error");
        }
    });
}

// --- 3. HANDLE DELETE STUDENT FORM ---
const deleteStudentForm = document.getElementById("deleteStudentForm");
if (deleteStudentForm) {
    deleteStudentForm.addEventListener("submit", async (e) => {
        e.preventDefault();

        const enrollmentNo = document.getElementById("deleteEnroll").value;

        if (!enrollmentNo) {
            alert("Please enter an Enrollment Number");
            return;
        }

        if (!confirm(`Are you sure you want to delete student: ${enrollmentNo}?`)) {
            return; // Stop if user clicks Cancel
        }

        try {
            const res = await fetch(`${API_BASE_URL}/students/deleteStudent/${enrollmentNo}`, {
                method: "DELETE"
            });

            const result = await res.json();
            if (res.ok) {
                alert("✅ " + result.message);
                deleteStudentForm.reset();
            } else {
                alert("❌ Error: " + result.message);
            }
        } catch (err) {
            console.error(err);
            alert("Server error");
        }
    });
}

// --- 4. HANDLE ADD ADMIN FORM ---
const addAdminForm = document.getElementById("addAdminForm");
//const addAdminForm = document.querySelector('section:nth-of-type(6) form'); // Selecting by section order
if (addAdminForm) {
    addAdminForm.addEventListener("submit", async (e) => {
        e.preventDefault();
        const inputs = addAdminForm.querySelectorAll('input');
        const adminData = {
            username: addAdminForm.querySelector('input[placeholder="Enter username"]').value,
            password: addAdminForm.querySelector('input[placeholder="Enter password"]').value,
            full_name: addAdminForm.querySelector('input[placeholder="Enter admin name"]').value,
            phone: addAdminForm.querySelector('input[placeholder="Enter phone number"]').value,
            email: addAdminForm.querySelector('input[placeholder="Enter email address"]').value
        };

        try {
            const res = await fetch(`${API_BASE_URL}/admins/addAdmin`, { // Adjust route if needed
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(adminData)
            });
            const result = await res.json();
            if (res.ok) {
                alert("✅ Admin Added!");
                addAdminForm.reset();
            } else {
                alert("❌ Error: " + result.message);
            }
        } catch (err) { console.error(err); }
    });
}

// --- 5. HANDLE UPDATE ADMIN FORM ---
const updateAdminForm = document.getElementById("updateAdminForm");

if (updateAdminForm) {
    updateAdminForm.addEventListener("submit", async (e) => {
        e.preventDefault();

        const updateData = {
            username: document.getElementById("targetAdminUser").value,
            full_name: document.getElementById("upAdminName").value,
            phone: document.getElementById("upAdminPhone").value,
            email: document.getElementById("upAdminEmail").value
        };

        try {
            const res = await fetch(`${API_BASE_URL}/admins/updateAdmin`, {
                method: "PUT",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(updateData)
            });

            const result = await res.json();

            if (res.ok) {
                alert("✅ Admin updated successfully!");
                updateAdminForm.reset();
            } else {
                alert("❌ Error: " + result.message);
            }
        } catch (err) {
            console.error(err);
            alert("Server error. Check console.");
        }
    });
}
// --- 6. HANDLE DELETE ADMIN FORM ---
const deleteAdminForm = document.getElementById('deleteAdminForm');

if (deleteAdminForm) {
    deleteAdminForm.addEventListener("submit", async (e) => {
        e.preventDefault();
        const username = deleteAdminForm.querySelector('input').value;

        if (!confirm(`Delete admin ${username}?`)) return;

        try {
            // Updated fetch to send username in the URL path
            const res = await fetch(`${API_BASE_URL}/admins/deleteAdmin/${username}`, {
                method: "DELETE"
            });

            const result = await res.json();
            if (res.ok) {
                alert("🗑️ Admin Removed");
                deleteAdminForm.reset();
            } else {
                alert("❌ " + result.message);
            }
        } catch (err) {
            console.error(err);
            alert("Server error");
        }
    });
}

// --- HANDLE ADD ANNOUNCEMENT ---addAnnouncementForm
const addAnnouncementForm = document.getElementById("addAnnouncementForm");
//const addAnnouncementForm = document.querySelector('section:nth-of-type(3) form');
if (addAnnouncementForm) {
    addAnnouncementForm.addEventListener("submit", async (e) => {
        e.preventDefault();

        const formData = new FormData();
        formData.append("title", addAnnouncementForm.querySelector('input[type="text"]').value);
        formData.append("short_description", addAnnouncementForm.querySelectorAll('textarea')[0].value);
        formData.append("long_description", addAnnouncementForm.querySelectorAll('textarea')[1].value);

        const fileInput = addAnnouncementForm.querySelector('input[type="file"]');

        // Only append files if the user actually selected some
        if (fileInput.files.length > 0) {
            for (let i = 0; i < fileInput.files.length; i++) {
                formData.append("attachments", fileInput.files[i]);
            }
        }

        try {
            const res = await fetch(`${API_BASE_URL}/content/announcement/add`, {
                method: "POST",
                body: formData // No Content-Type header needed
            });

            const result = await res.json();
            if (res.ok) {
                alert("✅ Announcement published!");
                addAnnouncementForm.reset();
            } else {
                alert("❌ Error: " + result.message);
            }
        } catch (err) {
            console.error(err);
        }
    });
}
// --- HANDLE DELETE ANNOUNCEMENT ---
const deleteAnnouncementForm = document.getElementById("deleteAnnouncementForm");
if (deleteAnnouncementForm) {
    deleteAnnouncementForm.addEventListener("submit", async (e) => {
        e.preventDefault();
        const id = deleteAnnouncementForm.querySelector('input').value;
        if (!confirm("Delete this announcement?")) return;

        const res = await fetch(`${API_BASE_URL}/content/announcement/delete/${id}`, { method: "DELETE" });
        const result = await res.json();
        alert(result.message);
        if (res.ok) deleteAnnouncementForm.reset();
    });
}

// --- HANDLE ADD LINK ---
const addLinkForm = document.getElementById("addLinkForm");
if (addLinkForm) {
    addLinkForm.addEventListener("submit", async (e) => {
        e.preventDefault();
        const data = {
            name: addLinkForm.querySelector('input[type="text"]').value,
            link: addLinkForm.querySelector('input[type="url"]').value
        };

        const res = await fetch(`${API_BASE_URL}/content/link/add`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data)
        });
        const result = await res.json();
        alert(result.message);
        if (res.ok) addLinkForm.reset();
    });
}

// --- SHORT DELETE LINK ---
const deleteLinkForm = document.getElementById("deleteLinkForm");
if (deleteLinkForm) {
    deleteLinkForm.addEventListener("submit", async (e) => {
        e.preventDefault();
        const id = deleteLinkForm.querySelector('input').value;
        if (!confirm("Delete this link?")) return;

        const res = await fetch(`${API_BASE_URL}/content/link/delete/${id}`, { method: "DELETE" });
        const result = await res.json();
        alert(result.message);
        if (res.ok) deleteLinkForm.reset();
    });
}

// --- HANDLE ADD PHOTOS ---
// --- HANDLE ADD PHOTOS ---addImageform
const addPhotoForm = document.getElementById("addImageform");

if (addPhotoForm) {
    addPhotoForm.addEventListener("submit", async (e) => {
        e.preventDefault();

        const formData = new FormData();
        const fileInput = addPhotoForm.querySelector('input[type="file"]');

        // 1. Get the title value and append it
        const titleValue = document.getElementById("imageTitle").value;
        formData.append("title", titleValue);

        const albumName = document.getElementById("albumNameInput").value || "General";

        formData.append("album_name", albumName);



        // 2. Loop and append the images
        for (let i = 0; i < fileInput.files.length; i++) {
            formData.append("photos", fileInput.files[i]);
        }

        try {
            const res = await fetch(`${API_BASE_URL}/gallery/add`, {
                method: "POST",
                body: formData
            });

            const result = await res.json();
            alert(result.message);
            if (res.ok) addPhotoForm.reset();
        } catch (err) {
            console.error("Upload error:", err);
        }
    });
}
// --- HANDLE DELETE PHOTO ---deleteImageForm
// const deletePhotoForm = document.querySelector('section:nth-of-type(8) form');
const deletePhotoForm = document.getElementById("deleteImageForm");
if (deletePhotoForm) {
    deletePhotoForm.addEventListener("submit", async (e) => {
        e.preventDefault();
        const id = deletePhotoForm.querySelector('input').value;

        if (!confirm("Are you sure you want to delete this photo?")) return;

        const res = await fetch(`${API_BASE_URL}/gallery/delete/${id}`, {
            method: "DELETE"
        });

        const result = await res.json();
        alert(result.message);
        if (res.ok) deletePhotoForm.reset();
    });
}