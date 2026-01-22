const staffData = JSON.parse(localStorage.getItem("staff"));

if (!staffData || !staffData.username) {
    window.location.href = "index.html";
}

const username = staffData.username;

const form = document.querySelector('.profile-form');
const editButtons = document.querySelectorAll('.field-edit-btn');
const saveBtn = document.getElementById('saveBtn');

const modal = document.getElementById('confirmationModal');
const confirmBtn = document.getElementById('confirmBtn');
const cancelBtn = document.getElementById('cancelBtn');

saveBtn.style.display = 'none';
const editedFields = new Set();

async function loadStaffProfile() {
    try {
        const res = await fetch(`${API_BASE_URL}/getset/staff/${username}`);
        
        if (!res.ok) {
            alert("Could not load profile data");
            return;
        }

        const data = await res.json();

        // 4. Fill the form with real data
        document.getElementById("adminName").value = data.full_name || "";
        document.getElementById("adminUsername").value = data.username || "";
        document.getElementById("adminPhone").value = data.phone || "";
        document.getElementById("adminEmail").value = data.email || "";
        document.getElementById("adminPassword").value = "********";

    } catch (err) {
        console.error("Error loading profile:", err);
    }
}

// Run the loader
loadStaffProfile();

// === Enable editing ===
editButtons.forEach(button => {
  button.addEventListener('click', () => {
    const parent = button.parentElement;
    const input = parent.querySelector('input');

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

// === Save button click ===
saveBtn.addEventListener('click', (e) => {
  e.preventDefault();

  const phone = form.querySelector('input[name="phone"]');
  const email = form.querySelector('input[name="email"]');

  let hasError = false;

  [phone, email].forEach(input => {
    if (input) input.style.border = '1px solid #ccc';
  });

  if (editedFields.has('phone') && phone && !/^\d{10}$/.test(phone.value.trim())) {
    phone.style.border = '2px solid red';
    hasError = true;
  }

  if (editedFields.has('email') && email && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value.trim())) {
    email.style.border = '2px solid red';
    hasError = true;
  }

  if (hasError) {
    alert("❌ Please enter valid values for phone and email.");
    return;
  }

  // ✅ All good → show modal
  modal.style.display = 'flex';
});

// === Confirm save ===
confirmBtn.addEventListener('click', async () => {
  const updatedData = {
    full_name: document.getElementById("adminName").value,
    phone: document.getElementById("adminPhone").value,
    email: document.getElementById("adminEmail").value
  };
  console.log("username " +username);

  try {
    const res = await fetch(
      `${API_BASE_URL}/getset/staff-update/${username}`,
      {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(updatedData)
      }
    );

    const result = await res.json();

    if (res.ok) {
      alert("✅ Profile updated in database!");

      const inputs = form.querySelectorAll('input');
      inputs.forEach(input => input.disabled = true);

      editButtons.forEach(button => {
        button.style.display = 'inline-block';
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


// === Cancel modal ===
cancelBtn.addEventListener('click', () => {
  modal.style.display = 'none';
});

window.addEventListener('click', (e) => {
  if (e.target === modal) {
    modal.style.display = 'none';
  }
});


