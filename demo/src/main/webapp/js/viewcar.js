document.addEventListener("DOMContentLoaded", function() {
    // Select all edit and delete links using valid classes or data attributes
    const editLinks = document.querySelectorAll('.edit-link');
    const deleteLinks = document.querySelectorAll('.delete-link');

    // Add event listener for editing cars
    editLinks.forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault(); // Prevent default link action
            const carId = this.getAttribute('data-car-id'); // Get car ID from data attribute
            window.location.href = `editCar.jsp?carId=${carId}`; // Redirect to editCar.jsp with carId
        });
    });

    // Add event listener for deleting cars
    deleteLinks.forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault(); // Prevent default link action
            if (confirm('Are you sure you want to delete this car?')) {
                const carId = this.getAttribute('data-car-id'); // Get car ID from data attribute
                window.location.href = `deleteCarServlet?carId=${carId}`; // Redirect to deleteCarServlet with carId
            }
        });
    });
});
