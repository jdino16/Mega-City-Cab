<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Cars - Mega City Cab</title>
    <link rel="stylesheet" href="styles/viewcar.css">
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
            <h1>View All Cars</h1>
        </header>

        <section class="car-list">
            <table class="car-table">
                <thead>
                    <tr>
                        <th>Car ID</th>
                        <th>Car Model</th>
                        <th>Year</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Get the car details from the database
                        Connection conn = DatabaseUtil.getConnection();
                        String sql = "SELECT car_id, car_model, year, status FROM cars ORDER BY car_model";
                        PreparedStatement stmt = conn.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();

                        // Loop through the result set and display each car's details
                        while (rs.next()) {
                            int carId = rs.getInt("car_id");
                            String carModel = rs.getString("car_model");
                            int year = rs.getInt("year");
                            String status = rs.getString("status");
                    %>
                        <tr>
                            <td><%= carId %></td>
                            <td><%= carModel %></td>
                            <td><%= year %></td>
                            <td><%= status %></td>
                            <td>
                                <a href="#" class="action-link edit-link" data-car-id="<%= carId %>">
                                    <i class="fas fa-edit"></i> Edit
                                </a> |
                                <a href="#" class="action-link delete-link" data-car-id="<%= carId %>" onclick="return false;">
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

   
    <script src="js/viewcar.js"></script>
</body>
</html>
