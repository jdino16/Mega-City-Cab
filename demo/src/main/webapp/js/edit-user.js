document.addEventListener("DOMContentLoaded", function () {
    // Elements
    const form = document.querySelector("form");
    const emailInput = document.getElementById("email");
    const phoneInput = document.getElementById("phone");
    const nicInput = document.getElementById("nic");
    const addressInput = document.getElementById("address");
    const submitBtn = document.querySelector("input[type='submit']");

    // Email Validation (Simple Format Check)
    emailInput.addEventListener("input", function () {
        const emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        validateInput(emailInput, emailPattern);
    });

    // Phone Number Validation (Sri Lankan Format - 10 digits)
    phoneInput.addEventListener("input", function () {
        const phonePattern = /^\d{10}$/;
        validateInput(phoneInput, phonePattern);
    });

    // NIC Validation (Sri Lankan NIC - Old: 9 digits + V/X | New: 12 digits)
    nicInput.addEventListener("input", function () {
        const nicPattern = /^(\d{9}[VXvx]|\d{12})$/;
        validateInput(nicInput, nicPattern);
    });

    // Address Character Count (Max: 150)
    addressInput.addEventListener("input", function () {
        const maxLength = 150;
        let remaining = maxLength - addressInput.value.length;
        if (remaining < 0) {
            addressInput.value = addressInput.value.substring(0, maxLength);
            remaining = 0;
        }
        updateCharCount("address-count", remaining);
    });

    // Update Character Count Display
    function updateCharCount(id, count) {
        let counter = document.getElementById(id);
        if (!counter) {
            counter = document.createElement("small");
            counter.id = id;
            counter.style.display = "block";
            counter.style.color = "var(--primary-color)";
            counter.style.marginTop = "5px";
            addressInput.parentNode.appendChild(counter);
        }
        counter.textContent = `Remaining characters: ${count}`;
    }

    // Validate Inputs and Add/Remove Error Class
    function validateInput(input, pattern) {
        if (pattern.test(input.value)) {
            input.style.border = "2px solid #0f0"; // Green border
        } else {
            input.style.border = "2px solid #f00"; // Red border
        }
    }

    // Form Submission Confirmation
    form.addEventListener("submit", function (event) {
        if (!confirm("Are you sure you want to update this user?")) {
            event.preventDefault();
        }
    });
});
