package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.utils.DatabaseUtil;

public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Retrieve form data & trim spaces
            int userId = Integer.parseInt(request.getParameter("userId"));
            String customerName = request.getParameter("customerName").trim();
            String phone = request.getParameter("phone").trim();
            String address = request.getParameter("address").trim();
            String pickup = request.getParameter("pickup").trim();
            String destination = request.getParameter("destination").trim();
            double distance = Double.parseDouble(request.getParameter("distance"));
            double fare = Double.parseDouble(request.getParameter("fare"));
            String status = "Completed";


            System.out.println("Booking Details:");
            System.out.println("Customer Name: " + customerName);
            System.out.println("Phone: " + phone);
            System.out.println("Address: " + address);
            System.out.println("Pickup: " + pickup);
            System.out.println("Destination: " + destination);
            System.out.println("Distance: " + distance);
            System.out.println("Fare: " + fare);

            if (customerName.isEmpty() || phone.isEmpty() || address.isEmpty() || pickup.isEmpty() || destination.isEmpty()) {
                request.setAttribute("errorMessage", "⚠️ All fields are required.");
                request.getRequestDispatcher("booking.jsp").forward(request, response);
                return;
            }

            if (!phone.matches("^(?:7|0|(?:\\+94))[0-9]{8,9}$")) {
                request.setAttribute("errorMessage", "⚠️ Invalid phone number format.");
                request.getRequestDispatcher("booking.jsp").forward(request, response);
                return;
            }

            if (address.length() < 5) {
                request.setAttribute("errorMessage", "⚠️ Address must be at least 5 characters long.");
                request.getRequestDispatcher("booking.jsp").forward(request, response);
                return;
            }


            String sqlBooking = "INSERT INTO bookings (user_id, customer_name, phone, address, pickup, destination, date, status) VALUES (?, ?, ?, ?, ?, ?, NOW(), ?)";

            try (Connection conn = DatabaseUtil.getConnection();
                 PreparedStatement stmtBooking = conn.prepareStatement(sqlBooking, Statement.RETURN_GENERATED_KEYS)) {

                stmtBooking.setInt(1, userId);
                stmtBooking.setString(2, customerName);
                stmtBooking.setString(3, phone);
                stmtBooking.setString(4, address);
                stmtBooking.setString(5, pickup);
                stmtBooking.setString(6, destination);
                stmtBooking.setString(7, status);

                int rowsInserted = stmtBooking.executeUpdate();

                if (rowsInserted > 0) {
                    int bookingId = 0;
                    try (ResultSet rs = stmtBooking.getGeneratedKeys()) {
                        if (rs.next()) {
                            bookingId = rs.getInt(1);
                        }
                    }


                    String sqlPayment = "INSERT INTO payments (user_id, booking_id, amount, payment_method, status) VALUES (?, ?, ?, ?, 'Unpaid')";
                    try (PreparedStatement stmtPayment = conn.prepareStatement(sqlPayment)) {
                        stmtPayment.setInt(1, userId);
                        stmtPayment.setInt(2, bookingId);
                        stmtPayment.setDouble(3, fare);
                        stmtPayment.setString(4, "Cash"); 
                        stmtPayment.executeUpdate();
                    }


                    response.sendRedirect("billing.jsp?message=✅ Booking Successful!");
                } else {
                    request.setAttribute("errorMessage", "❌ Booking failed. Please try again.");
                    request.getRequestDispatcher("booking.jsp").forward(request, response);
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "⚠️ Invalid input. Please enter correct details.");
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "❌ Database error: " + e.getMessage());
            request.getRequestDispatcher("booking.jsp").forward(request, response);
        }
    }
}
