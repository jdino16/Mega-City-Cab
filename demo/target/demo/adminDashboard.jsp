<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!-- Main Dashboard Container -->
    <div class="dashboard-container">
        <!-- Bookings Card -->
        <div class="dashboard-card">
            <h2>Bookings</h2>
            <p>Total Bookings: <%= request.getAttribute("bookingCount") %></p>
            <a href="viewBookings.jsp">View Bookings</a>
        </div>

        <!-- Cars Card -->
        <div class="dashboard-card">
            <h2>Cars</h2>
            <p>Total Cars: <%= request.getAttribute("carCount") %></p>
            <a href="viewCars.jsp">View Cars</a>
        </div>

        <!-- Drivers Card -->
        <div class="dashboard-card">
            <h2>Drivers</h2>
            <p>Total Drivers: <%= request.getAttribute("driverCount") %></p>
            <a href="viewDrivers.jsp">View Drivers</a>
        </div>

        <!-- Users Card -->
        <div class="dashboard-card">
            <h2>Users</h2>
            <p>Total Users: <%= request.getAttribute("userCount") %></p>
            <a href="viewUsers.jsp">View Users</a>
        </div>
    </div>

    <!-- Links to other parts of the admin dashboard -->
    <div class="admin-links">
        <a href="addCar.jsp">Add New Car</a>
        <a href="addDriver.jsp">Add New Driver</a>
        <a href="addUser.jsp">Add New User</a>
        <a href="addDriver.jsp">Add New Driver</a>
<a href="viewDrivers.jsp">View All Drivers</a>

    </div>
</body>
</html>
