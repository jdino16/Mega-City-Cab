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

<!-- ✅ Display Booking Success Message -->
<% if (message != null) { %>
    <div class="alert success">🎉 <%= message %></div>
<% } %>

<!-- ✅ Billing History Section -->
<div class="billing-container">
    <h2>💰 Billing & Transactions</h2>

    <table>
        <thead>
            <tr>
                <th>Transaction ID</th>
                <th>Booking ID</th>
                <th>Amount (Rs)</th> <%-- ✅ Changed from "$" to "Rs" --%>
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
                        <td>Rs <%= String.format("%.2f", rs.getDouble("amount")) %></td> <%-- ✅ Changed to Rs --%>
                        <td><%= rs.getString("payment_method") %></td>
                        <td><%= rs.getString("status") %></td>
                    </tr>
            <% } conn.close(); %>
        </tbody>
    </table>
</div>

</body>
</html>
