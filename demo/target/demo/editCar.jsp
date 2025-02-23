<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Car - Mega City Cab</title>
    <link rel="stylesheet" href="editcar.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body>

    <div class="sidebar">
        <div class="logo">
            <h2>Mega City Cab</h2>
        </div>
        <ul class="nav-links">
            <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="company.jsp"><i class="fas fa-building"></i> Company</a></li>
            <li><a href="customerDashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="viewBookings.jsp"><i class="fas fa-book"></i> Bookings</a></li>
            <li><a href="viewPayments.jsp"><i class="fas fa-credit-card"></i> Payments</a></li>
            <li><a href="support.jsp"><i class="fas fa-question-circle"></i> Support</a></li>
            <a href="help.jsp" class="nav-link"><i class="fas fa-question-circle"></i> Help</a> 
            <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>


    <div class="sidebar-right">
        <div class="action-buttons">
            <a href="viewCars.jsp" class="action-btn">🚗 View Cars</a>
            <a href="addCar.jsp" class="action-btn">➕ Add Car</a>
        </div>
    </div>


    <div class="content">
        <header>
            <h1>Edit Car Details</h1>
        </header>

        <%
            String carId = request.getParameter("carId");
            if (carId != null && !carId.isEmpty()) {
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                String sql = "SELECT car_id, car_name, car_model, car_type, year, registration_number, status FROM cars WHERE car_id = ?";

                try {
                    conn = DatabaseUtil.getConnection();
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, carId);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        String carName = rs.getString("car_name");
                        String carModel = rs.getString("car_model");
                        String carType = rs.getString("car_type");
                        String year = rs.getString("year");
                        String registrationNumber = rs.getString("registration_number");
                        String status = rs.getString("status");
        %>


        <form action="UpdateCarServlet" method="post" class="car-form">
            <input type="hidden" name="carId" value="<%= carId %>" />
            
            <label for="carName">Car Name:</label>
            <input type="text" id="carName" name="carName" value="<%= carName %>" required />

            <label for="carModel">Car Model:</label>
            <input type="text" id="carModel" name="carModel" value="<%= carModel %>" required />

            <label for="carType">Car Type:</label>
            <input type="text" id="carType" name="carType" value="<%= carType %>" required />

            <label for="year">Year:</label>
            <input type="text" id="year" name="year" value="<%= year %>" required />

            <label for="registrationNumber">Registration Number:</label>
            <input type="text" id="registrationNumber" name="registrationNumber" value="<%= registrationNumber %>" required />

            <label for="status">Status:</label>
            <select id="status" name="status" required>
                <option value="Available" <%= "Available".equals(status) ? "selected" : "" %>>Available</option>
                <option value="Unavailable" <%= "Unavailable".equals(status) ? "selected" : "" %>>Unavailable</option>
            </select>

            <input type="submit" value="Update Car Details" class="submit-btn" />
        </form>

        <%
                    } else {
                        out.println("Car not found!");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Database error: " + e.getMessage());
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                }
            } else {
                out.println("Invalid Car ID!");
            }
        %>
    </div>

    <footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    </footer>
</body>
</html>
