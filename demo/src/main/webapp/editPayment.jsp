<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Payment - Mega City Cab</title>
</head>
<body>
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
        <label for="userId">User ID: </label><input type="text" name="userId" value="<%= userId %>" disabled><br>
        <label for="bookingId">Booking ID: </label><input type="text" name="bookingId" value="<%= bookingId %>" disabled><br>
        <label for="amount">Amount: </label><input type="text" name="amount" value="<%= amount %>" required><br>
        <label for="paymentMethod">Payment Method: </label><input type="text" name="paymentMethod" value="<%= paymentMethod %>" required><br>
        <label for="status">Status: </label><input type="text" name="status" value="<%= status %>" required><br>
        <input type="submit" value="Update Payment">
    </form>

    <%
        } else {
            out.print("Payment not found.");
        }
        conn.close();
    %>
</body>
</html>
