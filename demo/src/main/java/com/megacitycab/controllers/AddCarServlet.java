package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.utils.DatabaseUtil;

@WebServlet("/AddCarServlet")
public class AddCarServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carName = request.getParameter("carName");
        String carModel = request.getParameter("carModel");
        String carType = request.getParameter("carType");
        int year = Integer.parseInt(request.getParameter("year"));
        String registrationNumber = request.getParameter("registrationNumber");
        String status = request.getParameter("status");

        Connection conn = null;
        try {
            conn = DatabaseUtil.getConnection();
            String sql = "INSERT INTO cars (car_name, car_model, car_type, year, registration_number, status) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, carName);
            stmt.setString(2, carModel);
            stmt.setString(3, carType);
            stmt.setInt(4, year);
            stmt.setString(5, registrationNumber);
            stmt.setString(6, status);
            stmt.executeUpdate();
            response.sendRedirect("viewCars.jsp"); 
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error inserting the car.");
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
