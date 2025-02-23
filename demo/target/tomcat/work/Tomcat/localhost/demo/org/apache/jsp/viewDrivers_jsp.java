/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2025-02-23 08:09:01 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import com.megacitycab.utils.DatabaseUtil;

public final class viewDrivers_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>View All Drivers - Mega City Cab</title>\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"styles/viewdrivers.css\">\r\n");
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
      out.write(" \r\n");
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
      out.write("            <h1>View All Drivers</h1>\r\n");
      out.write("        </header>\r\n");
      out.write("\r\n");
      out.write("        <section class=\"driver-list\">\r\n");
      out.write("            <table class=\"driver-table\">\r\n");
      out.write("                <thead>\r\n");
      out.write("                    <tr>\r\n");
      out.write("                        <th>Driver ID</th>\r\n");
      out.write("                        <th>Driver Name</th>\r\n");
      out.write("                        <th>Phone</th>\r\n");
      out.write("                        <th>Car Model</th>\r\n");
      out.write("                        <th>Status</th>\r\n");
      out.write("                        <th>Actions</th>\r\n");
      out.write("                    </tr>\r\n");
      out.write("                </thead>\r\n");
      out.write("                <tbody>\r\n");
      out.write("                    ");

                        // Get the driver details from the database
                        Connection conn = DatabaseUtil.getConnection();
                        String sql = "SELECT driver_id, driver_name, phone, car_model, status FROM drivers ORDER BY driver_name";
                        PreparedStatement stmt = conn.prepareStatement(sql);
                        ResultSet rs = stmt.executeQuery();

                        // Loop through the result set and display each driver's details
                        while (rs.next()) {
                            int driverId = rs.getInt("driver_id");
                            String driverName = rs.getString("driver_name");
                            String phone = rs.getString("phone");
                            String carModel = rs.getString("car_model");
                            String status = rs.getString("status");
                    
      out.write("\r\n");
      out.write("                        <tr>\r\n");
      out.write("                            <td>");
      out.print( driverId );
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print( driverName );
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print( phone );
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print( carModel );
      out.write("</td>\r\n");
      out.write("                            <td>");
      out.print( status );
      out.write("</td>\r\n");
      out.write("                            <td>\r\n");
      out.write("                                <a href=\"editDriver.jsp?driverId=");
      out.print( driverId );
      out.write("\" class=\"action-link\">\r\n");
      out.write("                                    <i class=\"fas fa-edit\"></i> Edit\r\n");
      out.write("                                </a> |\r\n");
      out.write("                                <a href=\"deleteDriverServlet?driverId=");
      out.print( driverId );
      out.write("\" class=\"action-link\" onclick=\"return confirm('Are you sure you want to delete this driver?')\">\r\n");
      out.write("                                    <i class=\"fas fa-trash-alt\"></i> Delete\r\n");
      out.write("                                </a>\r\n");
      out.write("                            </td>\r\n");
      out.write("                        </tr>\r\n");
      out.write("                    ");

                        }
                        // Close the connection
                        conn.close();
                    
      out.write("\r\n");
      out.write("                </tbody>\r\n");
      out.write("            </table>\r\n");
      out.write("        </section>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"js/viewdrivers\"></script>\r\n");
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
