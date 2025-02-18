<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book a Ride - Mega City Cab</title>
    <link rel="stylesheet" href="booking.css">
    <script src="booking.js" defer></script>
</head>
<body>

<%
    // Ensure user is logged in
    Object userIdObj = session.getAttribute("userId");
    if (userIdObj == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    int userId = (Integer) userIdObj;
    
    // Retrieve parameters for persistence
    String customerName = request.getParameter("customerName");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String pickup = request.getParameter("pickup");
    String destination = request.getParameter("destination");
    String distance = request.getParameter("distance");
    String fare = request.getParameter("fare");
%>

<!-- ✅ Booking Form Section -->
<div class="booking-container">
    <h2>🚖 Book Your Ride</h2>

    <form action="CalculateFareServlet" method="post" onsubmit="return validateForm()">
        <label for="customerName">👤 Customer Name</label>
        <input type="text" id="customerName" name="customerName" required placeholder="Enter your name"
               value="<%= customerName != null ? customerName : "" %>">

        <label for="phone">📞 Phone Number</label>
        <input type="text" id="phone" name="phone" required placeholder="Enter your phone number"
               value="<%= phone != null ? phone : "" %>">

        <label for="address">🏠 Address</label>
        <input type="text" id="address" name="address" required placeholder="Enter your address"
               value="<%= address != null ? address : "" %>">

        <label for="pickup">📍 Pickup Location</label>
        <select id="pickup" name="pickup" required>
            <option value="">-- Select Pickup Location --</option>
            <option value="Colombo City" <%= "Colombo City".equals(pickup) ? "selected" : "" %>>Colombo City</option>
            <option value="Colombo Town" <%= "Colombo Town".equals(pickup) ? "selected" : "" %>>Colombo Town</option>
        </select>

        <label for="destination">📍 Destination</label>
        <select id="destination" name="destination" required>
            <option value="">-- Select Destination --</option>
            <option value="Colombo Mall" <%= "Colombo Mall".equals(destination) ? "selected" : "" %>>Colombo Mall</option>
            <option value="Colombo Airports" <%= "Colombo Airports".equals(destination) ? "selected" : "" %>>Colombo Airports</option>
        </select>

        <label for="distance">📏 Estimated Distance (KM)</label>
        <input type="number" id="distance" name="distance" required min="1" step="0.1" placeholder="Enter Distance in KM"
               value="<%= distance != null ? distance : "" %>">

        <label for="date">📅 Booking Date</label>
        <input type="datetime-local" id="date" name="date" required value="<%= new java.util.Date() %>">

        <input type="hidden" name="userId" value="<%= userId %>">
        
        <button type="submit">💰 Calculate Fare</button>
    </form>

    <% if (fare != null) { %>
        <p class="fare-display">🚕 Estimated Fare: Rs <%= fare %></p>

        <!-- Confirm Booking Button -->
        <form action="BookingServlet" method="post">
            <input type="hidden" name="userId" value="<%= userId %>">
            <input type="hidden" name="customerName" value="<%= customerName %>">
            <input type="hidden" name="phone" value="<%= phone %>">
            <input type="hidden" name="address" value="<%= address %>">
            <input type="hidden" name="pickup" value="<%= pickup %>">
            <input type="hidden" name="destination" value="<%= destination %>">
            <input type="hidden" name="distance" value="<%= distance %>">
            <input type="hidden" name="fare" value="<%= fare %>">
            <button type="submit">✅ Confirm Booking</button>
        </form>
    <% } %>
</div>

<!-- ✅ Booking History Section -->
<div class="booking-history">
    <h2>📜 Your Past Bookings</h2>
    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Customer Name</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Pickup</th>
                <th>Destination</th>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% 
                Connection conn = DatabaseUtil.getConnection();
                String sql = "SELECT booking_id, customer_name, phone, address, pickup, destination, date, status FROM bookings WHERE user_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) { %>
                    <tr>
                        <td><%= rs.getInt("booking_id") %></td>
                        <td><%= rs.getString("customer_name") %></td>
                        <td><%= rs.getString("phone") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td><%= rs.getString("pickup") %></td>
                        <td><%= rs.getString("destination") %></td>
                        <td><%= rs.getString("date") %></td>
                        <td><%= rs.getString("status") %></td>
                    </tr>
            <% } conn.close(); %>
        </tbody>
    </table>
</div>

<script>
    function validateForm() {
        const pickup = document.getElementById("pickup").value;
        const destination = document.getElementById("destination").value;
        const distance = document.getElementById("distance").value;

        if (pickup === destination) {
            alert("🚫 Pickup and destination cannot be the same.");
            return false;
        }

        if (distance <= 0) {
            alert("🚫 Distance must be greater than 0.");
            return false;
        }

        return true;
    }
</script>

</body>
</html>
