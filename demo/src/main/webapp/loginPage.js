document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("loginForm");

    form.addEventListener("submit", function (event) {
        let isValid = true;

        const email = document.getElementById("email");
        const password = document.getElementById("password");

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        // Email validation
        if (!emailRegex.test(email.value)) {
            showError("emailError", "Enter a valid email address.");
            isValid = false;
        } else {
            clearError("emailError");
        }

        // Password validation
        if (password.value.length < 6) {
            showError("passwordError", "Password must be at least 6 characters.");
            isValid = false;
        } else {
            clearError("passwordError");
        }

        if (!isValid) {
            event.preventDefault(); // Stop form submission if validation fails
        }
    });

    function showError(elementId, message) {
        document.getElementById(elementId).textContent = message;
        document.getElementById(elementId).style.color = "red";
    }

    function clearError(elementId) {
        document.getElementById(elementId).textContent = "";
    }
});
