document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("signupForm");

    form.addEventListener("submit", function (event) {
        let isValid = true;

        const username = document.getElementById("username");
        const email = document.getElementById("email");
        const password = document.getElementById("password");
        const nic = document.getElementById("nic");
        const phone = document.getElementById("phone");
        const address = document.getElementById("address");

        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        const phoneRegex = /^[0-9]{10}$/;

        // Username validation
        if (username.value.trim() === "") {
            showError("usernameError", "Username is required.");
            isValid = false;
        } else {
            clearError("usernameError");
        }

        // Email validation
        if (!emailRegex.test(email.value)) {
            showError("emailError", "Enter a valid email address.");
            isValid = false;
        } else {
            clearError("emailError");
        }

        // Password validation (Minimum 6 characters)
        if (password.value.length < 6) {
            showError("passwordError", "Password must be at least 6 characters.");
            isValid = false;
        } else {
            clearError("passwordError");
        }

        // NIC validation
        if (nic.value.trim() === "") {
            showError("nicError", "NIC is required.");
            isValid = false;
        } else {
            clearError("nicError");
        }

        // Phone number validation
        if (!phoneRegex.test(phone.value)) {
            showError("phoneError", "Enter a valid 10-digit phone number.");
            isValid = false;
        } else {
            clearError("phoneError");
        }

        // Address validation
        if (address.value.trim() === "") {
            showError("addressError", "Address is required.");
            isValid = false;
        } else {
            clearError("addressError");
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
