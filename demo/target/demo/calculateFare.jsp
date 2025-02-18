<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculate Fare - Mega City Cab</title>
    <link rel="stylesheet" href="calculateFare.css">
</head>
<body>

<%
    String error = request.getParameter("error");
%>

<!-- ✅ Display Error Message if Any -->
<% if (error != null) { %>
    <div class="alert error">⚠️ <%= error %></div>
<% } %>

<!-- ✅ Fare Calculation Form -->
<div class="fare-container">
    <h2>📍 Calculate Your Fare</h2>
    <form action="CalculateFareServlet" method="post">
        <label for="pickup">🚖 Pickup Location</label>
        <select name="pickup" id="pickup" required>
            <option value="">Select a pickup location</option>
            <option value="Colombo City">Colombo City</option>
            <option value="Colombo Town">Colombo Town</option>
            <option value="Colombo Hospitals">Colombo Hospitals</option>
            <option value="Colombo Bus Stands">Colombo Bus Stands</option>
            <option value="Colombo Airports">Colombo Airports</option>
            <option value="Colombo Railway Station">Colombo Railway Station</option>
            <option value="Colombo Auto Stand">Colombo Auto Stand</option>
            <option value="Colombo Mall">Colombo Mall</option>
            <option value="Colombo Food City">Colombo Food City</option>
            <option value="Colombo Wedding Halls">Colombo Wedding Halls</option>
            <option value="Colombo Kovils">Colombo Kovils</option>
        </select>

        <label for="destination">🏁 Destination</label>
        <select name="destination" id="destination" required>
            <option value="">Select a destination</option>
            <option value="Colombo City">Colombo City</option>
            <option value="Colombo Town">Colombo Town</option>
            <option value="Colombo Hospitals">Colombo Hospitals</option>
            <option value="Colombo Bus Stands">Colombo Bus Stands</option>
            <option value="Colombo Airports">Colombo Airports</option>
            <option value="Colombo Railway Station">Colombo Railway Station</option>
            <option value="Colombo Auto Stand">Colombo Auto Stand</option>
            <option value="Colombo Mall">Colombo Mall</option>
            <option value="Colombo Food City">Colombo Food City</option>
            <option value="Colombo Wedding Halls">Colombo Wedding Halls</option>
            <option value="Colombo Kovils">Colombo Kovils</option>
        </select>

        <label for="distance">📏 Estimated Distance (KM)</label>
        <input type="number" id="distance" name="distance" step="0.1" required placeholder="Enter estimated distance in KM">

        <button type="submit">💰 Calculate Fare</button>
    </form>

    <% String fare = request.getParameter("fare"); %>
    <% if (fare != null) { %>
        <p class="fare-display">🚕 Estimated Fare: Rs <%= fare %></p> <%-- ✅ Changed to Rs --%>
    <% } %>

</div>

</body>
</html>
