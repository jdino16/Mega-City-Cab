package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.utils.DatabaseUtil;


public class UpdateCarServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get car details from form
        int carId = Integer.parseInt(request.getParameter("carId"));
        String carName = request.getParameter("carName");
        String carModel = request.getParameter("carModel");
        String carType = request.getParameter("carType");
        int year = Integer.parseInt(request.getParameter("year"));
        String registrationNumber = request.getParameter("registrationNumber");
        String status = request.getParameter("status");

        Connection conn = null;

        try {
            conn = DatabaseUtil.getConnection();
            
            // SQL query to update the car details
            String sql = "UPDATE cars SET car_name = ?, car_model = ?, car_type = ?, year = ?, registration_number = ?, status = ? WHERE car_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, carName);
            stmt.setString(2, carModel);
            stmt.setString(3, carType);
            stmt.setInt(4, year);
            stmt.setString(5, registrationNumber);
            stmt.setString(6, status);
            stmt.setInt(7, carId);

            // Execute the update
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated > 0) {
                response.sendRedirect("viewCars.jsp?message=Car updated successfully.");
            } else {
                response.sendRedirect("editCar.jsp?error=Failed to update car.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error updating car details.");
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
