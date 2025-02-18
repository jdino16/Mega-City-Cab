<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Mega City Cab</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- Custom Styles -->
    <link rel="stylesheet" href="contact.css">
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
            <li><a href="company.jsp"><i class="fas fa-building"></i> Company Details</a></li>
            <li><a href="our-cabs.jsp"><i class="fas fa-taxi"></i> Our Cabs</a></li>
            <li><a href="blog.jsp"><i class="fas fa-newspaper"></i> Blog</a></li>
            <li><a href="contact.jsp" class="active"><i class="fas fa-phone"></i> Contact Us</a></li>
            <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
            <li><a href="settings.jsp"><i class="fas fa-cog"></i> Settings</a></li>
        </ul>
    </nav>

    <!-- 📞 Contact Information Section -->
    <main class="content">
        <section class="contact-hero">
            <h1 class="contact-title">📞 Contact Mega City Cab</h1>
            <p class="contact-description">Reach out to us for support, bookings, or inquiries. We are here 24/7!</p>
        </section>

        <!-- 🌍 Contact Details -->
        <section class="contact-details">
            <div class="contact-box">
                <h2><i class="fas fa-phone"></i> Phone Support</h2>
                <p><a href="tel:+9477483137">Call: +94 774 831 37</a></p>
                <p><a href="tel:+94112345678">Office: +94 112 345 678</a></p>
            </div>
            <div class="contact-box">
                <h2><i class="fas fa-envelope"></i> Email</h2>
                <p><a href="mailto:support@megacitycab.com">support@megacitycab.com</a></p>
                <p><a href="mailto:info@megacitycab.com">info@megacitycab.com</a></p>
            </div>
            <div class="contact-box">
                <h2><i class="fas fa-map-marker-alt"></i> Office Address</h2>
                <p>123 Mega City Tower, Colombo, Sri Lanka</p>
            </div>
            <div class="contact-box">
                <h2><i class="fas fa-clock"></i> Business Hours</h2>
                <p>Monday - Sunday: 24/7 Service</p>
            </div>
        </section>
    </main>

    <!-- JavaScript -->
    <script src="contact.js"></script>
</body>
</html>
