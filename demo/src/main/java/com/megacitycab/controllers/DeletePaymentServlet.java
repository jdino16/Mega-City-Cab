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

@WebServlet("/deletePaymentServlet")
public class DeletePaymentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int transactionId = Integer.parseInt(request.getParameter("transactionId"));
        
        String sql = "DELETE FROM payments WHERE transaction_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, transactionId);

            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("viewPayments.jsp?message=Payment%20deleted%20successfully!");
            } else {
                response.sendRedirect("viewPayments.jsp?message=Failed%20to%20delete%20payment.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
