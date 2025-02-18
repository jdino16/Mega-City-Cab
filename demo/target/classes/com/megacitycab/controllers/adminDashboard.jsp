<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Mega City Cab</title>
    <!-- Include your CSS files or libraries here -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
    </header>

    <section class="stats">
        <h2>Statistics</h2>
        <div class="stat-item">
            <p>Total Bookings: <%= request.getAttribute("bookingCount") %></p>
        </div>
        <div class="stat-item">
            <p>Total Cars: <%= request.getAttribute("carCount") %></p>
        </div>
        <div class="stat-item">
            <p>Total Drivers: <%= request.getAttribute("driverCount") %></p>
        </div>
        <div class="stat-item">
            <p>Total Users: <%= request.getAttribute("userCount") %></p>
        </div>
        <div class="stat-item">
            <p>Total Payments: <%= request.getAttribute("paymentCount") %></p>
        </div>
    </section>

    <section class="management-links">
        <h2>Management</h2>
        <ul>
            <li><a href="viewBookings.jsp">View Bookings</a></li>
            <li><a href="viewCars.jsp">View Cars</a></li>
            <li><a href="viewDrivers.jsp">View Drivers</a></li>
            <li><a href="viewUsers.jsp">View Users</a></li>
            <li><a href="viewPayments.jsp">View Payments</a></li>
        </ul>
    </section>

    <footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    </footer>
</body>
</html>
