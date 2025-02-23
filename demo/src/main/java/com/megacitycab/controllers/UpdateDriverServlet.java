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


public class UpdateDriverServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String driverId = request.getParameter("driverId");
        String driverName = request.getParameter("driverName");
        String phone = request.getParameter("phone");
        String carModel = request.getParameter("carModel");
        String status = request.getParameter("status");

        Connection conn = null;
        try {
            conn = DatabaseUtil.getConnection();
            String sql = "UPDATE drivers SET driver_name = ?, phone = ?, car_model = ?, status = ? WHERE driver_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, driverName);
            stmt.setString(2, phone);
            stmt.setString(3, carModel);
            stmt.setString(4, status);
            stmt.setString(5, driverId);

            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("viewDrivers.jsp?message=Driver%20updated%20successfully");
            } else {
                response.sendRedirect("editDriver.jsp?driverId=" + driverId + "&error=Update%20failed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
