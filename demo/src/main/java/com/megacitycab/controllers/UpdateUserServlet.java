package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.utils.DatabaseUtil;


public class UpdateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
        String userId = request.getParameter("userId");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String role = request.getParameter("role");
        String nic = request.getParameter("nic");

        Connection conn = null;

        try {
           
            conn = DatabaseUtil.getConnection();

      
            String sql = "UPDATE users SET name = ?, email = ?, phone = ?, address = ?, role = ?, nic = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            
    
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, phone);
            stmt.setString(4, address);
            stmt.setString(5, role);
            stmt.setString(6, nic);
            stmt.setInt(7, Integer.parseInt(userId));

     
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
         
                response.sendRedirect("ViewUsersServlet?message=User%20Updated%20Successfully");
            } else {
             
                request.setAttribute("errorMessage", "Failed to update user. Please try again.");
                request.getRequestDispatcher("errorPage.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
          
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        } finally {
            try {
                if (conn != null) {
                    conn.close(); 
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
