<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help - Mega City Cab</title>
    <link rel="stylesheet" href="help.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script defer src="js/help.js"></script>
</head>
<body>

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
            <li><a href="profile.jsp"><i class="fas fa-user"></i> Profile</a></li>
            <li><a href="settings.jsp"><i class="fas fa-cog"></i> Settings</a></li>
            <li><a href="help.jsp" class="active"><i class="fas fa-question-circle"></i> Help & Support</a></li>
        </ul>
    </nav>

<div class="content">
    <header>
        <h1>Help & Support</h1>
        <p>Find answers to common questions and learn how to use Mega City Cab effectively.</p>
    </header>

    <section class="help-content">
        <h2>Getting Started</h2>
        <p>Welcome to Mega City Cab! This guide will help you understand how to use our system effectively.</p>

        <h3>1. Creating an Account</h3>
        <p>To book a cab, you need an account. Click on <strong>"Sign Up"</strong> on the homepage and fill in your details.</p>

        <h3>2. Booking a Ride</h3>
        <p>Once logged in, go to the <strong>"Customer Dashboard"</strong> and select <strong>"Add Booking"</strong>. Enter your pickup and drop-off locations, date, and time.</p>

        <h3>3. Viewing Your Bookings</h3>
        <p>To check your booked rides, click on <strong>"View Bookings"</strong> in the sidebar.</p>

        <h3>4. Managing Payments</h3>
        <p>All payments can be viewed under <strong>"View Payments"</strong>. You can securely pay online using a credit/debit card.</p>

        <h3>5. Contacting Support</h3>
        <p>If you need help, email us at <a href="mailto:support@megacitycab.com">support@megacitycab.com</a> or call our 24/7 helpline at <strong>+123-456-7890</strong>.</p>
    </section>

    <!-- FAQ Section -->
    <section class="faq-section">
        <h2>Frequently Asked Questions</h2>
        
        <div class="faq-item">
            <button class="faq-question">How do I reset my password? <i class="fas fa-chevron-down"></i></button>
            <div class="faq-answer">
                <p>Go to the <a href="resetPassword.jsp">Reset Password</a> page and follow the instructions.</p>
            </div>
        </div>

        <div class="faq-item">
            <button class="faq-question">Can I cancel a ride? <i class="fas fa-chevron-down"></i></button>
            <div class="faq-answer">
                <p>Yes, go to <a href="viewBookings.jsp">View Bookings</a> and click "Cancel" next to your ride.</p>
            </div>
        </div>

        <div class="faq-item">
            <button class="faq-question">How do I contact my driver? <i class="fas fa-chevron-down"></i></button>
            <div class="faq-answer">
                <p>Once your ride is confirmed, you will receive the driver's contact details via SMS and email.</p>
            </div>
        </div>

        </div>
    </section>

</div>

</body>
</html>
