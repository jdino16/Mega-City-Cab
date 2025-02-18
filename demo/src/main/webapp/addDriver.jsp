<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Driver - Mega City Cab</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <h1>🚗 Register New Driver</h1>
    <p>Please fill out the form below to register a new driver.</p>

    <!-- Driver Information Form -->
    <form action="AddDriverServlet" method="post">
        <label for="driverName">Driver Name</label>
        <input type="text" id="driverName" name="driverName" required placeholder="Enter driver's full name">

        <label for="phone">Phone</label>
        <input type="text" id="phone" name="phone" required placeholder="Enter phone number">

        <label for="carModel">Car Model</label>
        <input type="text" id="carModel" name="carModel" required placeholder="Enter car model">

        <label for="status">Driver Status</label>
        <select id="status" name="status" required>
            <option value="Available">Available</option>
            <option value="Unavailable">Unavailable</option>
        </select>

        <button type="submit">Register Driver</button>
    </form>

    <a href="adminDashboard.jsp">Back to Admin Dashboard</a>

</body>
</html>
