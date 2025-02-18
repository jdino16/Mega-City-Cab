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

@WebServlet("/updatePaymentServlet")
public class UpdatePaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int transactionId = Integer.parseInt(request.getParameter("transactionId"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String paymentMethod = request.getParameter("paymentMethod");
        String status = request.getParameter("status");

        String sql = "UPDATE payments SET amount = ?, payment_method = ?, status = ? WHERE transaction_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setDouble(1, amount);
            stmt.setString(2, paymentMethod);
            stmt.setString(3, status);
            stmt.setInt(4, transactionId);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("viewPayments.jsp?message=Payment%20updated%20successfully!");
            } else {
                response.sendRedirect("viewPayments.jsp?message=Failed%20to%20update%20payment.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
