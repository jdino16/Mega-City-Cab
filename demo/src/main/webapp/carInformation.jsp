<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Information - Mega City Cab</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <h1>🚗 Car Information</h1>
    <p>Here is a list of cars available for bookings.</p>

    <table border="1">
        <thead>
            <tr>
                <th>Car ID</th>
                <th>Car Name</th>
                <th>Car Model</th>
                <th>Car Type</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Fetch the car information from the database
                Connection conn = DatabaseUtil.getConnection();
                String sql = "SELECT * FROM cars";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();

                while (rs.next()) {
                    int carId = rs.getInt("car_id");
                    String carName = rs.getString("car_name");
                    String carModel = rs.getString("car_model");
                    String carType = rs.getString("car_type");
                    String status = rs.getString("status");
            %>
            <tr>
                <td><%= carId %></td>
                <td><%= carName %></td>
                <td><%= carModel %></td>
                <td><%= carType %></td>
                <td><%= status %></td>
            </tr>
            <% } %>
        </tbody>
    </table>

    <a href="addCar.jsp">Add New Car</a>

</body>
</html>
