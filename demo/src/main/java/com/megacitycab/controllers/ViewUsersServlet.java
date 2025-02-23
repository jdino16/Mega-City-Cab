package com.megacitycab.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.megacitycab.utils.DatabaseUtil;

public class ViewUsersServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     
        response.setContentType("text/html");


        try (PrintWriter out = response.getWriter()) {
            Connection conn = DatabaseUtil.getConnection();
            String sql = "SELECT id, name, email, phone, address, role FROM users ORDER BY name";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

 
            out.println("<html>");
            out.println("<head><title>View Users</title></head>");
            out.println("<body>");
            out.println("<h1>All Users</h1>");
            out.println("<table border='1'>");
            out.println("<tr><th>User ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Address</th><th>Role</th><th>Actions</th></tr>");


            while (rs.next()) {
                int userId = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String role = rs.getString("role");

                out.println("<tr>");
                out.println("<td>" + userId + "</td>");
                out.println("<td>" + name + "</td>");
                out.println("<td>" + email + "</td>");
                out.println("<td>" + phone + "</td>");
                out.println("<td>" + address + "</td>");
                out.println("<td>" + role + "</td>");
                out.println("<td><a href='editUser.jsp?userId=" + userId + "'>Edit</a> | <a href='deleteUserServlet?userId=" + userId + "'>Delete</a></td>");
                out.println("</tr>");
            }

            out.println("</table>");
            out.println("</body>");
            out.println("</html>");
            
      
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();  
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}
