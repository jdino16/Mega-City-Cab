<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Car - Mega City Cab</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <h1>🚗 Add New Car</h1>
    <p>Please fill out the form below to add a new car to the system.</p>

    <!-- Car Information Form -->
    <form action="AddCarServlet" method="post">
        <!-- Car Name -->
        <label for="carName">Car Name</label>
        <input type="text" id="carName" name="carName" required placeholder="Enter car name">

        <!-- Car Model -->
        <label for="carModel">Car Model</label>
        <input type="text" id="carModel" name="carModel" required placeholder="Enter car model">

        <!-- Car Type -->
        <label for="carType">Car Type</label>
        <select id="carType" name="carType" required>
            <option value="Economy">Economy</option>
            <option value="Luxury">Luxury</option>
            <option value="Family">Family</option>
        </select>

        <!-- Year -->
        <label for="year">Year</label>
        <input type="number" id="year" name="year" required placeholder="Enter car's year" min="1900" max="2100">

        <!-- Registration Number -->
        <label for="registrationNumber">Registration Number</label>
        <input type="text" id="registrationNumber" name="registrationNumber" required placeholder="Enter car's registration number">

        <!-- Car Status -->
        <label for="status">Car Status</label>
        <select id="status" name="status" required>
            <option value="Available">Available</option>
            <option value="Booked">Booked</option>
            <option value="Unavailable">Unavailable</option>
        </select>

        <button type="submit">Add Car</button>
    </form>

    <a href="viewCars.jsp">Back to Car Information</a>

</body>
</html>
