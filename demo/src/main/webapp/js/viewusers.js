document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".edit-user").forEach(editBtn => {
        editBtn.addEventListener("click", function (event) {
            event.preventDefault(); // Prevent default anchor behaviour
            const userId = this.getAttribute("data-user-id");
            if (userId) {
                window.location.href = `editUser.jsp?userId=${userId}`;
            }
        });
    });

    document.querySelectorAll(".delete-user").forEach(deleteBtn => {
        deleteBtn.addEventListener("click", function (event) {
            if (!confirm("⚠️ Are you sure you want to delete this user?")) {
                event.preventDefault();
            }
        });
    });
});
