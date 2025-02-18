<%@ page import="java.util.List" %>
<%@ page import="com.megacitycab.models.Driver" %>

<html>
<head>
    <title>View All Drivers</title>
</head>
<body>
    <h1>View All Drivers</h1>

    <!-- Display message if any -->
    <p style="color: green;">
        <%= request.getParameter("message") != null ? request.getParameter("message") : "" %>
    </p>

    <table border="1">
        <tr>
            <th>Driver ID</th>
            <th>Driver Name</th>
            <th>Phone</th>
            <th>Car Model</th>
            <th>Status</th>
        </tr>

        <%
            // Retrieve the list of drivers set by the servlet
            List<Driver> drivers = (List<Driver>) request.getAttribute("drivers");

            if (drivers != null && !drivers.isEmpty()) {
                // Loop through the list and display each driver's data
                for (Driver driver : drivers) {
        %>
                    <tr>
                        <td><%= driver.getDriverId() %></td>
                        <td><%= driver.getDriverName() %></td>
                        <td><%= driver.getPhone() %></td>
                        <td><%= driver.getCarModel() %></td>
                        <td><%= driver.getStatus() %></td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr>
                    <td colspan="5">No drivers available.</td>
                </tr>
        <%
            }
        %>
    </table>

    <!-- Link to go back to the admin dashboard -->
    <a href="adminDashboard.jsp">Back to Admin Dashboard</a>
</body>
</html>
