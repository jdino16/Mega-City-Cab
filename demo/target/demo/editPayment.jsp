<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Payment - Mega City Cab</title>
    

    <link rel="stylesheet" href="styles/editpayment.css">
    
    <script src="scripts/editpayment.js" defer></script>
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

    <main>
        <header>
            <h1>Edit Payment</h1>
        </header>

        <%
            int transactionId = Integer.parseInt(request.getParameter("transactionId"));
            Connection conn = DatabaseUtil.getConnection();
            String sql = "SELECT * FROM payments WHERE transaction_id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, transactionId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int userId = rs.getInt("user_id");
                int bookingId = rs.getInt("booking_id");
                double amount = rs.getDouble("amount");
                String paymentMethod = rs.getString("payment_method");
                String status = rs.getString("status");
        %>

        <form action="updatePaymentServlet" method="post">
            <input type="hidden" name="transactionId" value="<%= transactionId %>">
            <label for="amount">Amount:</label>
            <input type="text" name="amount" value="<%= amount %>" required><br>
            
            <label for="paymentMethod">Payment Method:</label>
            <input type="text" name="paymentMethod" value="<%= paymentMethod %>" required><br>
            
            <label for="status">Status:</label>
            <input type="text" name="status" value="<%= status %>" required><br>
            
            <input type="submit" value="Update Payment">
        </form>

        <%
            } else {
                out.print("Payment not found.");
            }
            conn.close();
        %>
    </main>
</body>
</html>
