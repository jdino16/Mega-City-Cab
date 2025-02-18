<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password - Mega City Cab</title>
    <link rel="stylesheet" href="forgotPass.css">
</head>
<body>
    <div class="forgot-pass-container">
        <h2>🔑 Forgot Password?</h2>
        <p>Enter your email to reset your password.</p>

        <% String error = request.getParameter("error"); %>
        <% if (error != null) { %>
            <p class="error-message">⚠️ <%= error %></p>
        <% } %>

        <form action="ForgotPasswordServlet" method="post">
            <label>Email</label>
            <input type="email" name="email" required>
            <button type="submit">📩 Submit</button>
        </form>

        <p><a href="LoginPage.jsp">Back to Login</a></p>
    </div>
</body>
</html>
