<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add User</title>
    <link rel="stylesheet" href="styles/adduser.css">
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
            <h1><i class="fas fa-user-plus"></i> Add a New User</h1>
        </header>

        <section class="add-user-form">
            <form action="AddUserServlet" method="post" id="userForm">
                <label for="name">Name <i class="fas fa-user"></i>:</label>
                <input type="text" id="name" name="name" required><br><br>

                <label for="email">Email <i class="fas fa-envelope"></i>:</label>
                <input type="email" id="email" name="email" required><br><br>

                <label for="password">Password <i class="fas fa-lock"></i>:</label>
                <input type="password" id="password" name="password" required><br><br>

                <label for="nic">NIC <i class="fas fa-id-card"></i>:</label>
                <input type="text" id="nic" name="nic" required><br><br>

                <label for="phone">Phone <i class="fas fa-phone-alt"></i>:</label>
                <input type="text" id="phone" name="phone" required><br><br>

                <label for="address">Address <i class="fas fa-home"></i>:</label>
                <textarea id="address" name="address"></textarea><br><br>

                <label for="role">Role <i class="fas fa-briefcase"></i>:</label>
                <select id="role" name="role">
                    <option value="admin">Admin</option>
                    <option value="customer">Customer</option>
                    <option value="driver">Driver</option>
                </select><br><br>

                <input type="submit" value="Add User" class="submit-btn">
            </form>
        </section>

    </div>

    <script src="js/adduser.js"></script>
</body>
</html>
