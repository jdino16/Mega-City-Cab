<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New User</title>
    <link rel="stylesheet" href="styles.css">
    <script src="addUser.js"></script>
</head>
<body>

    <h1>Add New User</h1>

    <!-- Form to add a user -->
    <form id="addUserForm" action="AddUserServlet" method="POST" onsubmit="return validateForm()">
        <div>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
        <div>
            <button type="submit">Add User</button>
        </div>
    </form>

    <script>
        // JavaScript validation function
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            // Check if passwords match
            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;  // Prevent form submission
            }
            return true;
        }
    </script>

    <a href="adminDashboard.jsp">Back to Admin Dashboard</a>

</body>
</html>
