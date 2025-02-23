<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Mega City Cab</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <link rel="stylesheet" href="styles/adminDashboard.css">
    <script src="js/adminDashboard.js" defer></script>
</head>
<body>

<%
    // Ensure user is logged in and is an admin
    Object userRoleObj = session.getAttribute("role");
    if (userRoleObj == null || !userRoleObj.equals("admin")) {
        response.sendRedirect("LoginPage.jsp");
        return;
    }

    Connection conn = DatabaseUtil.getConnection();

    // Initialize variables for the statistics
    int bookingCount = 0;
    int carCount = 0;
    int driverCount = 0;
    int userCount = 0;
    int paymentCount = 0;

    // Get total bookings count
    String sqlBookings = "SELECT COUNT(*) FROM bookings";
    PreparedStatement stmtBookings = conn.prepareStatement(sqlBookings);
    ResultSet rsBookings = stmtBookings.executeQuery();
    if (rsBookings.next()) {
        bookingCount = rsBookings.getInt(1);
    }

    // Get total cars count
    String sqlCars = "SELECT COUNT(*) FROM cars";
    PreparedStatement stmtCars = conn.prepareStatement(sqlCars);
    ResultSet rsCars = stmtCars.executeQuery();
    if (rsCars.next()) {
        carCount = rsCars.getInt(1);
    }

    // Get total drivers count
    String sqlDrivers = "SELECT COUNT(*) FROM drivers";
    PreparedStatement stmtDrivers = conn.prepareStatement(sqlDrivers);
    ResultSet rsDrivers = stmtDrivers.executeQuery();
    if (rsDrivers.next()) {
        driverCount = rsDrivers.getInt(1);
    }

    // Get total users count
    String sqlUsers = "SELECT COUNT(*) FROM users";
    PreparedStatement stmtUsers = conn.prepareStatement(sqlUsers);
    ResultSet rsUsers = stmtUsers.executeQuery();
    if (rsUsers.next()) {
        userCount = rsUsers.getInt(1);
    }

    // Get total payments count
    String sqlPayments = "SELECT COUNT(*) FROM payments";
    PreparedStatement stmtPayments = conn.prepareStatement(sqlPayments);
    ResultSet rsPayments = stmtPayments.executeQuery();
    if (rsPayments.next()) {
        paymentCount = rsPayments.getInt(1);
    }
%>



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
    <div class="dashboard-summary">
        <h2>👋 Welcome, admin!</h2>
        <p>Here's a quick overview of the Mega City Cab statistics.</p>
    </div>

    <div class="dashboard-cards">
        <div class="dashboard-card">
            <h3>🚗 Total Cars</h3>
            <p>15</p>
        </div>
        <div class="dashboard-card">
            <h3>👨‍🔧 Total Drivers</h3>
            <p>18</p>
        </div>
        <div class="dashboard-card">
            <h3>👤 Total Users</h3>
            <p>17</p>
        </div>
        <div class="dashboard-card">
            <h3>💳 Total Payments</h3>
            <p>13</p>
        </div>
    </div>
</div>

</body>
</html>
