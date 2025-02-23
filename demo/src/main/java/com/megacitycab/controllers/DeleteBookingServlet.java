package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.utils.DatabaseUtil;

@WebServlet("/DeleteBookingServlet")
public class DeleteBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingIdParam = request.getParameter("bookingId");

        if (bookingIdParam != null) {
            int bookingId = Integer.parseInt(bookingIdParam);
            try (Connection conn = DatabaseUtil.getConnection()) {
                String sql = "DELETE FROM bookings WHERE booking_id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, bookingId);
                stmt.executeUpdate();

                response.sendRedirect("viewBookings.jsp?message=Booking Deleted Successfully");
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("viewBookings.jsp?error=Error Deleting Booking");
            }
        } else {
            response.sendRedirect("viewBookings.jsp?error=Booking ID Missing");
        }
    }
}
