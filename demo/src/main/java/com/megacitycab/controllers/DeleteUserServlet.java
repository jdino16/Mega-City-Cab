package com.megacitycab.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.megacitycab.utils.DatabaseUtil;

@WebServlet("/deleteUserServlet")
public class DeleteUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        String sql = "DELETE FROM users WHERE id = ?";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, userId);
            int rowsDeleted = stmt.executeUpdate();
            
            if (rowsDeleted > 0) {
                response.sendRedirect("viewUsers.jsp?message=User%20deleted%20successfully");
            } else {
                response.sendRedirect("viewUsers.jsp?message=Failed%20to%20delete%20user");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewUsers.jsp?message=Error%20deleting%20user");
        }
    }
}
