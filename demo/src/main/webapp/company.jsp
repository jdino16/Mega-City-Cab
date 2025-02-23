<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Mega City Cab</title>

    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="company.css">
</head>
<body class="bg-gradient-to-r from-gray-900 via-black to-gray-900 text-white">

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
            <li><a href="blog.jsp"><i class="fas fa-newspaper"></i> Blog</a></li>
            <li><a href="contact.jsp" class="active"><i class="fas fa-phone"></i> Contact Us</a></li>
            <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
            <li><a href="settings.jsp"><i class="fas fa-cog"></i> Settings</a></li>
        </ul>
    </nav>


    <div class="content ml-64 p-8">
        <header class="text-center">
            <h1 class="text-5xl font-bold text-yellow-400">🚖 Welcome to Mega City Cab</h1>
            <p class="mt-2 text-gray-300">Your trusted ride in Colombo, Sri Lanka – Comfort, Safety & Innovation</p>
        </header>

        <section class="company-info mt-8">
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
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
                    <p><a href="mailto:info@megacitycab.com">megacitycab@gmail.com</a></p>
                </div>
            </div>
        </section>

        <section class="mission-vision mt-10 text-center">
            <h2 class="text-3xl text-yellow-400">🎯 Our Mission</h2>
            <p class="text-gray-300">To provide safe, comfortable, and affordable cab services across Sri Lanka.</p>
            <h2 class="text-3xl text-yellow-400 mt-6">🚀 Our Vision</h2>
            <p class="text-gray-300">To become Sri Lanka’s most advanced smart cab service using technology-driven efficiency.</p>
        </section>

        <section class="services mt-12">
            <h2 class="text-center text-4xl text-yellow-400">🚖 Our Services</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-6">
                <div class="service-card">
                    <i class="fas fa-taxi text-4xl"></i>
                    <h3>City Taxi</h3>
                    <p>Fast and safe taxi rides in Colombo.</p>
                </div>
                <div class="service-card">
                    <i class="fas fa-car-side text-4xl"></i>
                    <h3>Luxury Rides</h3>
                    <p>Premium business and VIP transport.</p>
                </div>
                <div class="service-card">
                    <i class="fas fa-bus text-4xl"></i>
                    <h3>Group Transport</h3>
                    <p>Spacious vans & mini-buses for group travel.</p>
                </div>
            </div>
        </section>
    </div>

    <script src="company.js"></script>
</body>
</html>
