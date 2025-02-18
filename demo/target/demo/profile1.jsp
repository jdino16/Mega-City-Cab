<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - Mega City Cab</title>
    <link rel="stylesheet" href="profile.css">
    <script src="profile.js" defer></script>
</head>
<body>

<%
    // Ensure user is logged in
    Object userIdObj = session.getAttribute("userId");
    if (userIdObj == null) {
        response.sendRedirect("LoginPage.jsp");
        return;
    }
    int userId = (Integer) userIdObj;

    // Fetch user details
    Connection conn = DatabaseUtil.getConnection();
    String sql = "SELECT name, email, nic, phone, address FROM users WHERE id=?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setInt(1, userId);
    ResultSet rs = stmt.executeQuery();

    String name = "", email = "", nic = "", phone = "", address = "";
    if (rs.next()) {
        name = rs.getString("name");
        email = rs.getString("email");
        nic = rs.getString("nic");
        phone = rs.getString("phone");
        address = rs.getString("address");
    }
    conn.close();
%>

    <!-- ✅ Profile Section -->
    <div class="profile-container">
        <h2>👤 My Profile</h2>

        <form action="UpdateProfileServlet" method="post">
            <label for="name">Full Name</label>
            <input type="text" id="name" name="name" value="<%= name %>" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<%= email %>" required readonly>

            <label for="nic">NIC</label>
            <input type="text" id="nic" name="nic" value="<%= nic %>" required readonly>

            <label for="phone">Phone</label>
            <input type="text" id="phone" name="phone" value="<%= phone %>" required>

            <label for="address">Address</label>
            <input type="text" id="address" name="address" value="<%= address %>" required>

            <button type="submit">💾 Save Changes</button>
        </form>

        <h3>🔒 Change Password</h3>
        <form action="ChangePasswordServlet" method="post">
            <label for="currentPassword">Current Password</label>
            <input type="password" id="currentPassword" name="currentPassword" required>

            <label for="newPassword">New Password</label>
            <input type="password" id="newPassword" name="newPassword" required>

            <label for="confirmPassword">Confirm New Password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>

            <button type="submit">🔄 Update Password</button>
        </form>
    </div>

</body>
</html>
