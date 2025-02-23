<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard - Mega City Cab</title>
    <link rel="stylesheet" href="customerDashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.10.1/dist/gsap.min.js"></script>
</head>
<body>

    <nav class="navbar">
        <div class="navbar">
            <a href="index.jsp" class="nav-link"><i class="fas fa-home"></i> Home</a>
            <a href="our-cabs.jsp" class="nav-link"><i class="fas fa-taxi"></i> Our Cabs</a>
            <a href="company.jsp" class="nav-link"><i class="fas fa-building"></i> Company</a>
            <a href="booking.jsp" class="nav-link"><i class="fas fa-taxi"></i> Booking</a>
            <a href="profile1.jsp" class="nav-link"><i class="fas fa-user"></i> Manage Profile</a>
            <a href="help.jsp" class="nav-link"><i class="fas fa-question-circle"></i> Help</a> 
            <a href="logout.jsp" class="nav-link"><i class="fas fa-sign-out-alt"></i> Logout</a>    
        </div>
    </nav>
    

<%
    // Ensure user is logged in
    Object userIdObj = session.getAttribute("userId");
    if (userIdObj == null) {
        response.sendRedirect("LoginPage.jsp");
        return;
    }
    int userId = (Integer) userIdObj;

    Connection conn = DatabaseUtil.getConnection();
    
    int upcomingBookings = 0;
    int completedRides = 0;
    double totalSpent = 0.0;

    // Count Upcoming Bookings
    String sqlUpcoming = "SELECT COUNT(*) FROM bookings WHERE user_id = ? AND status IN ('Pending', 'Confirmed')";
    PreparedStatement stmtUpcoming = conn.prepareStatement(sqlUpcoming);
    stmtUpcoming.setInt(1, userId);
    ResultSet rsUpcoming = stmtUpcoming.executeQuery();
    if (rsUpcoming.next()) {
        upcomingBookings = rsUpcoming.getInt(1);
    }

    // Count Completed Rides
    String sqlCompleted = "SELECT COUNT(*) FROM bookings WHERE user_id = ? AND status = 'Completed'";
    PreparedStatement stmtCompleted = conn.prepareStatement(sqlCompleted);
    stmtCompleted.setInt(1, userId);
    ResultSet rsCompleted = stmtCompleted.executeQuery();
    if (rsCompleted.next()) {
        completedRides = rsCompleted.getInt(1);
    }

    // Calculate Total Spent in Rs
    String sqlTotalSpent = "SELECT SUM(amount) FROM payments WHERE user_id = ?";
    PreparedStatement stmtTotalSpent = conn.prepareStatement(sqlTotalSpent);
    stmtTotalSpent.setInt(1, userId);
    ResultSet rsTotalSpent = stmtTotalSpent.executeQuery();
    if (rsTotalSpent.next()) {
        totalSpent = rsTotalSpent.getDouble(1);
    }
%>


<div class="dashboard-summary">
    <h2>🚖 Welcome, <%= session.getAttribute("username") %>!</h2>
    <p>Here's a quick overview of your recent activity.</p>

    <div class="dashboard-cards">
   
        <div class="dashboard-card yellow">
            <i class="fas fa-calendar-alt"></i>
            <h3>🚖 Upcoming Bookings</h3>
            <p><%= upcomingBookings %></p>
        </div>
        <div class="dashboard-card blue">
            <i class="fas fa-check-circle"></i>
            <h3>📜 Completed Rides</h3>
            <p><%= completedRides %></p>
        </div>

        <div class="dashboard-card green">
            <i class="fas fa-wallet"></i>
            <h3>💰 Total Spent</h3>
            <p>Rs <%= String.format("%.2f", totalSpent) %></p>
        </div>
    </div>
</div>

<div class="recent-bookings">
    <h2>Your Recent Bookings</h2>
    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Pickup</th>
                <th>Destination</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Fetch latest 5 bookings
                String sqlRecent = "SELECT booking_id, pickup, destination, date, status FROM bookings WHERE user_id = ? ORDER BY date DESC LIMIT 5";
                PreparedStatement stmtRecent = conn.prepareStatement(sqlRecent);
                stmtRecent.setInt(1, userId);
                ResultSet rsRecent = stmtRecent.executeQuery();
                
                while (rsRecent.next()) { %>
                    <tr>
                        <td><%= rsRecent.getInt("booking_id") %></td>
                        <td><%= rsRecent.getString("pickup") %></td>
                        <td><%= rsRecent.getString("destination") %></td>
                        <td><%= rsRecent.getString("date") %></td>
                        <td><%= rsRecent.getString("status") %></td>
                    </tr>
            <% } %>
        </tbody>
    </table>
</div>


<div class="quick-actions">
    <a href="booking.jsp" class="action-btn"><i class="fas fa-calendar-check"></i> View Bookings</a>
    <a href="billing.jsp" class="action-btn"><i class="fas fa-credit-card"></i> Billing & Transactions</a>
    <a href="profile1.jsp" class="action-btn"><i class="fas fa-user-edit"></i> Edit Profile</a>
    <a href="support.jsp" class="action-btn"><i class="fas fa-question-circle"></i> Get Support</a>
</div>

<%
    // Close database connection
    conn.close();
%>


<script src="customerDashboard.js"></script>

</body>
</html>
