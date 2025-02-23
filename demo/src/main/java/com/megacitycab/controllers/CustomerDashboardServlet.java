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

public class CustomerDashboardServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Object userIdObj = request.getSession().getAttribute("userId");
        if (userIdObj == null) {
            response.sendRedirect("LoginPage.jsp");
            return;
        }
        int userId = (Integer) userIdObj;

        Connection conn = null;
        int upcomingBookings = 0;
        int completedRides = 0;
        double totalSpent = 0.0;

        try {
            conn = DatabaseUtil.getConnection();

            String sqlUpcoming = "SELECT COUNT(*) FROM bookings WHERE user_id = ? AND status IN ('Pending', 'Confirmed')";
            PreparedStatement stmtUpcoming = conn.prepareStatement(sqlUpcoming);
            stmtUpcoming.setInt(1, userId);
            ResultSet rsUpcoming = stmtUpcoming.executeQuery();
            if (rsUpcoming.next()) {
                upcomingBookings = rsUpcoming.getInt(1);
            }

       
            String sqlCompleted = "SELECT COUNT(*) FROM bookings WHERE user_id = ? AND status = 'Completed'";
            PreparedStatement stmtCompleted = conn.prepareStatement(sqlCompleted);
            stmtCompleted.setInt(1, userId);
            ResultSet rsCompleted = stmtCompleted.executeQuery();
            if (rsCompleted.next()) {
                completedRides = rsCompleted.getInt(1);
            }

         
            String sqlTotalSpent = "SELECT SUM(amount) FROM payments WHERE user_id = ?";
            PreparedStatement stmtTotalSpent = conn.prepareStatement(sqlTotalSpent);
            stmtTotalSpent.setInt(1, userId);
            ResultSet rsTotalSpent = stmtTotalSpent.executeQuery();
            if (rsTotalSpent.next()) {
                totalSpent = rsTotalSpent.getDouble(1);
            }

         
            request.setAttribute("upcomingBookings", upcomingBookings);
            request.setAttribute("completedRides", completedRides);
            request.setAttribute("totalSpent", totalSpent);

        
            String sqlRecent = "SELECT booking_id, pickup, destination, date, status FROM bookings WHERE user_id = ? ORDER BY date DESC LIMIT 5";
            PreparedStatement stmtRecent = conn.prepareStatement(sqlRecent);
            stmtRecent.setInt(1, userId);
            ResultSet rsRecent = stmtRecent.executeQuery();
            request.setAttribute("recentBookings", rsRecent);

          
            request.getRequestDispatcher("customerDashboard.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error while retrieving dashboard data.");
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
