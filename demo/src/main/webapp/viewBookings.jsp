<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings - Mega City Cab</title>
 
    <link rel="stylesheet" href="styles/viewbooking.css">
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
        <h1>View All Bookings</h1>
    </header>

    <section class="booking-list">
        <table class="booking-table">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Customer Name</th>
                    <th>Phone</th>
                    <th>Pickup Location</th>
                    <th>Destination</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Get the bookings from the database
                    Connection conn = DatabaseUtil.getConnection();
                    String sql = "SELECT booking_id, customer_name, phone, pickup, destination, date, status FROM bookings ORDER BY date DESC";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery();

                    // Loop through the result set and display each booking
                    while (rs.next()) {
                        int bookingId = rs.getInt("booking_id");
                        String customerName = rs.getString("customer_name");
                        String phone = rs.getString("phone");
                        String pickup = rs.getString("pickup");
                        String destination = rs.getString("destination");
                        String date = rs.getString("date");
                        String status = rs.getString("status");
                %>
                    <tr class="booking-row">
                        <td><%= bookingId %></td>
                        <td><%= customerName %></td>
                        <td><%= phone %></td>
                        <td><%= pickup %></td>
                        <td><%= destination %></td>
                        <td><%= date %></td>
                        <td><%= status %></td>
                        <td>
                            <a href="EditBookingServlet?bookingId=<%= bookingId %>" class="action-link">
                                <i class="fas fa-edit"></i> Edit
                            </a> |
                            <a href="DeleteBookingServlet?bookingId=<%= bookingId %>" class="action-link" onclick="return confirm('Are you sure you want to delete this booking?')">
                                <i class="fas fa-trash-alt"></i> Delete
                            </a>
                        </td>
                    </tr>
                <%
                    }
                    // Close the connection
                    conn.close();
                %>
            </tbody>
        </table>
    </section>



</div>

<script src="js/viewbooking.js"></script>
</body>
</html>
