<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - Mega City Cab</title>

  
    <script src="https://cdn.tailwindcss.com"></script>


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

 
    <link rel="stylesheet" href="profile.css">
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
            <li><a href="blog.jsp"><i class="fas fa-newspaper"></i> Blog</a></li>
            <li><a href="contact.jsp"><i class="fas fa-phone"></i> Contact Us</a></li>
            <li><a href="profile1.jsp" class="active"><i class="fas fa-user"></i> Profile</a></li>
            <li><a href="settings.jsp"><i class="fas fa-cog"></i> Settings</a></li>
        </ul>
    </nav>

    <main class="content">
        <section class="profile-container">
            <div class="profile-card">
                <div class="profile-header">
                    <h1>👤 My Profile</h1>
                    <p>Manage your account details and settings.</p>
                </div>
                <div class="profile-details">
                    <p><strong>Name:</strong> Dinoja(Owner)</p>
                    <p><strong>Email:</strong> dino@gmail.com</p>
                    <p><strong>Phone:</strong> +94 774 831 37</p>
                    <p><strong>Membership:</strong> Premium User</p>
                    <p><strong>Account Status:</strong> Active</p>
                </div>
              
            </div>
        </section>
    </main>

    <script src="profile.js"></script>
</body>
</html>
