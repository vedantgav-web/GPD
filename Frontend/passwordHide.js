const toggleButtons = document.querySelectorAll('.toggle_button');

    toggleButtons.forEach(button => {
        const passwordField = button.parentElement.querySelector('.password');

        button.addEventListener('mousedown', () => {
            passwordField.type = 'text';
        });

        button.addEventListener('mouseup', () => {
            passwordField.type = 'password';
        });

        button.addEventListener('mouseleave', () => {
            passwordField.type = 'password';
        });

        // For touch devices (mobile)
        button.addEventListener('touchstart', () => {
            passwordField.type = 'text';
        });
        button.addEventListener('touchend', () => {
            passwordField.type = 'password';
        });
    });