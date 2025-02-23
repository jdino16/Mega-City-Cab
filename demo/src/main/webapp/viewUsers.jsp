<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Users - Mega City Cab</title>
    <link rel="stylesheet" href="styles/viewusers.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body>


    <div class="sidebar-left">
        <div class="sidebar-links">
            <a href="index.jsp" class="nav-link"><i class="fas fa-home"></i> Home</a>
            <a href="company.jsp" class="nav-link"><i class="fas fa-building"></i> Company</a>
            <a href="customerDashboard.jsp" class="nav-link"><i class="fas fa-tachometer-alt"></i> Customer Dashboard</a>
            <a href="support.jsp" class="nav-link"><i class="fas fa-question-circle"></i> Help</a>
            <a href="logout.jsp" class="nav-link"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>


    <div class="sidebar-right">
        <div class="action-buttons">
            <a href="viewBookings.jsp" class="action-btn">📅 View Bookings</a>
            <a href="viewCars.jsp" class="action-btn">🚗 View Cars</a>
            <a href="viewDrivers.jsp" class="action-btn">👨‍🔧 View Drivers</a>
            <a href="viewUsers.jsp" class="action-btn">👤 View Users</a>
            <a href="viewPayments.jsp" class="action-btn">💳 View Payments</a>
            <a href="addBooking.jsp" class="action-btn">📅 Add Booking</a>
            <a href="addCar.jsp" class="action-btn">🚗 Add Car</a>
            <a href="addDriver.jsp" class="action-btn">👨‍🔧 Add Driver</a>
            <a href="addUser.jsp" class="action-btn">👤 Add User</a>
            <a href="addPayment.jsp" class="action-btn">💳 Add Payment</a>
        </div>
    </div>


    <div class="content">
        <header>
            <h1>View All Users</h1>
        </header>

        <section class="user-list">
            <table class="user-table">
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

                                <a href="editUser.jsp?userId=<%= userId %>" class="edit-user" data-user-id="<%= userId %>">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                            

                                <a href="deleteUserServlet?userId=<%= userId %>" class="delete-user" onclick="return confirm('Are you sure you want to delete this user?');">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </a>
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
    </div>

    <script src="js/viewusers.js"></script>
</body>
</html>
