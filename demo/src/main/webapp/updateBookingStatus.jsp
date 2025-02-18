<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Booking Status</title>
</head>
<body>
    <%
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String status = request.getParameter("status");

        String sql = "UPDATE driver_bookings SET status = ? WHERE booking_id = ?";
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, status);
            stmt.setInt(2, bookingId);
            int rowsUpdated = stmt.executeUpdate();
            
            if (rowsUpdated > 0) {
                response.sendRedirect("driverBookings.jsp?message=Booking%20status%20updated%20successfully");
            } else {
                request.setAttribute("errorMessage", "Failed to update booking status.");
                request.getRequestDispatcher("driverBookings.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("driverBookings.jsp").forward(request, response);
        }
    %>
</body>
</html>
