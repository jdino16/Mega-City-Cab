/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2025-02-23 08:06:30 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class contact_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>Contact Us - Mega City Cab</title>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"https://cdn.tailwindcss.com\"></script>\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css\">\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"contact.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"bg-black text-white\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <nav class=\"sidebar\">\r\n");
      out.write("        <div class=\"sidebar-top\">\r\n");
      out.write("            <h2 class=\"logo neon-text\">Mega City Cab</h2>\r\n");
      out.write("            <button class=\"expand-btn\"><i class=\"fas fa-bars\"></i></button>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"search-wrapper\">\r\n");
      out.write("            <input type=\"text\" id=\"searchInput\" placeholder=\"Search...\">\r\n");
      out.write("            <i class=\"fas fa-search\"></i>\r\n");
      out.write("        </div>\r\n");
      out.write("        <ul class=\"sidebar-links\">\r\n");
      out.write("            <li><a href=\"index.jsp\"><i class=\"fas fa-home\"></i> Home</a></li>\r\n");
      out.write("            <li><a href=\"fleet.jsp\"><i class=\"fas fa-car\"></i> Fleet</a></li>\r\n");
      out.write("            <li><a href=\"company.jsp\"><i class=\"fas fa-building\"></i> Company Details</a></li>\r\n");
      out.write("            <li><a href=\"our-cabs.jsp\"><i class=\"fas fa-taxi\"></i> Our Cabs</a></li>\r\n");
      out.write("            <li><a href=\"blog.jsp\"><i class=\"fas fa-newspaper\"></i> Blog</a></li>\r\n");
      out.write("            <li><a href=\"contact.jsp\" class=\"active\"><i class=\"fas fa-phone\"></i> Contact Us</a></li>\r\n");
      out.write("            <li><a href=\"profile.jsp\"><i class=\"fas fa-user\"></i> Profile</a></li>\r\n");
      out.write("            <li><a href=\"settings.jsp\"><i class=\"fas fa-cog\"></i> Settings</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("    </nav>\r\n");
      out.write("\r\n");
      out.write("    <main class=\"content\">\r\n");
      out.write("        <section class=\"contact-hero\">\r\n");
      out.write("            <h1 class=\"contact-title\">📞 Contact Mega City Cab</h1>\r\n");
      out.write("            <p class=\"contact-description\">Reach out to us for support, bookings, or inquiries. We are here 24/7!</p>\r\n");
      out.write("        </section>\r\n");
      out.write("\r\n");
      out.write("    \r\n");
      out.write("        <section class=\"contact-details\">\r\n");
      out.write("            <div class=\"contact-box\">\r\n");
      out.write("                <h2><i class=\"fas fa-phone\"></i> Phone Support</h2>\r\n");
      out.write("                <p><a href=\"tel:+9477483137\">Call: +94 774 831 37</a></p>\r\n");
      out.write("                <p><a href=\"tel:+94112345678\">Office: +94 112 345 678</a></p>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"contact-box\">\r\n");
      out.write("                <h2><i class=\"fas fa-envelope\"></i> Email</h2>\r\n");
      out.write("                <p><a href=\"megacitycab@gmail.com\">support@megacitycab.com</a></p>\r\n");
      out.write("                <p><a href=\"Dinomegacitycab@gmail.com\">info@megacitycab.com</a></p>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"contact-box\">\r\n");
      out.write("                <h2><i class=\"fas fa-map-marker-alt\"></i> Office Address</h2>\r\n");
      out.write("                <p>123 Mega City Tower, Colombo, Sri Lanka</p>\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"contact-box\">\r\n");
      out.write("                <h2><i class=\"fas fa-clock\"></i> Business Hours</h2>\r\n");
      out.write("                <p>Monday - Sunday: 24/7 Service</p>\r\n");
      out.write("            </div>\r\n");
      out.write("        </section>\r\n");
      out.write("    </main>\r\n");
      out.write("\r\n");
      out.write("    <script src=\"contact.js\"></script>\r\n");
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
