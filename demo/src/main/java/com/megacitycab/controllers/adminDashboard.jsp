package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import com.megacitycab.utils.DatabaseUtil;

public class AdminDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Ensure that the user is an admin
        Object roleObj = request.getSession().getAttribute("role");
        if (roleObj == null || !roleObj.equals("admin")) {
            response.sendRedirect("LoginPage.jsp");
            return;
        }

        // Initialize variables
        int bookingCount = 0;
        int carCount = 0;
        int driverCount = 0;
        int userCount = 0;
        int paymentCount = 0;

        // Create connection to the database
        try (Connection conn = DatabaseUtil.getConnection()) {
            // Fetch total bookings
            String sqlBookings = "SELECT COUNT(*) FROM bookings";
            try (PreparedStatement stmtBookings = conn.prepareStatement(sqlBookings);
                 ResultSet rsBookings = stmtBookings.executeQuery()) {
                if (rsBookings.next()) {
                    bookingCount = rsBookings.getInt(1);
                }
            }

            // Fetch total cars
            String sqlCars = "SELECT COUNT(*) FROM cars";
            try (PreparedStatement stmtCars = conn.prepareStatement(sqlCars);
                 ResultSet rsCars = stmtCars.executeQuery()) {
                if (rsCars.next()) {
                    carCount = rsCars.getInt(1);
                }
            }

            // Fetch total drivers
            String sqlDrivers = "SELECT COUNT(*) FROM drivers";
            try (PreparedStatement stmtDrivers = conn.prepareStatement(sqlDrivers);
                 ResultSet rsDrivers = stmtDrivers.executeQuery()) {
                if (rsDrivers.next()) {
                    driverCount = rsDrivers.getInt(1);
                }
            }

            // Fetch total users
            String sqlUsers = "SELECT COUNT(*) FROM users";
            try (PreparedStatement stmtUsers = conn.prepareStatement(sqlUsers);
                 ResultSet rsUsers = stmtUsers.executeQuery()) {
                if (rsUsers.next()) {
                    userCount = rsUsers.getInt(1);
                }
            }

            // Fetch total payments
            String sqlPayments = "SELECT COUNT(*) FROM payments";
            try (PreparedStatement stmtPayments = conn.prepareStatement(sqlPayments);
                 ResultSet rsPayments = stmtPayments.executeQuery()) {
                if (rsPayments.next()) {
                    paymentCount = rsPayments.getInt(1);
                }
            }

            // Set the retrieved counts as request attributes
            request.setAttribute("bookingCount", bookingCount);
            request.setAttribute("carCount", carCount);
            request.setAttribute("driverCount", driverCount);
            request.setAttribute("userCount", userCount);
            request.setAttribute("paymentCount", paymentCount);

            // Forward the request to the admin dashboard JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("/adminDashboard.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error while retrieving dashboard data.");
        }
    }
}
