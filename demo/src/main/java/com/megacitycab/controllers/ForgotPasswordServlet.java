package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.megacitycab.utils.DatabaseUtil;

public class ForgotPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String sql = "SELECT * FROM users WHERE email = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Store email in session for resetting password
                HttpSession session = request.getSession();
                session.setAttribute("resetEmail", email);

                // Redirect to Reset Password Page
                response.sendRedirect("ResetPassword.jsp");
            } else {
                request.setAttribute("error", "⚠️ Email not found. Please enter a registered email.");
                request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "⚠️ Database error: " + e.getMessage());
            request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
        }
    }
}
