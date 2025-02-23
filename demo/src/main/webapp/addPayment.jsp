<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Payment</title>
    <link rel="stylesheet" href="styles/addpaymnet.css">
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
            <h1><i class="fas fa-credit-card"></i> Add a New Payment</h1>
        </header>

        <section class="add-payment-form">
            <form action="AddPaymentServlet" method="post" id="paymentForm">
                <label for="user_id">User ID <i class="fas fa-user"></i>:</label>
                <input type="number" id="user_id" name="user_id" required><br><br>

                <label for="booking_id">Booking ID <i class="fas fa-calendar-check"></i>:</label>
                <input type="number" id="booking_id" name="booking_id" required><br><br>

                <label for="amount">Amount <i class="fas fa-dollar-sign"></i>:</label>
                <input type="number" step="0.01" id="amount" name="amount" required><br><br>

                <label for="payment_method">Payment Method <i class="fas fa-credit-card"></i>:</label>
                <input type="text" id="payment_method" name="payment_method" required><br><br>

                <label for="status">Status <i class="fas fa-info-circle"></i>:</label>
                <select id="status" name="status">
                    <option value="Unpaid">Unpaid</option>
                    <option value="Paid">Paid</option>
                </select><br><br>

                <input type="submit" value="Add Payment" class="submit-btn">
            </form>
        </section>
    </div>

    <script src="js/addpaymnet.js"></script>
</body>
</html>
