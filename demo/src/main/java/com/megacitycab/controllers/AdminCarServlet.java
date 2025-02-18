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

import com.megacitycab.utils.DatabaseUtil;

public class AdminCarServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Logic for displaying the cars
        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "SELECT * FROM cars";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            request.setAttribute("cars", rs);
            request.getRequestDispatcher("admin/cars.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carModel = request.getParameter("car_model");
        String carNumber = request.getParameter("car_number");
        String status = request.getParameter("status");

        try (Connection conn = DatabaseUtil.getConnection()) {
            String sql = "INSERT INTO cars (car_model, car_number, status) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, carModel);
            stmt.setString(2, carNumber);
            stmt.setString(3, status);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("admin/cars.jsp");
    }
}
