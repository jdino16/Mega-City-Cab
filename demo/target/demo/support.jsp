<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Support - Mega City Cab</title>
    <link rel="stylesheet" href="support.css">
    <script src="support.js" defer></script>
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
%>

    <!-- ✅ Support Form Section -->
    <div class="support-container">
        <h2>📞 Customer Support</h2>
        <p>Need help? Fill out the form below, and our team will assist you shortly.</p>

        <form action="SupportServlet" method="post">
            <label for="subject">🔹 Subject</label>
            <input type="text" id="subject" name="subject" required placeholder="Enter subject">

            <label for="message">📝 Message</label>
            <textarea id="message" name="message" required placeholder="Describe your issue"></textarea>

            <input type="hidden" name="userId" value="<%= userId %>">

            <button type="submit">📩 Submit Inquiry</button>
        </form>
    </div>

    <!-- ✅ Support History Section -->
    <div class="support-history">
        <h2>📜 Past Support Requests</h2>
        <table>
            <thead>
                <tr>
                    <th>Inquiry ID</th>
                    <th>Subject</th>
                    <th>Message</th>
                    <th>Status</th>
                    <th>Response</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Connection conn = DatabaseUtil.getConnection();
                    String sql = "SELECT inquiry_id, subject, message, status, response FROM support WHERE user_id=?";
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, userId);
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) { %>
                        <tr>
                            <td><%= rs.getInt("inquiry_id") %></td>
                            <td><%= rs.getString("subject") %></td>
                            <td><%= rs.getString("message") %></td>
                            <td><%= rs.getString("status") %></td>
                            <td><%= rs.getString("response") != null ? rs.getString("response") : "Pending" %></td>
                        </tr>
                <% } conn.close(); %>
            </tbody>
        </table>
    </div>

</body>
</html>
