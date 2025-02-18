package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.utils.DatabaseUtil;

public class AddCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String carName = request.getParameter("carName");
        String carModel = request.getParameter("carModel");
        String carType = request.getParameter("carType");
        String year = request.getParameter("year");
        String registrationNumber = request.getParameter("registrationNumber");
        String status = request.getParameter("status");

        // SQL query to insert car information into the database
        String sql = "INSERT INTO cars (car_name, car_model, car_type, year, registration_number, status) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Set values to the prepared statement
            stmt.setString(1, carName);
            stmt.setString(2, carModel);
            stmt.setString(3, carType);
            stmt.setString(4, year);
            stmt.setString(5, registrationNumber);
            stmt.setString(6, status);

            // Execute the query to insert the data
            int rowsInserted = stmt.executeUpdate();

            // If insertion is successful, redirect to the car information page
            if (rowsInserted > 0) {
                response.sendRedirect("carInformation.jsp?message=Car%20added%20successfully!");
            } else {
                // If insertion fails, set an error message and forward to the same page
                request.setAttribute("errorMessage", "Failed to add the car. Please try again.");
                request.getRequestDispatcher("addCar.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // Handle any database or other exceptions
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("addCar.jsp").forward(request, response);
        }
    }
}
