<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Cabs - Mega City Cab</title>


    <script src="https://cdn.tailwindcss.com"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">


    <link rel="stylesheet" href="our-cabs.css">
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
            <li><a href="our-cabs.jsp" class="active"><i class="fas fa-taxi"></i> Our Cabs</a></li>
            <li><a href="blog.jsp"><i class="fas fa-newspaper"></i> Blog</a></li>
            <li><a href="contact.jsp"><i class="fas fa-phone"></i> Contact Us</a></li>
            <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
            <li><a href="settings.jsp"><i class="fas fa-cog"></i> Settings</a></li>
        </ul>
    </nav>


    <main class="content">
        <section class="cabs-hero">
            <h1 class="cabs-title">🚖 Our Premium Cabs</h1>
            <p class="cabs-description">Choose from our wide range of premium and budget-friendly cabs for your comfortable ride in Colombo.</p>
        </section>

  
        <section class="cabs-grid">
            <div class="cab-card">
                <i class="fas fa-car-side cab-icon"></i>
                <h3>Standard Taxi</h3>
                <p>Affordable and comfortable rides for everyday travel.</p>
            </div>
            <div class="cab-card">
                <i class="fas fa-car cab-icon"></i>
                <h3>Luxury Sedan</h3>
                <p>Experience premium rides with luxury sedans.</p>
            </div>
            <div class="cab-card">
                <i class="fas fa-bus cab-icon"></i>
                <h3>Mini Van</h3>
                <p>Perfect for families and group travels.</p>
            </div>
            <div class="cab-card">
                <i class="fas fa-bolt cab-icon"></i>
                <h3>Electric Cab</h3>
                <p>Eco-friendly and cost-efficient rides.</p>
            </div>
        </section>
    </main>

  
    <script src="our-cabs.js"></script>
</body>
</html>
