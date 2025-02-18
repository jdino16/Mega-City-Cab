<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reset Password - Mega City Cab</title>
    <link rel="stylesheet" href="resetPass.css">
</head>
<body>
    <div class="reset-pass-container">
        <h2>🔒 Reset Your Password</h2>
        <p>Enter a new password below.</p>

        <% String error = request.getParameter("error"); %>
        <% if (error != null) { %>
            <p class="error-message">⚠️ <%= error %></p>
        <% } %>

        <form action="ResetPasswordServlet" method="post">
            <label>New Password</label>
            <input type="password" name="password" required>

            <label>Confirm Password</label>
            <input type="password" name="confirmPassword" required>

            <button type="submit">🔓 Update Password</button>
        </form>

        <p><a href="LoginPage.jsp">Back to Login</a></p>
    </div>
</body>
</html>
