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
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.megacitycab.utils.DatabaseUtil;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String sql = "SELECT id, name, password, role FROM users WHERE email = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String storedHash = rs.getString("password");
                    String role = rs.getString("role");
                    int userId = rs.getInt("id");
                    String username = rs.getString("name");

                    if (BCrypt.checkpw(password, storedHash)) {
                    
                        HttpSession session = request.getSession();
                        session.setAttribute("userId", userId);
                        session.setAttribute("username", username);
                        session.setAttribute("role", role);

       
                        if ("admin".equalsIgnoreCase(role)) {
                            response.sendRedirect("adminDashboard.jsp"); 
                        } else if ("driver".equalsIgnoreCase(role)) {
                            response.sendRedirect("driverDashboard.jsp");
                        } else {
                            response.sendRedirect("customerDashboard.jsp"); 
                        }
                    } else {
                        request.setAttribute("errorMessage", "Invalid password. Try again.");
                        request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("errorMessage", "User does not exist.");
                    request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
        }
    }
}
