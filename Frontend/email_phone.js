document.addEventListener('DOMContentLoaded', function () {
  const forms = document.querySelectorAll('.admin-form');

  forms.forEach(form => {
    form.addEventListener('submit', function (event) {
      const phoneInputs = form.querySelectorAll('input[type="tel"]');
      const emailInputs = form.querySelectorAll('input[type="email"]');

      let hasError = false;

      // Reset all input borders first
      [...phoneInputs, ...emailInputs].forEach(input => {
        input.style.border = '1px solid #aaa';
      });

      // Validate phone inputs (10 digits)
      phoneInputs.forEach(phone => {
        const value = phone.value.trim();
        if (value && !/^\d{10}$/.test(value)) {
          phone.style.border = '2px solid red';
          hasError = true;
        }
      });

      // Validate email inputs
      emailInputs.forEach(email => {
        const value = email.value.trim();
        if (value && !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) {
          email.style.border = '2px solid red';
          hasError = true;
        }
      });

      if (hasError) {
        event.preventDefault();
        alert("❌ Please correct the highlighted email or phone number fields.");
      }
    });
  });
});
