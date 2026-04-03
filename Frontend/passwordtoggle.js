// passwordtoggle.js

// Select all eye icons with the class 'toggle_button'
const toggleButtons = document.querySelectorAll('.toggle_button');

toggleButtons.forEach(button => {
  button.addEventListener('click', function () {
    // Find the password input field that is in the same container as this button
    const passwordInput = this.parentElement.querySelector('.password');
    
    // Toggle the type attribute
    if (passwordInput.type === 'password') {
      passwordInput.type = 'text';
      this.src = 'images/eye-off.png'; // Optional: Change to a "hidden" eye icon if you have one
    } else {
      passwordInput.type = 'password';
      this.src = 'images/eye.png'; // Change back to the original eye icon
    }
  });
});
