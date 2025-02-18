<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Bookings - Mega City Cab</title>
    <!-- Include your CSS files or libraries here -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>View All Bookings</h1>
    </header>

    <section class="booking-list">
        <table>
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Customer Name</th>
                    <th>Phone</th>
                    <th>Pickup Location</th>
                    <th>Destination</th>
                    <th>Date</th>
                    <th>Status</th>
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
                    <tr>
                        <td><%= bookingId %></td>
                        <td><%= customerName %></td>
                        <td><%= phone %></td>
                        <td><%= pickup %></td>
                        <td><%= destination %></td>
                        <td><%= date %></td>
                        <td><%= status %></td>
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
