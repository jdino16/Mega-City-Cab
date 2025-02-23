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
        
            int bookingCount = getBookingCount();
            int carCount = getCarCount();
            int driverCount = getDriverCount();
            int userCount = getUserCount();

           
            request.setAttribute("bookingCount", bookingCount);
            request.setAttribute("carCount", carCount);
            request.setAttribute("driverCount", driverCount);
            request.setAttribute("userCount", userCount);

           
            RequestDispatcher dispatcher = request.getRequestDispatcher("/adminDashboard.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

 
    private int getBookingCount() {
     
        return 100;
    }

    private int getCarCount() {
      
        return 50;
    }

    private int getDriverCount() {
   
        return 75;
    }

    private int getUserCount() {
       
        return 200;
    }
}
