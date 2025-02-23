<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User - Mega City Cab</title>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

  
    <link rel="stylesheet" href="styles/edit-user.css">
</head>
<body>

 
    <nav class="navbar">
        <ul class="navbar-links">
            <li><a href="dashboard.jsp"><i class="fa-solid fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="manage-users.jsp"><i class="fa-solid fa-users"></i> Manage Users</a></li>
            <li><a href="manage-cabs.jsp"><i class="fa-solid fa-car"></i> Manage Cabs</a></li>
            <li><a href="view-bookings.jsp"><i class="fa-solid fa-book"></i> View Bookings</a></li>
            <li><a href="settings.jsp"><i class="fa-solid fa-cogs"></i> Settings</a></li>
            <li><a href="logout.jsp"><i class="fa-solid fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </nav>

    <header>
        <h1><i class="fa-solid fa-user-pen"></i> Edit User Details</h1>
    </header>

    <section class="user-edit-form">
        <form action="UpdateUserServlet" method="POST">
            <%
                // Get the user ID from the URL parameter
                String userId = request.getParameter("userId");
                Connection conn = DatabaseUtil.getConnection();

                if (userId != null) {
                    // Fetch user data for the given userId
                    String sql = "SELECT * FROM users WHERE id = ?";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, Integer.parseInt(userId));
                    ResultSet rs = stmt.executeQuery();

                    if (rs.next()) {
                        String name = rs.getString("name");
                        String email = rs.getString("email");
                        String phone = rs.getString("phone");
                        String address = rs.getString("address");
                        String role = rs.getString("role");
                        String nic = rs.getString("nic");
            %>

            <input type="hidden" name="userId" value="<%= userId %>">

       
            <label for="name"><i class="fa-solid fa-user"></i> Name:</label>
            <input type="text" id="name" name="name" value="<%= name %>" required>

    
            <label for="email"><i class="fa-solid fa-envelope"></i> Email:</label>
            <input type="email" id="email" name="email" value="<%= email %>" required>

            <label for="phone"><i class="fa-solid fa-phone"></i> Phone:</label>
            <input type="text" id="phone" name="phone" value="<%= phone %>" required>

       
            <label for="address"><i class="fa-solid fa-map-marker-alt"></i> Address:</label>
            <textarea id="address" name="address" required><%= address %></textarea>

     
            <label for="role"><i class="fa-solid fa-user-tag"></i> Role:</label>
            <select name="role" id="role">
                <option value="admin" <%= role.equals("admin") ? "selected" : "" %>>Admin</option>
                <option value="customer" <%= role.equals("customer") ? "selected" : "" %>>Customer</option>
                <option value="driver" <%= role.equals("driver") ? "selected" : "" %>>Driver</option>
            </select>

   
            <label for="nic"><i class="fa-solid fa-id-card"></i> NIC:</label>
            <input type="text" id="nic" name="nic" value="<%= nic %>" required>

            <input type="submit" value="Update User">

            <% 
                    }
                }
            %>
        </form>
    </section>


    <!-- JavaScript -->
    <script src="js/edit-user.js"></script>

</body>
</html>
