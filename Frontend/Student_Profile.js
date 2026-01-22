const enrollmentNo = localStorage.getItem("enrollment_no");



if (!enrollmentNo) {
  console.error("No enrollment number in localStorage");
  window.location.href = "index.html";
}

async function loadStudentProfile() {
  try {

    const res = await fetch(`${API_BASE_URL}/getset/student/${enrollmentNo}`);
    console.log("Fetch response status:", res.status);
console.log("Fetch response ok:", res.ok);


    if (!res.ok) {
      alert("Unable to load student profile");
      return;
    }
    const data = await res.json();
    // Fill fields
    document.getElementById("enrollment_no").value = data.enrollment_no;
    document.getElementById("roll_no").value = data.roll_no || "";
    document.getElementById("name").value = data.name || "";
    document.getElementById("branch").value = data.branch || "";
    document.getElementById("phone").value = data.phone_no || "";
    document.getElementById("email").value = data.email || "";
    document.getElementById("parent_phone").value = data.parents_phone_no || "";
    document.getElementById("address").value = data.address || "";
    document.getElementById("semester").value = data.semester || "1st";

  } catch (err) {
    console.error(err);
    alert("Server not reachable");
  }
}

loadStudentProfile();

// ========== SELECT ELEMENTS ==========
const form = document.querySelector('.profile-form');
const editButtons = document.querySelectorAll('.field-edit-btn');
const saveBtn = document.getElementById('saveBtn');

const modal = document.getElementById('confirmationModal');
const confirmBtn = document.getElementById('confirmBtn');
const cancelBtn = document.getElementById('cancelBtn');

const photoEditTrigger = document.getElementById('photoEditTrigger');
const photoUploadInput = document.getElementById('photoUpload');
const studentPhoto = document.getElementById('studentPhoto');

// ========== INITIAL SETUP ==========
saveBtn.style.display = 'none';
const editedFields = new Set();

// ========== EDIT FIELD BUTTON LOGIC ==========
editButtons.forEach(button => {
  button.addEventListener('click', () => {
    const parent = button.parentElement;
    const input = parent.querySelector('input, select, textarea');

    if (input) {
      input.disabled = false;
      input.focus();
      button.style.display = 'none';
      saveBtn.style.display = 'inline-block';

      const fieldName = input.getAttribute('name');
      if (fieldName) editedFields.add(fieldName);
    }
  });
});

// ========== SAVE BUTTON LOGIC ==========
saveBtn.addEventListener('click', (e) => {
  e.preventDefault();

  // Grab inputs
  const phone = form.querySelector('input[name="phone"]');
  const email = form.querySelector('input[name="email"]');
  const parentPhone = form.querySelector('input[name="parentPhone"]');

  // Flags
  let hasValidationError = false;

  // Reset border styles
  [phone, email, parentPhone].forEach(input => {
    if (input) input.style.border = '1px solid #ccc';
  });

  // Validate only if edited
  if (editedFields.has('phone') && phone && !/^\d{10}$/.test(phone.value.trim())) {
    phone.style.border = '2px solid red';
    hasValidationError = true;
  }

  if (editedFields.has('email') && email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value.trim())) {
    email.style.border = '2px solid red';
    hasValidationError = true;
  }

  if (editedFields.has('parentPhone') && parentPhone && !/^\d{10}$/.test(parentPhone.value.trim())) {
    parentPhone.style.border = '2px solid red';
    hasValidationError = true;
  }

  if (hasValidationError) {
    alert("❌ Please correct the invalid fields before saving.");
    return;
  }

  // All valid — show modal
  modal.style.display = 'flex';
});

// ========== MODAL CONFIRMATION ==========
// ========== MODAL CONFIRMATION ==========
confirmBtn.addEventListener('click', async () => {
  // 1. Gather the updated data from the input fields
  const updatedData = {
    // Make sure these IDs match your HTML exactly
    name: document.getElementById("name").value,
    email: document.getElementById("email").value,
    phone_no: document.getElementById("phone").value, 
    parents_phone_no: document.getElementById("parent_phone").value,
    address: document.getElementById("address").value,
    roll_no: document.getElementById("roll_no").value,
    semester: document.getElementById("semester").value

    // Add other fields if you allow editing them
  };

  try {
    // 2. Send PUT request to server
    const res = await fetch(`${API_BASE_URL}/getset/student-update/${enrollmentNo}`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(updatedData)
    });

    const result = await res.json();

    if (res.ok) {
      alert("✅ Profile updated successfully!");

      // 3. UI Reset (Only run this if update was successful)
      const inputs = form.querySelectorAll('input, select, textarea');
      inputs.forEach(input => {
        if (!input.hasAttribute('readonly')) {
          input.disabled = true;
        }
      });

      editButtons.forEach(button => {
        button.style.display = 'inline-block';
        button.innerHTML = '<img src="images/pencil.png" alt="Edit">';
      });

      saveBtn.style.display = 'none';
      editedFields.clear();
      
    } else {
      alert("❌ Error: " + result.message);
    }

  } catch (err) {
    console.error(err);
    alert("Server not reachable");
  } finally {
    modal.style.display = 'none';
  }
});

cancelBtn.addEventListener('click', () => {
  modal.style.display = 'none';
});

window.addEventListener('click', (e) => {
  if (e.target === modal) {
    modal.style.display = 'none';
  }
});

// ========== PHOTO UPLOAD ==========
if (photoEditTrigger && photoUploadInput && studentPhoto) {
  photoEditTrigger.addEventListener('click', () => {
    photoUploadInput.click();
  });

  photoUploadInput.addEventListener('change', (event) => {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function (e) {
        studentPhoto.src = e.target.result;
      };
      reader.readAsDataURL(file);
    }
  });
}
