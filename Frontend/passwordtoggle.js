document.querySelectorAll(".toggle_button").forEach(btn => {
    btn.addEventListener("click", () => {

        const passwordInput = btn.previousElementSibling;

        if (passwordInput.type === "password") {
            passwordInput.type = "text";
            btn.src = "images/eye-off.png";
        } else {
            passwordInput.type = "password";
            btn.src = "images/eye.png";
        }

    });
});
