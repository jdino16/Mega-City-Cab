/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2025-02-23 08:07:43 UTC
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

public final class billing_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Billing - Mega City Cab</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"billing.css\">\r\n");
      out.write("    <link href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css\" rel=\"stylesheet\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");

    // Ensure user is logged in
    Object userIdObj = session.getAttribute("userId");
    if (userIdObj == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    int userId = (Integer) userIdObj;

    // Check if a success message exists
    String message = request.getParameter("message");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
 if (message != null) { 
      out.write("\r\n");
      out.write("    <div class=\"alert success\">🎉 ");
      out.print( message );
      out.write("</div>\r\n");
 } 
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div class=\"billing-container\">\r\n");
      out.write("    <h2>💰 Billing & Transactions</h2>\r\n");
      out.write("\r\n");
      out.write("    <table>\r\n");
      out.write("        <thead>\r\n");
      out.write("            <tr>\r\n");
      out.write("                <th>Transaction ID</th>\r\n");
      out.write("                <th>Booking ID</th>\r\n");
      out.write("                <th>Amount (Rs)</th> \r\n");
      out.write("                <th>Payment Method</th>\r\n");
      out.write("                <th>Status</th>\r\n");
      out.write("            </tr>\r\n");
      out.write("        </thead>\r\n");
      out.write("        <tbody>\r\n");
      out.write("            ");
 
                Connection conn = DatabaseUtil.getConnection();
                String sql = "SELECT transaction_id, booking_id, amount, payment_method, status FROM payments WHERE user_id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, userId);
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) { 
      out.write("\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <td>");
      out.print( rs.getInt("transaction_id") );
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print( rs.getInt("booking_id") );
      out.write("</td>\r\n");
      out.write("                        <td>Rs ");
      out.print( String.format("%.2f", rs.getDouble("amount")) );
      out.write("</td> \r\n");
      out.write("                        <td>");
      out.print( rs.getString("payment_method") );
      out.write("</td>\r\n");
      out.write("                        <td>");
      out.print( rs.getString("status") );
      out.write("</td>\r\n");
      out.write("                    </tr>\r\n");
      out.write("            ");
 } conn.close(); 
      out.write("\r\n");
      out.write("        </tbody>\r\n");
      out.write("    </table>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"quick-actions\">\r\n");
      out.write("    <a href=\"booking.jsp\" class=\"action-btn\"><i class=\"fas fa-calendar-check\"></i> View Bookings</a>\r\n");
      out.write("    <a href=\"billing.jsp\" class=\"action-btn\"><i class=\"fas fa-credit-card\"></i> Billing & Transactions</a>\r\n");
      out.write("    <a href=\"profile1.jsp\" class=\"action-btn\"><i class=\"fas fa-user-edit\"></i> Edit Profile</a>\r\n");
      out.write("    <a href=\"support.jsp\" class=\"action-btn\"><i class=\"fas fa-question-circle\"></i> Get Support</a>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<nav class=\"navbar\">\r\n");
      out.write("    <div class=\"navbar\">\r\n");
      out.write("        <a href=\"index.jsp\" class=\"nav-link\"><i class=\"fas fa-home\"></i> Home</a>\r\n");
      out.write("        <a href=\"our-cabs.jsp\" class=\"nav-link\"><i class=\"fas fa-taxi\"></i> Our Cabs</a>\r\n");
      out.write("        <a href=\"company.jsp\" class=\"nav-link\"><i class=\"fas fa-building\"></i> Company</a>\r\n");
      out.write("        <a href=\"booking.jsp\" class=\"nav-link\"><i class=\"fas fa-taxi\"></i> Booking</a>\r\n");
      out.write("        <a href=\"help.jsp\" class=\"nav-link\"><i class=\"fas fa-question-circle\"></i> Help</a> \r\n");
      out.write("        <a href=\"profile1.jsp\" class=\"nav-link\"><i class=\"fas fa-user-edit\"></i> Manage Profile</a>\r\n");
      out.write("        <a href=\"logout.jsp\" class=\"nav-link\"><i class=\"fas fa-sign-out-alt\"></i> Logout</a>    \r\n");
      out.write("    </div>\r\n");
      out.write("</nav>\r\n");
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
