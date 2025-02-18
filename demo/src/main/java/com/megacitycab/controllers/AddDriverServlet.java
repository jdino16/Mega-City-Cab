package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.utils.DatabaseUtil;

public class AddDriverServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String driverName = request.getParameter("driverName");
        String phone = request.getParameter("phone");
        String carModel = request.getParameter("carModel");
        String status = request.getParameter("status");

        // SQL query to insert new driver into the database
        String sql = "INSERT INTO drivers (driver_name, phone, car_model, status) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, driverName);
            stmt.setString(2, phone);
            stmt.setString(3, carModel);
            stmt.setString(4, status);

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("viewDrivers.jsp?message=Driver%20added%20successfully!");
            } else {
                request.setAttribute("errorMessage", "Failed to add the driver. Please try again.");
                request.getRequestDispatcher("addDriver.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("addDriver.jsp").forward(request, response);
        }
    }
}
