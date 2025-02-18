<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Cars - Mega City Cab</title>
    <!-- Include your CSS files or libraries here -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>View All Cars</h1>
    </header>

    <section class="car-list">
        <table>
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
                            <a href="editCar.jsp?carId=<%= carId %>">Edit</a> |
                            <a href="deleteCarServlet?carId=<%= carId %>" onclick="return confirm('Are you sure you want to delete this car?')">Delete</a>
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
