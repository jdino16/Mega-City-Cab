package com.megacitycab.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/adminDashboard")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Call methods to get the counts from the database
            int bookingCount = getBookingCount();
            int carCount = getCarCount();
            int driverCount = getDriverCount();
            int userCount = getUserCount();

            // Set these counts as request attributes
            request.setAttribute("bookingCount", bookingCount);
            request.setAttribute("carCount", carCount);
            request.setAttribute("driverCount", driverCount);
            request.setAttribute("userCount", userCount);

            // Forward the request to the admin dashboard JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("/adminDashboard.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    // Dummy methods simulating database calls, replace with actual database logic
    private int getBookingCount() {
        // Logic to get booking count from database (dummy data for illustration)
        return 100;
    }

    private int getCarCount() {
        // Logic to get car count from database (dummy data for illustration)
        return 50;
    }

    private int getDriverCount() {
        // Logic to get driver count from database (dummy data for illustration)
        return 75;
    }

    private int getUserCount() {
        // Logic to get user count from database (dummy data for illustration)
        return 200;
    }
}
