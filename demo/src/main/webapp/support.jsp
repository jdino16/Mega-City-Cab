<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="com.megacitycab.utils.DatabaseUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Support - Mega City Cab</title>
    <link rel="stylesheet" href="styles/support.css">
    <script src="js/support.js" defer></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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


<div class="support-container">
    <h2>📞 Customer Support</h2>
    <p>Need help? Fill out the form below, and our team will assist you shortly.</p>

    <form action="SupportServlet" method="post">
        <label for="subject"><i class="fas fa-comment-alt"></i> Subject</label>
        <input type="text" id="subject" name="subject" required placeholder="Enter subject">

        <label for="message"><i class="fas fa-edit"></i> Message</label>
        <textarea id="message" name="message" required placeholder="Describe your issue"></textarea>

        <input type="hidden" name="userId" value="<%= userId %>">

        <button type="submit"><i class="fas fa-paper-plane"></i> Submit Inquiry</button>
    </form>
</div>


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
                <th>Phone</th>
                <th>Email</th>
                <th>Role</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    conn = DatabaseUtil.getConnection();
                    String sql = "SELECT s.inquiry_id, s.subject, s.message, s.status, s.response, u.phone, u.email, u.role " +
                                 "FROM support s " +
                                 "JOIN users u ON s.user_id = u.id " +
                                 "WHERE s.user_id=?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setInt(1, userId);
                    rs = stmt.executeQuery();

                    while (rs.next()) { %>
                        <tr>
                            <td><%= rs.getInt("inquiry_id") %></td>
                            <td><%= rs.getString("subject") %></td>
                            <td><%= rs.getString("message") %></td>
                            <td><%= rs.getString("status") %></td>
                            <td><%= rs.getString("response") != null ? rs.getString("response") : "Pending" %></td>
                            <td><%= rs.getString("phone") %></td>
                            <td><%= rs.getString("email") %></td>
                            <td><%= rs.getString("role") %></td>
                        </tr>
            <%      }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (Exception ignored) {}
                    if (stmt != null) try { stmt.close(); } catch (Exception ignored) {}
                    if (conn != null) try { conn.close(); } catch (Exception ignored) {}
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>
