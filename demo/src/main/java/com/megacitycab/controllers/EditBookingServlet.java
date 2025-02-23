package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.utils.DatabaseUtil;


public class EditBookingServlet extends HttpServlet {

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
        String bookingId = request.getParameter("bookingId");

        if (bookingId != null) {
            Connection conn = null;
            try {
                conn = DatabaseUtil.getConnection();
                
                String sql = "SELECT * FROM bookings WHERE booking_id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, bookingId);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                
                    request.setAttribute("bookingId", rs.getString("booking_id"));
                    request.setAttribute("pickup", rs.getString("pickup"));
                    request.setAttribute("destination", rs.getString("destination"));
                    request.setAttribute("date", rs.getString("date"));
                    request.setAttribute("status", rs.getString("status"));
                }

                
                request.getRequestDispatcher("editBooking.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching booking details.");
            } finally {
                try {
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Booking ID is required.");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        String bookingId = request.getParameter("bookingId");
        String pickup = request.getParameter("pickup");
        String destination = request.getParameter("destination");
        String date = request.getParameter("date");
        String status = request.getParameter("status");

        Connection conn = null;
        try {
            conn = DatabaseUtil.getConnection();
            
            String sql = "UPDATE bookings SET pickup = ?, destination = ?, date = ?, status = ? WHERE booking_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, pickup);
            stmt.setString(2, destination);
            stmt.setString(3, date);
            stmt.setString(4, status);
            stmt.setString(5, bookingId);

            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
              
                response.sendRedirect("viewBookings.jsp?message=Booking Updated Successfully");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating the booking.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error during booking update.");
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
