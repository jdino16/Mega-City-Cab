package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.utils.DatabaseUtil;


public class EditDriverServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String driverId = request.getParameter("driverId");
        
        if (driverId == null || driverId.isEmpty()) {
            response.getWriter().println("Invalid Driver ID!");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM drivers WHERE driver_id = ?";

        try {
            conn = DatabaseUtil.getConnection();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, driverId);
            rs = stmt.executeQuery();

            if (rs.next()) {
                request.setAttribute("driverId", rs.getString("driver_id"));
                request.setAttribute("driverName", rs.getString("driver_name"));
                request.setAttribute("phone", rs.getString("phone"));
                request.setAttribute("carModel", rs.getString("car_model"));
                request.setAttribute("status", rs.getString("status"));
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("editDriver.jsp");
                dispatcher.forward(request, response);
            } else {
                response.getWriter().println("Driver not found!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
