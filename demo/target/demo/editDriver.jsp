<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Driver - Mega City Cab</title>

    <link rel="stylesheet" href="styles/editDriver.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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

    <nav class="top-nav">
        <ul>
            <li><a href="profile.jsp"><i class="fas fa-user-circle"></i> Profile</a></li>
            <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </nav>


    <main class="content">
        <header>
            <h1>Edit Driver Details</h1>
        </header>

        <section class="edit-driver">
            <%
                String driverId = request.getParameter("driverId");
                if (driverId != null) {
                    Connection conn = DatabaseUtil.getConnection();
                    String sql = "SELECT * FROM drivers WHERE driver_id = ?";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    stmt.setString(1, driverId);
                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
                        String driverName = rs.getString("driver_name");
                        String phone = rs.getString("phone");
                        String carModel = rs.getString("car_model");
                        String status = rs.getString("status");
            %>

            <form action="UpdateDriverServlet" method="post">
                <input type="hidden" name="driverId" value="<%= driverId %>">
                <div class="form-group">
                    <label for="driverName"><i class="fas fa-user"></i> Driver Name:</label>
                    <input type="text" id="driverName" name="driverName" value="<%= driverName %>" required>
                </div>

                <div class="form-group">
                    <label for="phone"><i class="fas fa-phone"></i> Phone:</label>
                    <input type="text" id="phone" name="phone" value="<%= phone %>" required>
                </div>

                <div class="form-group">
                    <label for="carModel"><i class="fas fa-car"></i> Car Model:</label>
                    <input type="text" id="carModel" name="carModel" value="<%= carModel %>" required>
                </div>

                <div class="form-group">
                    <label for="status"><i class="fas fa-toggle-on"></i> Status:</label>
                    <select id="status" name="status">
                        <option value="Active" <%= status.equals("Active") ? "selected" : "" %>>Active</option>
                        <option value="Inactive" <%= status.equals("Inactive") ? "selected" : "" %>>Inactive</option>
                    </select>
                </div>

                <div class="form-actions">
                    <button type="submit"><i class="fas fa-save"></i> Update Driver</button>
                    <a href="viewDrivers.jsp" class="btn"><i class="fas fa-times"></i> Cancel</a>
                </div>
            </form>

            <% 
                    } else { 
            %>
                <p>Driver not found!</p>
            <%
                    }
                } else {
            %>
                <p>Invalid driver ID!</p>
            <%
                }
            %>
        </section>
    </main>

 
    <script src="../js/editDriver.js"></script>
</body>
</html>
