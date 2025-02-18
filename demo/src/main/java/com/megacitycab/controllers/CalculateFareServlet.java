package com.megacitycab.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CalculateFareServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve customer details
            String customerName = request.getParameter("customerName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            // Retrieve booking details
            String pickup = request.getParameter("pickup");
            String destination = request.getParameter("destination");
            double distance = Double.parseDouble(request.getParameter("distance"));

            // Calculate fare
            double baseFare = 100.00; // Base Fare in LKR
            double perKmRate = 50.00; // Rate per KM in LKR
            double estimatedFare = baseFare + (perKmRate * distance);

            // Redirect with all necessary parameters
            response.sendRedirect("booking.jsp?fare=" + estimatedFare + 
                                  "&customerName=" + customerName + 
                                  "&phone=" + phone + 
                                  "&address=" + address + 
                                  "&pickup=" + pickup + 
                                  "&destination=" + destination + 
                                  "&distance=" + distance);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("booking.jsp?error=Invalid%20Data");
        }
    }
}
