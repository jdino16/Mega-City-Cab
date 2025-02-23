<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Car</title>
    <link rel="stylesheet" href="styles/addcar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>


    <div class="sidebar-left">
        <div class="sidebar-links">
            <a href="index.jsp" class="nav-link"><i class="fas fa-home"></i> Home</a>
            <a href="company.jsp" class="nav-link"><i class="fas fa-building"></i> Company</a>
            <a href="customerDashboard.jsp" class="nav-link"><i class="fas fa-tachometer-alt"></i> Customer Dashboard</a>
            <a href="support.jsp" class="nav-link"><i class="fas fa-question-circle"></i> Help</a>
            <a href="logout.jsp" class="nav-link"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>


    <div class="sidebar-right">
        <div class="action-buttons">
            <a href="viewBookings.jsp" class="action-btn">📅 View Bookings</a>
            <a href="viewCars.jsp" class="action-btn">🚗 View Cars</a>
            <a href="viewDrivers.jsp" class="action-btn">👨‍🔧 View Drivers</a>
            <a href="viewUsers.jsp" class="action-btn">👤 View Users</a>
            <a href="viewPayments.jsp" class="action-btn">💳 View Payments</a>
            <a href="addBooking.jsp" class="action-btn">📅 Add Booking</a>
            <a href="addCar.jsp" class="action-btn">🚗 Add Car</a>
            <a href="addDriver.jsp" class="action-btn">👨‍🔧 Add Driver</a>
            <a href="addUser.jsp" class="action-btn">👤 Add User</a>
            <a href="addPayment.jsp" class="action-btn">💳 Add Payment</a>
        </div>
    </div>


    <div class="content">
        <header>
            <h1><i class="fas fa-car"></i> Add a New Car</h1>
        </header>

        <section class="add-car-form">
            <form action="AddCarServlet" method="post" id="carForm">
                <label for="carName">Car Name <i class="fas fa-car-side"></i>:</label>
                <input type="text" id="carName" name="carName" required><br><br>

                <label for="carModel">Car Model <i class="fas fa-cogs"></i>:</label>
                <input type="text" id="carModel" name="carModel" required><br><br>

                <label for="carType">Car Type <i class="fas fa-car-alt"></i>:</label>
                <input type="text" id="carType" name="carType" required><br><br>

                <label for="year">Year <i class="fas fa-calendar-alt"></i>:</label>
                <input type="number" id="year" name="year" required><br><br>

                <label for="registrationNumber">Registration Number <i class="fas fa-id-card"></i>:</label>
                <input type="text" id="registrationNumber" name="registrationNumber" required><br><br>

                <label for="status">Status <i class="fas fa-info-circle"></i>:</label>
                <select id="status" name="status">
                    <option value="Available">Available</option>
                    <option value="Unavailable">Unavailable</option>
                </select><br><br>

                <input type="submit" value="Add Car" class="submit-btn">
            </form>
        </section>
    </div>

    <script src="js/addcar.js"></script>
</body>
</html>
