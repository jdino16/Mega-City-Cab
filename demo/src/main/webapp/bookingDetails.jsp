<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Details</title>
</head>
<body>
    <%
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        Connection conn = DatabaseUtil.getConnection();
        String sql = "SELECT b.customer_name, b.phone, b.address, b.pickup, b.destination, b.date, b.fare, db.status " +
                     "FROM bookings b JOIN driver_bookings db ON b.booking_id = db.booking_id_fk WHERE b.booking_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, bookingId);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            String customerName = rs.getString("customer_name");
            String phone = rs.getString("phone");
            String address = rs.getString("address");
            String pickup = rs.getString("pickup");
            String destination = rs.getString("destination");
            String date = rs.getString("date");
            double fare = rs.getDouble("fare");
            String status = rs.getString("status");
    %>

    <h2>Booking Details</h2>
    <p><strong>Customer Name:</strong> <%= customerName %></p>
    <p><strong>Phone:</strong> <%= phone %></p>
    <p><strong>Address:</strong> <%= address %></p>
    <p><strong>Pickup Location:</strong> <%= pickup %></p>
    <p><strong>Destination:</strong> <%= destination %></p>
    <p><strong>Booking Date:</strong> <%= date %></p>
    <p><strong>Fare:</strong> Rs <%= fare %></p>
    <p><strong>Status:</strong> <%= status %></p>

    <% } conn.close(); %>

</body>
</html>
