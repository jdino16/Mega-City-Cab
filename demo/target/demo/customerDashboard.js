document.addEventListener("DOMContentLoaded", function () {
    // Example of dynamic stats update
    fetch("getDashboardStats")
        .then(response => response.json())
        .then(data => {
            document.getElementById("upcomingBookingsCount").innerText = data.upcomingBookings;
            document.getElementById("completedRidesCount").innerText = data.completedRides;
            document.getElementById("totalSpent").innerText = "$" + data.totalSpent;
        });

    // Simulate booking history update
    function loadBookings() {
        document.getElementById("bookingTable").innerHTML = `
            <tr>
                <td>1023</td>
                <td>Main Street</td>
                <td>Airport</td>
                <td>2025-03-15</td>
                <td>Confirmed</td>
            </tr>
        `;
    }

    loadBookings();
});
