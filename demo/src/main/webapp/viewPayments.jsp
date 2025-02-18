<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Payments - Mega City Cab</title>
</head>
<body>
    <header>
        <h1>View All Payments</h1>
    </header>

    <section class="payment-list">
        <table border="1">
            <thead>
                <tr>
                    <th>Transaction ID</th>
                    <th>User ID</th>
                    <th>Booking ID</th>
                    <th>Amount</th>
                    <th>Payment Method</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Get the payment details from the database
                    Connection conn = DatabaseUtil.getConnection();
                    String sql = "SELECT * FROM payments";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    ResultSet rs = stmt.executeQuery();

                    // Loop through the result set and display each payment's details
                    while (rs.next()) {
                        int transactionId = rs.getInt("transaction_id");
                        int userId = rs.getInt("user_id");
                        int bookingId = rs.getInt("booking_id");
                        double amount = rs.getDouble("amount");
                        String paymentMethod = rs.getString("payment_method");
                        String status = rs.getString("status");
                %>
                    <tr>
                        <td><%= transactionId %></td>
                        <td><%= userId %></td>
                        <td><%= bookingId %></td>
                        <td><%= amount %></td>
                        <td><%= paymentMethod %></td>
                        <td><%= status %></td>
                        <td>
                            <a href="editPayment.jsp?transactionId=<%= transactionId %>">Edit</a> |
                            <a href="deletePaymentServlet?transactionId=<%= transactionId %>" onclick="return confirm('Are you sure you want to delete this payment?')">Delete</a>
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
