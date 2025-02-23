<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog - Mega City Cab</title>


    <script src="https://cdn.tailwindcss.com"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">


    <link rel="stylesheet" href="blog.css">
</head>
<body class="bg-black text-white">

  
    <nav class="sidebar">
        <div class="sidebar-top">
            <h2 class="logo neon-text">Mega City Cab</h2>
            <button class="expand-btn"><i class="fas fa-bars"></i></button>
        </div>
 
        <div class="search-wrapper">
            <input type="text" id="searchInput" placeholder="Search...">
            <i class="fas fa-search"></i>
        </div>
        <ul class="sidebar-links">
            <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="fleet.jsp"><i class="fas fa-car"></i> Fleet</a></li>
            <li><a href="company.jsp"><i class="fas fa-building"></i> Company Details</a></li>
            <li><a href="our-cabs.jsp"><i class="fas fa-taxi"></i> Our Cabs</a></li>
            <li><a href="blog.jsp" class="active"><i class="fas fa-newspaper"></i> Blog</a></li>
            <li><a href="contact.jsp"><i class="fas fa-phone"></i> Contact Us</a></li>
            <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
            <a href="help.jsp" class="nav-link"><i class="fas fa-question-circle"></i> Help</a> 

            <li><a href="settings.jsp"><i class="fas fa-cog"></i> Settings</a></li>
        </ul>
    </nav>

  
    <main class="content">
        <section class="blog-hero">
            <h1 class="blog-title">📰 Mega City Cab Blog</h1>
            <p class="blog-description">Stay updated with the latest news, offers, and travel tips from Mega City Cab.</p>
        </section>

        <section class="blog-grid">
            <div class="blog-card">
                <h3>New Electric Cabs Launched!</h3>
                <p>We are proud to introduce eco-friendly electric cabs for a greener Colombo.</p>
                <a href="#" class="read-more">Read More</a>
            </div>
            <div class="blog-card">
                <h3>Mega City Rewards</h3>
                <p>Earn points every time you ride with us and redeem them for amazing rewards.</p>
                <a href="#" class="read-more">Read More</a>
            </div>
            <div class="blog-card">
                <h3>Safety First: COVID-19 Precautions</h3>
                <p>Our cabs are sanitized regularly, and drivers follow all safety protocols.</p>
                <a href="#" class="read-more">Read More</a>
            </div>
        </section>
    </main>

    <script src="blog.js"></script>
</body>
</html>
