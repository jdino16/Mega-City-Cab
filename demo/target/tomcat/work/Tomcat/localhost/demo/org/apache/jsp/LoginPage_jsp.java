/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2025-02-22 16:58:27 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class LoginPage_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <title>Login - Mega City Cab</title>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <script src=\"https://cdn.tailwindcss.com\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css\">\r\n");
      out.write("\r\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"loginPage.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body class=\"flex flex-col items-center justify-center min-h-screen bg-gray-900 text-white\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <nav class=\"sidebar\">\r\n");
      out.write("        <div class=\"sidebar-top\">\r\n");
      out.write("            <h2 class=\"logo neon-text\">Mega City Cab</h2>\r\n");
      out.write("            <button class=\"expand-btn\"><i class=\"fas fa-bars\"></i></button>\r\n");
      out.write("        </div>\r\n");
      out.write("        <ul class=\"sidebar-links\">\r\n");
      out.write("            <li><a href=\"index.jsp\"><i class=\"fas fa-home\"></i> Home</a></li>\r\n");
      out.write("            <li><a href=\"fleet.jsp\"><i class=\"fas fa-car\"></i> Fleet</a></li>\r\n");
      out.write("            <li><a href=\"company.jsp\"><i class=\"fas fa-building\"></i> Company</a></li>\r\n");
      out.write("            <li><a href=\"our-cabs.jsp\" class=\"active\"><i class=\"fas fa-taxi\"></i> Our Cabs</a></li>\r\n");
      out.write("            <li><a href=\"blog.jsp\"><i class=\"fas fa-newspaper\"></i> Blog</a></li>\r\n");
      out.write("            <li><a href=\"contact.jsp\"><i class=\"fas fa-phone\"></i> Contact</a></li>\r\n");
      out.write("            <li><a href=\"profile.jsp\"><i class=\"fas fa-user\"></i> Profile</a></li>\r\n");
      out.write("            <li><a href=\"settings.jsp\"><i class=\"fas fa-cog\"></i> Settings</a></li>\r\n");
      out.write("        </ul>\r\n");
      out.write("    </nav>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"login-container\">\r\n");
      out.write("        <h2 class=\"text-3xl font-semibold neon-glow\">🔐 Welcome Back</h2>\r\n");
      out.write("        <p class=\"text-gray-300\">Sign in to continue your journey with Mega City Cab</p>\r\n");
      out.write("\r\n");
      out.write("       \r\n");
      out.write("        ");
 String error = request.getParameter("error"); 
      out.write("\r\n");
      out.write("        ");
 if (error != null) { 
      out.write("\r\n");
      out.write("            <p class=\"error-message\">⚠️ Invalid Email or Password</p>\r\n");
      out.write("        ");
 } 
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <form action=\"LoginServlet\" method=\"post\" id=\"loginForm\">\r\n");
      out.write("            <div class=\"form-group\">\r\n");
      out.write("                <label for=\"email\"><i class=\"fas fa-envelope\"></i> Email</label>\r\n");
      out.write("                <input type=\"email\" id=\"email\" name=\"email\" required placeholder=\"Enter your email\">\r\n");
      out.write("                <small id=\"emailError\"></small>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <div class=\"form-group\">\r\n");
      out.write("                <label for=\"password\"><i class=\"fas fa-lock\"></i> Password</label>\r\n");
      out.write("                <input type=\"password\" id=\"password\" name=\"password\" required placeholder=\"Enter your password\">\r\n");
      out.write("                <small id=\"passwordError\"></small>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("            <button type=\"submit\" class=\"login-btn\">🚀 Login</button>\r\n");
      out.write("        </form>\r\n");
      out.write("\r\n");
      out.write("      \r\n");
      out.write("        <p class=\"auth-link\">\r\n");
      out.write("            <a href=\"Signup.jsp\">Don't have an account? Sign up</a> | \r\n");
      out.write("            <a href=\"ForgotPassword.jsp\">Forgot Password?</a>\r\n");
      out.write("        </p>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <script src=\"loginPage.js\"></script>\r\n");
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
