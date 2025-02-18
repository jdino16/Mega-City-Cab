<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Drivers - Mega City Cab</title>
    <!-- Include your CSS files or libraries here -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>View All Drivers</h1>
    </header>

    <section class="driver-list">
        <table>
            <thead>
                <tr>
                    <th>Driver ID</th>
                    <th>Driver Name</th>
                    <th>Phone</th>
                    <th>Car Model</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Get the driver details from the database
                    Connection conn = DatabaseUtil.getConnection();
                    String sql = "SELECT driver_id, driver_name, phone, car_model, status FROM drivers ORDER BY driver_name";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery();

                    // Loop through the result set and display each driver's details
                    while (rs.next()) {
                        int driverId = rs.getInt("driver_id");
                        String driverName = rs.getString("driver_name");
                        String phone = rs.getString("phone");
                        String carModel = rs.getString("car_model");
                        String status = rs.getString("status");
                %>
                    <tr>
                        <td><%= driverId %></td>
                        <td><%= driverName %></td>
                        <td><%= phone %></td>
                        <td><%= carModel %></td>
                        <td><%= status %></td>
                        <td>
                            <a href="editDriver.jsp?driverId=<%= driverId %>">Edit</a> |
                            <a href="deleteDriverServlet?driverId=<%= driverId %>" onclick="return confirm('Are you sure you want to delete this driver?')">Delete</a>
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

    <footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    </footer>
</body>
</html>
