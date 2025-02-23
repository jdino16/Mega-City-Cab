package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.utils.DatabaseUtil;

@WebServlet("/AddBookingServlet")
public class AddBookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pickup = request.getParameter("pickup");
        String destination = request.getParameter("destination");
        String customerName = request.getParameter("customerName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        Connection conn = null;
        try {
            conn = DatabaseUtil.getConnection();
            String sql = "INSERT INTO bookings (pickup, destination, customer_name, phone, address, status) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, pickup);
            stmt.setString(2, destination);
            stmt.setString(3, customerName);
            stmt.setString(4, phone);
            stmt.setString(5, address);
            stmt.setString(6, "Pending");
            stmt.executeUpdate();
            response.sendRedirect("viewBookings.jsp"); 
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error inserting the booking.");
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
