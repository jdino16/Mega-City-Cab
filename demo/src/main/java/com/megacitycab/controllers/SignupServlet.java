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

import org.mindrot.jbcrypt.BCrypt;

import com.megacitycab.utils.DatabaseUtil;

public class SignupServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String nic = request.getParameter("nic");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String role = request.getParameter("role"); 

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        // Check if email or NIC already exists
        String checkSql = "SELECT * FROM users WHERE email = ? OR nic = ?";
        String insertSql = "INSERT INTO users (name, email, password, nic, phone, address, role) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement checkStmt = conn.prepareStatement(checkSql)) {
            
            checkStmt.setString(1, email);
            checkStmt.setString(2, nic);

            try (ResultSet rs = checkStmt.executeQuery()) {
                if (rs.next()) {
                    request.setAttribute("errorMessage", "Email or NIC already exists. Try another.");
                    request.getRequestDispatcher("Signup.jsp").forward(request, response);
                    return;
                }
            }

            try (PreparedStatement insertStmt = conn.prepareStatement(insertSql)) {
                insertStmt.setString(1, name);
                insertStmt.setString(2, email);
                insertStmt.setString(3, hashedPassword);
                insertStmt.setString(4, nic);
                insertStmt.setString(5, phone);
                insertStmt.setString(6, address);
                insertStmt.setString(7, role); 

                int result = insertStmt.executeUpdate();
                if (result > 0) {
                    request.setAttribute("message", "Registration successful. Please login.");
                    request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Registration failed. Try again.");
                    request.getRequestDispatcher("Signup.jsp").forward(request, response);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
        }
    }
}
