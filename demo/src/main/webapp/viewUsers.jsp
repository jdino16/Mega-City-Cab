<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Users - Mega City Cab</title>
    <!-- Include your CSS files or libraries here -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>View All Users</h1>
    </header>

    <section class="user-list">
        <table>
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Address</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Get the user details from the database
                    Connection conn = DatabaseUtil.getConnection();
                    String sql = "SELECT id, name, email, phone, address, role FROM users ORDER BY name";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery();

                    // Loop through the result set and display each user's details
                    while (rs.next()) {
                        int userId = rs.getInt("id");
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String phone = rs.getString("phone");
                        String address = rs.getString("address");
                        String role = rs.getString("role");
                %>
                    <tr>
                        <td><%= userId %></td>
                        <td><%= name %></td>
                        <td><%= email %></td>
                        <td><%= phone %></td>
                        <td><%= address %></td>
                        <td><%= role %></td>
                        <td>
                            <a href="editUser.jsp?userId=<%= userId %>">Edit</a> |
                            <a href="deleteUserServlet?userId=<%= userId %>" onclick="return confirm('Are you sure you want to delete this user?')">Delete</a>
                        </td>
                    </tr>
                <%
                    }
                    // Close the connection
                    conn.close();
                %>
            </tbody>
        </table>
    </section>

    <footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    </footer>
</body>
</html>
