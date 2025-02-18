<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab - Neon Edition</title>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <!-- Three.js for 3D Animations -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>

    <!-- Custom Styles -->
    <link rel="stylesheet" href="style.css">
</head>
<body class="bg-black text-white overflow-hidden">

    <!-- 🚀 Loading Screen -->
    <div class="loading-screen">
        <p class="loading-text">🚖 Mega City Cab is Loading...</p>
        <div class="loading-progress">
            <div class="loading-progress-bar"></div>
        </div>
    </div>

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
            <li><a href="LoginPage.jsp" class="active"><i class="fas fa-cog"></i> Login</a></li>
            <li><a href="fleet.jsp"><i class="fas fa-car"></i> Fleet</a></li>
            <li><a href="company.jsp"><i class="fas fa-building"></i> Company Details</a></li>
            <li><a href="our-cabs.jsp"><i class="fas fa-taxi"></i> Our Cabs</a></li>
            <li><a href="blog.jsp"><i class="fas fa-newspaper"></i> Blog</a></li>
            <li><a href="contact.jsp"><i class="fas fa-phone"></i> Contact Us</a></li>
            <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
            <li><a href="settings.jsp" class="active"><i class="fas fa-cog"></i> Settings</a></li>
            
        </ul>
    </nav>

    <!-- 🌟 Main Content -->
    <main class="content">
        <section class="hero">
            <h1 class="hero-title neon-text">🚖 Welcome to <span class="highlight">Mega City Cab</span></h1>
            <p class="hero-text">Your premium ride in Colombo. Book your cab now!</p>

<!-- 🔻 Centered Arrow to Navigate to Home/Booking -->
<div id="arrowContainer">
    <p class="arrow-text">Continue to the Next Step</p>
    <a href="LoginPage.jsp" class="arrow-down">
        <i class="fas fa-chevron-down"></i>
    </a>
</div>

<!-- 🏁 Book Your Ride Section -->
<div class="book-ride-container">
    <p class="book-ride-text">🚖 Ready to book your ride?</p>
    <a href="LoginPage.jsp" class="book-ride-btn">
        <i class="fas fa-car-side"></i> Ready to your Ride
    </a>
</div>

            <!-- ⏳ Real-time Date & Time -->
            <div class="date-time">
                <p id="realTime"></p>
            </div>
        </section>
    </main>
       
            
    <!-- 📍 Toggle Button for Location Section -->
    <button id="toggleLocationBtn" class="toggle-btn">
        <i class="fas fa-map-marker-alt"></i> Show Location & Contact
    </button>

    <!-- 📍 Location & Contact Section -->
    <section id="locationSection" class="contact-section hidden">
        <h2 class="contact-title">📍 Our Location & Contact</h2>
        <div class="contact-container">
            <div class="contact-item">
                <i class="fas fa-map-marker-alt contact-icon"></i>
                <p>Mega City Cab Office, Colombo, Sri Lanka</p>
            </div>
            <div class="contact-item">
                <i class="fas fa-envelope contact-icon"></i>
                <p><a href="mailto:support@megacitycab.com">support@megacitycab.com</a></p>
            </div>
            <div class="contact-item">
                <i class="fas fa-phone-alt contact-icon"></i>
                <p><a href="tel:+94112345678">+94 112 345 678</a></p>
            </div>
        </div>
    </section>

    <!-- 🚀 Floating Action Button -->
    <button class="fab"><i class="fas fa-taxi"></i></button>

    <!-- 📢 Modern Pop-up Message -->
    <div id="popup" class="popup">
        <h4 class="popup-title">📢 Welcome to Mega City Cab!</h4>
        <p class="popup-message">Enjoy premium rides with real-time tracking & luxury service.</p>
        <button onclick="closePopup()" class="popup-close">OK</button>
    </div>

    
    <!-- JavaScript -->
    <script src="script.js"></script>

    

</body>
</html>
