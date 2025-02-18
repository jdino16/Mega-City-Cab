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

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        double baseFare = 5.0; // Base fare
        double perKmRate = 2.0; // Fare per KM
        double distance = Double.parseDouble(request.getParameter("distance"));
        double taxRate = 0.05; // 5% tax

        double amount = baseFare + (perKmRate * distance);
        double tax = amount * taxRate;
        double totalAmount = amount + tax;

        String paymentMethod = request.getParameter("paymentMethod");
        String status = "Pending";

        String sql = "INSERT INTO payments (user_id, booking_id, amount, payment_method, status) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, bookingId);
            stmt.setDouble(3, totalAmount);
            stmt.setString(4, paymentMethod);
            stmt.setString(5, status);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("billing.jsp?message=Payment%20Successful");
            } else {
                request.setAttribute("errorMessage", "Payment failed. Try again.");
                request.getRequestDispatcher("billing.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("billing.jsp").forward(request, response);
        }
    }
}
