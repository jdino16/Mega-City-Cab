<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*, com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Booking - Mega City Cab</title>
    

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">


    <link rel="stylesheet" href="styles/editbooking.css">


    <script src="scripts/editbooking.js" defer></script>
</head>
<body>
  
    <div class="sidebar">
        <div class="logo">
            <h2>Mega City Cab</h2>
        </div>
        <ul class="nav-links">
            <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="company.jsp"><i class="fas fa-building"></i> Company</a></li>
            <li><a href="customerDashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="viewBookings.jsp"><i class="fas fa-book"></i> Bookings</a></li>
            <li><a href="viewPayments.jsp"><i class="fas fa-credit-card"></i> Payments</a></li>
            <li><a href="support.jsp"><i class="fas fa-question-circle"></i> Support</a></li>
            <a href="help.jsp" class="nav-link"><i class="fas fa-question-circle"></i> Help</a> 
            <li><a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
        </ul>
    </div>


    <main class="content">
        <header>
            <h1>Edit Booking</h1>
        </header>

        <section class="booking-form">
            <form action="EditBookingServlet" method="POST">
                <input type="hidden" name="bookingId" value="${bookingId}" />

                <label for="pickup">Pickup Location:</label>
                <input type="text" id="pickup" name="pickup" value="${pickup}" required />

                <label for="destination">Destination:</label>
                <input type="text" id="destination" name="destination" value="${destination}" required />

                <label for="date">Date:</label>
                <input type="date" id="date" name="date" value="${date}" required />

                <label for="status">Status:</label>
                <select name="status" id="status" required>
                    <option value="Pending" ${status == 'Pending' ? 'selected' : ''}>Pending</option>
                    <option value="Confirmed" ${status == 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                    <option value="Completed" ${status == 'Completed' ? 'selected' : ''}>Completed</option>
                </select>

                <input type="submit" value="Update Booking" />
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2025 Mega City Cab. All rights reserved.</p>
    </footer>
</body>
</html>
