<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<%
    int transactionId = Integer.parseInt(request.getParameter("transactionId"));

    Connection conn = DatabaseUtil.getConnection();
    String sql = "SELECT * FROM payments WHERE transaction_id=?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setInt(1, transactionId);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) { 
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Invoice - Mega City Cab</title>
    <style>
        body { font-family: 'Arial', sans-serif; }
        .invoice-container { width: 60%; margin: auto; padding: 20px; background: white; border-radius: 8px; }
        h2 { text-align: center; }
    </style>
</head>
<body>
    <div class="invoice-container">
        <h2>Invoice #<%= transactionId %></h2>
        <p><strong>Booking ID:</strong> <%= rs.getInt("booking_id") %></p>
        <p><strong>Amount:</strong> $<%= rs.getDouble("amount") %></p>
        <p><strong>Payment Method:</strong> <%= rs.getString("payment_method") %></p>
        <p><strong>Status:</strong> <%= rs.getString("status") %></p>
        <p>Thank you for choosing Mega City Cab!</p>
    </div>
</body>
</html>

<%
    } else {
        out.println("<p>Invoice not found.</p>");
    }
    conn.close();
%>
