<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Mega City Cab</title>


    <script src="https://cdn.tailwindcss.com"></script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">


    <link rel="stylesheet" href="loginPage.css">
</head>
<body class="flex flex-col items-center justify-center min-h-screen bg-gray-900 text-white">


    <nav class="sidebar">
        <div class="sidebar-top">
            <h2 class="logo neon-text">Mega City Cab</h2>
            <button class="expand-btn"><i class="fas fa-bars"></i></button>
        </div>
        <ul class="sidebar-links">
            <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="fleet.jsp"><i class="fas fa-car"></i> Fleet</a></li>
            <li><a href="company.jsp"><i class="fas fa-building"></i> Company</a></li>
            <li><a href="our-cabs.jsp" class="active"><i class="fas fa-taxi"></i> Our Cabs</a></li>
            <li><a href="blog.jsp"><i class="fas fa-newspaper"></i> Blog</a></li>
            <li><a href="contact.jsp"><i class="fas fa-phone"></i> Contact</a></li>
            <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
            <li><a href="settings.jsp"><i class="fas fa-cog"></i> Settings</a></li>
        </ul>
    </nav>

    <div class="login-container">
        <h2 class="text-3xl font-semibold neon-glow">🔐 Welcome Back</h2>
        <p class="text-gray-300">Sign in to continue your journey with Mega City Cab</p>

       
        <% String error = request.getParameter("error"); %>
        <% if (error != null) { %>
            <p class="error-message">⚠️ Invalid Email or Password</p>
        <% } %>

        <form action="LoginServlet" method="post" id="loginForm">
            <div class="form-group">
                <label for="email"><i class="fas fa-envelope"></i> Email</label>
                <input type="email" id="email" name="email" required placeholder="Enter your email">
                <small id="emailError"></small>
            </div>

            <div class="form-group">
                <label for="password"><i class="fas fa-lock"></i> Password</label>
                <input type="password" id="password" name="password" required placeholder="Enter your password">
                <small id="passwordError"></small>
            </div>

            <button type="submit" class="login-btn">🚀 Login</button>
        </form>

      
        <p class="auth-link">
            <a href="Signup.jsp">Don't have an account? Sign up</a> | 
            <a href="ForgotPassword.jsp">Forgot Password?</a>
        </p>
    </div>


    <script src="loginPage.js"></script>

</body>
</html>
