package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.megacitycab.utils.DatabaseUtil;

@WebServlet("/AddPaymentServlet")
public class AddPaymentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("user_id"));
        int bookingId = Integer.parseInt(request.getParameter("booking_id"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentMethod = request.getParameter("payment_method");
        String status = request.getParameter("status");

        Connection conn = null;
        try {
            conn = DatabaseUtil.getConnection();
            String sql = "INSERT INTO payments (user_id, booking_id, amount, payment_method, status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, userId);
            stmt.setInt(2, bookingId);
            stmt.setDouble(3, amount);
            stmt.setString(4, paymentMethod);
            stmt.setString(5, status);
            stmt.executeUpdate();

            response.sendRedirect("viewPayments.jsp"); // Redirect after successful insert
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error inserting the payment record.");
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
