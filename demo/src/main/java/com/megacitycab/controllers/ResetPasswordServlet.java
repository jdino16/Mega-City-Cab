package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.megacitycab.utils.DatabaseUtil;

public class ResetPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("resetEmail");
        String newPassword = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (email == null) {
            request.setAttribute("error", "⚠️ Session expired. Try again.");
            request.getRequestDispatcher("ForgotPassword.jsp").forward(request, response);
            return;
        }

        // Check if passwords match
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "⚠️ Passwords do not match. Try again.");
            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
            return;
        }

        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
        String sql = "UPDATE users SET password = ? WHERE email = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, hashedPassword);
            stmt.setString(2, email);
            int result = stmt.executeUpdate();

            if (result > 0) {
                session.removeAttribute("resetEmail"); // Clear session
                request.setAttribute("message", "✅ Password updated successfully! Please log in.");
                request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "⚠️ Failed to reset password. Try again.");
                request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "⚠️ Database error: " + e.getMessage());
            request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
        }
    }
}
