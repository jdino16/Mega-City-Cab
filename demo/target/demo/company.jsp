<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Mega City Cab</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="company.css">
</head>
<body class="bg-black text-white">

    <!-- 🚀 Sidebar Navigation -->
    <nav class="sidebar">
        <div class="sidebar-top">
            <h2 class="logo neon-text">Mega City Cab</h2>
            <button class="expand-btn"><i class="fas fa-bars"></i></button>
        </div>

        <!-- Live Search -->
        <div class="search-wrapper">
            <input type="text" id="searchInput" placeholder="Search...">
            <i class="fas fa-search"></i>
        </div>

        <ul class="sidebar-links">
            <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="fleet.jsp"><i class="fas fa-car"></i> Fleet</a></li>
            <li><a href="company.jsp" class="active"><i class="fas fa-building"></i> Company Details</a></li>
            <li><a href="our-cabs.jsp"><i class="fas fa-taxi"></i> Our Cabs</a></li>
            <li><a href="blog.jsp"><i class="fas fa-newspaper"></i> Blog</a></li>
            <li><a href="contact.jsp"><i class="fas fa-phone"></i> Contact Us</a></li>
            <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
            <li><a href="settings.jsp"><i class="fas fa-cog"></i> Settings</a></li>
        </ul>
    </nav>

     <!-- 🌟 Modern Hero Section -->
     <header class="company-hero">
        <h1 class="hero-title">🚖 Welcome to <span class="highlight">Mega City Cab</span></h1>
        <p class="hero-subtitle">Your **trusted ride** in Colombo, Sri Lanka – Comfort, Safety & Innovation</p>
    </header>

    <!-- 🌍 Company Details Section -->
    <section class="company-info">
        <div class="info-grid">
            <div class="info-box">
                <h2><i class="fas fa-map-marker-alt"></i> Location</h2>
                <p>Colombo, Sri Lanka</p>
            </div>
            <div class="info-box">
                <h2><i class="fas fa-user-tie"></i> CEO</h2>
                <p>Dinoja</p>
            </div>
            <div class="info-box">
                <h2><i class="fas fa-phone"></i> Contact</h2>
                <p><a href="tel:+9477483137">0774 831 37</a></p>
            </div>
            <div class="info-box">
                <h2><i class="fas fa-envelope"></i> Email</h2>
                <p><a href="mailto:info@megacitycab.com">info@megacitycab.com</a></p>
            </div>
        </div>
    </section>

    <!-- 🎯 Our Mission & Vision Section -->
    <section class="mission-vision">
        <h2 class="section-title">🎯 Our Mission</h2>
        <p>To provide **safe, comfortable, and affordable** cab services across Sri Lanka.</p>
        <h2 class="section-title">🚀 Our Vision</h2>
        <p>To become **Sri Lanka’s most advanced smart cab service** using technology-driven efficiency.</p>
    </section>

    <!-- 🚖 Services Offered -->
    <section class="services">
        <h2 class="section-title">🚖 Our Services</h2>
        <div class="service-grid">
            <div class="service-card"><i class="fas fa-taxi"></i><h3>City Taxi</h3><p>Fast and safe taxi rides in Colombo.</p></div>
            <div class="service-card"><i class="fas fa-car-side"></i><h3>Luxury Rides</h3><p>Premium business and VIP transport.</p></div>
            <div class="service-card"><i class="fas fa-bus"></i><h3>Group Transport</h3><p>Spacious vans & mini-buses for group travel.</p></div>
        </div>
    </section>

    <!-- JavaScript -->
    <script src="company.js"></script>
</body>
</html>
