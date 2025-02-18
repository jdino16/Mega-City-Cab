package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.models.Driver;
import com.megacitycab.utils.DatabaseUtil;

public class ViewDriversServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Driver> drivers = new ArrayList<>();
        
        // Get the driver details from the database
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT driver_id, driver_name, phone, car_model, status FROM drivers ORDER BY driver_name";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            // Loop through the result set and add each driver's data to the list
            while (rs.next()) {
                Driver driver = new Driver();
                driver.setDriverId(rs.getInt("driver_id"));
                driver.setDriverName(rs.getString("driver_name"));
                driver.setPhone(rs.getString("phone"));
                driver.setCarModel(rs.getString("car_model"));
                driver.setStatus(rs.getString("status"));
                drivers.add(driver);
            }

            // Set the drivers list as a request attribute
            request.setAttribute("drivers", drivers);

            // Forward the request and response to the JSP for rendering
            request.getRequestDispatcher("/viewDrivers.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error loading drivers: " + e.getMessage());
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
        }
    }
}
