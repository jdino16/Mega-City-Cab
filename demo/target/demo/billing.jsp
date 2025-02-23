<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Billing - Mega City Cab</title>
    <link rel="stylesheet" href="billing.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>

<%
    // Ensure user is logged in
    Object userIdObj = session.getAttribute("userId");
    if (userIdObj == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    int userId = (Integer) userIdObj;

    // Check if a success message exists
    String message = request.getParameter("message");
%>


<% if (message != null) { %>
    <div class="alert success">🎉 <%= message %></div>
<% } %>

<div class="billing-container">
    <h2>💰 Billing & Transactions</h2>

    <table>
        <thead>
            <tr>
                <th>Transaction ID</th>
                <th>Booking ID</th>
                <th>Amount (Rs)</th> 
                <th>Payment Method</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% 
                Connection conn = DatabaseUtil.getConnection();
                String sql = "SELECT transaction_id, booking_id, amount, payment_method, status FROM payments WHERE user_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getInt("transaction_id") %></td>
                        <td><%= rs.getInt("booking_id") %></td>
                        <td>Rs <%= String.format("%.2f", rs.getDouble("amount")) %></td> 
                        <td><%= rs.getString("payment_method") %></td>
                        <td><%= rs.getString("status") %></td>
                    </tr>
            <% } conn.close(); %>
        </tbody>
    </table>
</div>

<div class="quick-actions">
    <a href="booking.jsp" class="action-btn"><i class="fas fa-calendar-check"></i> View Bookings</a>
    <a href="billing.jsp" class="action-btn"><i class="fas fa-credit-card"></i> Billing & Transactions</a>
    <a href="profile1.jsp" class="action-btn"><i class="fas fa-user-edit"></i> Edit Profile</a>
    <a href="support.jsp" class="action-btn"><i class="fas fa-question-circle"></i> Get Support</a>
</div>


<nav class="navbar">
    <div class="navbar">
        <a href="index.jsp" class="nav-link"><i class="fas fa-home"></i> Home</a>
        <a href="our-cabs.jsp" class="nav-link"><i class="fas fa-taxi"></i> Our Cabs</a>
        <a href="company.jsp" class="nav-link"><i class="fas fa-building"></i> Company</a>
        <a href="booking.jsp" class="nav-link"><i class="fas fa-taxi"></i> Booking</a>
        <a href="help.jsp" class="nav-link"><i class="fas fa-question-circle"></i> Help</a> 
        <a href="profile1.jsp" class="nav-link"><i class="fas fa-user-edit"></i> Manage Profile</a>
        <a href="logout.jsp" class="nav-link"><i class="fas fa-sign-out-alt"></i> Logout</a>    
    </div>
</nav>

</body>
</html>
