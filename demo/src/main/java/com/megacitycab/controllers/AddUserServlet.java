package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.utils.DatabaseUtil;

public class AddUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String password = request.getParameter("password"); // You can hash the password if needed

        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "INSERT INTO users (name, email, phone, password, role) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, username);
                stmt.setString(2, email);
                stmt.setString(3, phone);
                stmt.setString(4, password); // For security, consider hashing the password before inserting
                stmt.setString(5, role);
                int rows = stmt.executeUpdate();

                if (rows > 0) {
                    response.sendRedirect("viewUsers.jsp");
                } else {
                    response.sendRedirect("addUser.jsp?error=Failed%20to%20add%20user");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("addUser.jsp?error=Database%20error");
        }
    }
}
