<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Users - Mega City Cab</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<h1>Manage Users</h1>
<a href="addUser.jsp">Add New User</a>

<table border="1">
    <thead>
        <tr>
            <th>User ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.email}</td>
                <td>${user.phone}</td>
                <td>${user.role}</td>
                <td>
                    <a href="editUser.jsp?id=${user.id}">Edit</a>
                    <a href="deleteUserServlet?id=${user.id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
