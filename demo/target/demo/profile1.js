document.addEventListener("DOMContentLoaded", function () {
    document.querySelector("form").addEventListener("submit", function (event) {
        const phone = document.getElementById("phone").value.trim();
        const address = document.getElementById("address").value.trim();

        if (!phone || !address) {
            alert("⚠️ Please fill in all required fields.");
            event.preventDefault();
        }
    });

    document.querySelector("#confirmPassword").addEventListener("blur", function () {
        if (document.getElementById("newPassword").value !== this.value) {
            alert("⚠️ Passwords do not match.");
        }
    });
});
