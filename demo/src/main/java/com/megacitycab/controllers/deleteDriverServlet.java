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

public class deleteDriverServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int driverId = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "DELETE FROM users WHERE id = ? AND role = 'driver'";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, driverId);
                int rowsDeleted = stmt.executeUpdate();

                if (rowsDeleted > 0) {
                    response.sendRedirect("viewDrivers.jsp");
                } else {
                    response.sendRedirect("viewDrivers.jsp?error=Failed%20to%20delete%20driver");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("viewDrivers.jsp?error=Database%20error");
        }
    }
}
