/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2025-02-23 08:08:48 UTC
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

public final class addPayment_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Add Payment</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"styles/addpaymnet.css\">\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <div class=\"sidebar-left\">\r\n");
      out.write("        <div class=\"sidebar-links\">\r\n");
      out.write("            <a href=\"index.jsp\" class=\"nav-link\"><i class=\"fas fa-home\"></i> Home</a>\r\n");
      out.write("            <a href=\"company.jsp\" class=\"nav-link\"><i class=\"fas fa-building\"></i> Company</a>\r\n");
      out.write("            <a href=\"customerDashboard.jsp\" class=\"nav-link\"><i class=\"fas fa-tachometer-alt\"></i> Customer Dashboard</a>\r\n");
      out.write("            <a href=\"support.jsp\" class=\"nav-link\"><i class=\"fas fa-question-circle\"></i> Help</a>\r\n");
      out.write("            <a href=\"logout.jsp\" class=\"nav-link\"><i class=\"fas fa-sign-out-alt\"></i> Logout</a>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"sidebar-right\">\r\n");
      out.write("        <div class=\"action-buttons\">\r\n");
      out.write("            <a href=\"viewBookings.jsp\" class=\"action-btn\">📅 View Bookings</a>\r\n");
      out.write("            <a href=\"viewCars.jsp\" class=\"action-btn\">🚗 View Cars</a>\r\n");
      out.write("            <a href=\"viewDrivers.jsp\" class=\"action-btn\">👨‍🔧 View Drivers</a>\r\n");
      out.write("            <a href=\"viewUsers.jsp\" class=\"action-btn\">👤 View Users</a>\r\n");
      out.write("            <a href=\"viewPayments.jsp\" class=\"action-btn\">💳 View Payments</a>\r\n");
      out.write("            <a href=\"addBooking.jsp\" class=\"action-btn\">📅 Add Booking</a>\r\n");
      out.write("            <a href=\"addCar.jsp\" class=\"action-btn\">🚗 Add Car</a>\r\n");
      out.write("            <a href=\"addDriver.jsp\" class=\"action-btn\">👨‍🔧 Add Driver</a>\r\n");
      out.write("            <a href=\"addUser.jsp\" class=\"action-btn\">👤 Add User</a>\r\n");
      out.write("            <a href=\"addPayment.jsp\" class=\"action-btn\">💳 Add Payment</a>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"content\">\r\n");
      out.write("        <header>\r\n");
      out.write("            <h1><i class=\"fas fa-credit-card\"></i> Add a New Payment</h1>\r\n");
      out.write("        </header>\r\n");
      out.write("\r\n");
      out.write("        <section class=\"add-payment-form\">\r\n");
      out.write("            <form action=\"AddPaymentServlet\" method=\"post\" id=\"paymentForm\">\r\n");
      out.write("                <label for=\"user_id\">User ID <i class=\"fas fa-user\"></i>:</label>\r\n");
      out.write("                <input type=\"number\" id=\"user_id\" name=\"user_id\" required><br><br>\r\n");
      out.write("\r\n");
      out.write("                <label for=\"booking_id\">Booking ID <i class=\"fas fa-calendar-check\"></i>:</label>\r\n");
      out.write("                <input type=\"number\" id=\"booking_id\" name=\"booking_id\" required><br><br>\r\n");
      out.write("\r\n");
      out.write("                <label for=\"amount\">Amount <i class=\"fas fa-dollar-sign\"></i>:</label>\r\n");
      out.write("                <input type=\"number\" step=\"0.01\" id=\"amount\" name=\"amount\" required><br><br>\r\n");
      out.write("\r\n");
      out.write("                <label for=\"payment_method\">Payment Method <i class=\"fas fa-credit-card\"></i>:</label>\r\n");
      out.write("                <input type=\"text\" id=\"payment_method\" name=\"payment_method\" required><br><br>\r\n");
      out.write("\r\n");
      out.write("                <label for=\"status\">Status <i class=\"fas fa-info-circle\"></i>:</label>\r\n");
      out.write("                <select id=\"status\" name=\"status\">\r\n");
      out.write("                    <option value=\"Unpaid\">Unpaid</option>\r\n");
      out.write("                    <option value=\"Paid\">Paid</option>\r\n");
      out.write("                </select><br><br>\r\n");
      out.write("\r\n");
      out.write("                <input type=\"submit\" value=\"Add Payment\" class=\"submit-btn\">\r\n");
      out.write("            </form>\r\n");
      out.write("        </section>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"js/addpaymnet.js\"></script>\r\n");
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
