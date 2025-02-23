/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2025-02-22 17:00:56 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;
import com.megacitycab.utils.DatabaseUtil;

public final class driverDashboard_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>Customer Dashboard - Mega City Cab</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"customerDashboard.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css\">\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/gsap@3.10.1/dist/gsap.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("    <nav class=\"navbar\">\r\n");
      out.write("        <div class=\"navbar\">\r\n");
      out.write("            <a href=\"index.jsp\" class=\"nav-link\"><i class=\"fas fa-home\"></i> Home</a>\r\n");
      out.write("            <a href=\"our-cabs.jsp\" class=\"nav-link\"><i class=\"fas fa-taxi\"></i> Our Cabs</a>\r\n");
      out.write("            <a href=\"company.jsp\" class=\"nav-link\"><i class=\"fas fa-building\"></i> Company</a>\r\n");
      out.write("            <a href=\"booking.jsp\" class=\"nav-link\"><i class=\"fas fa-taxi\"></i> Booking</a>\r\n");
      out.write("            <a href=\"profile1.jsp\" class=\"nav-link\"><i class=\"fas fa-user\"></i> Manage Profile</a>\r\n");
      out.write("            <a href=\"help.jsp\" class=\"nav-link\"><i class=\"fas fa-question-circle\"></i> Help</a> \r\n");
      out.write("            <a href=\"logout.jsp\" class=\"nav-link\"><i class=\"fas fa-sign-out-alt\"></i> Logout</a>    \r\n");
      out.write("        </div>\r\n");
      out.write("    </nav>\r\n");
      out.write("    \r\n");
      out.write("\r\n");

    // Ensure user is logged in
    Object userIdObj = session.getAttribute("userId");
    if (userIdObj == null) {
        response.sendRedirect("LoginPage.jsp");
        return;
    }
    int userId = (Integer) userIdObj;

    Connection conn = DatabaseUtil.getConnection();
    
    int upcomingBookings = 0;
    int completedRides = 0;
    double totalSpent = 0.0;

    // Count Upcoming Bookings
    String sqlUpcoming = "SELECT COUNT(*) FROM bookings WHERE user_id = ? AND status IN ('Pending', 'Confirmed')";
    PreparedStatement stmtUpcoming = conn.prepareStatement(sqlUpcoming);
    stmtUpcoming.setInt(1, userId);
    ResultSet rsUpcoming = stmtUpcoming.executeQuery();
    if (rsUpcoming.next()) {
        upcomingBookings = rsUpcoming.getInt(1);
    }

    // Count Completed Rides
    String sqlCompleted = "SELECT COUNT(*) FROM bookings WHERE user_id = ? AND status = 'Completed'";
    PreparedStatement stmtCompleted = conn.prepareStatement(sqlCompleted);
    stmtCompleted.setInt(1, userId);
    ResultSet rsCompleted = stmtCompleted.executeQuery();
    if (rsCompleted.next()) {
        completedRides = rsCompleted.getInt(1);
    }

    // Calculate Total Spent in Rs
    String sqlTotalSpent = "SELECT SUM(amount) FROM payments WHERE user_id = ?";
    PreparedStatement stmtTotalSpent = conn.prepareStatement(sqlTotalSpent);
    stmtTotalSpent.setInt(1, userId);
    ResultSet rsTotalSpent = stmtTotalSpent.executeQuery();
    if (rsTotalSpent.next()) {
        totalSpent = rsTotalSpent.getDouble(1);
    }

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"dashboard-summary\">\r\n");
      out.write("    <h2>🚖 Welcome, ");
      out.print( session.getAttribute("username") );
      out.write("!</h2>\r\n");
      out.write("    <p>Here's a quick overview of your recent activity.</p>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"dashboard-cards\">\r\n");
      out.write("   \r\n");
      out.write("        <div class=\"dashboard-card yellow\">\r\n");
      out.write("            <i class=\"fas fa-calendar-alt\"></i>\r\n");
      out.write("            <h3>🚖 Upcoming Bookings</h3>\r\n");
      out.write("            <p>");
      out.print( upcomingBookings );
      out.write("</p>\r\n");
      out.write("        </div>\r\n");
      out.write("        <div class=\"dashboard-card blue\">\r\n");
      out.write("            <i class=\"fas fa-check-circle\"></i>\r\n");
      out.write("            <h3>📜 Completed Rides</h3>\r\n");
      out.write("            <p>");
      out.print( completedRides );
      out.write("</p>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"dashboard-card green\">\r\n");
      out.write("            <i class=\"fas fa-wallet\"></i>\r\n");
      out.write("            <h3>💰 Total Spent</h3>\r\n");
      out.write("            <p>Rs ");
      out.print( String.format("%.2f", totalSpent) );
      out.write("</p>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"recent-bookings\">\r\n");
      out.write("    <h2>Your Recent Bookings</h2>\r\n");
      out.write("    <table>\r\n");
      out.write("        <thead>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <th>Booking ID</th>\r\n");
      out.write("                <th>Pickup</th>\r\n");
      out.write("                <th>Destination</th>\r\n");
      out.write("                <th>Date</th>\r\n");
      out.write("                <th>Status</th>\r\n");
      out.write("            </tr>\r\n");
      out.write("        </thead>\r\n");
      out.write("        <tbody>\r\n");
      out.write("            ");

                // Fetch latest 5 bookings
                String sqlRecent = "SELECT booking_id, pickup, destination, date, status FROM bookings WHERE user_id = ? ORDER BY date DESC LIMIT 5";
                PreparedStatement stmtRecent = conn.prepareStatement(sqlRecent);
                stmtRecent.setInt(1, userId);
                ResultSet rsRecent = stmtRecent.executeQuery();
                
                while (rsRecent.next()) { 
      out.write("\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>");
      out.print( rsRecent.getInt("booking_id") );
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print( rsRecent.getString("pickup") );
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print( rsRecent.getString("destination") );
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print( rsRecent.getString("date") );
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print( rsRecent.getString("status") );
      out.write("</td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("            ");
 } 
      out.write("\r\n");
      out.write("        </tbody>\r\n");
      out.write("    </table>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"quick-actions\">\r\n");
      out.write("    <a href=\"booking.jsp\" class=\"action-btn\"><i class=\"fas fa-calendar-check\"></i> View Bookings</a>\r\n");
      out.write("    <a href=\"billing.jsp\" class=\"action-btn\"><i class=\"fas fa-credit-card\"></i> Billing & Transactions</a>\r\n");
      out.write("    <a href=\"profile1.jsp\" class=\"action-btn\"><i class=\"fas fa-user-edit\"></i> Edit Profile</a>\r\n");
      out.write("    <a href=\"support.jsp\" class=\"action-btn\"><i class=\"fas fa-question-circle\"></i> Get Support</a>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");

    // Close database connection
    conn.close();

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script src=\"customerDashboard.js\"></script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
