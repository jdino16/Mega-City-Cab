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


public class AddDriverServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String driverName = request.getParameter("driverName");
        String phone = request.getParameter("phone");
        String carModel = request.getParameter("carModel");
        String status = request.getParameter("status");

        Connection conn = null;
        try {
            conn = DatabaseUtil.getConnection();
            String sql = "INSERT INTO drivers (driver_name, phone, car_model, status) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, driverName);
            stmt.setString(2, phone);
            stmt.setString(3, carModel);
            stmt.setString(4, status);
            stmt.executeUpdate();
            response.sendRedirect("viewDrivers.jsp"); 
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error inserting the driver.");
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
