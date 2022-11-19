package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Stackoverflow</title>\n");
      out.write("\n");
      out.write("        <link href=\"logo/download.png\" rel=\"icon\">\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js\"></script>\n");
      out.write("        <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css\" integrity=\"sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==\" crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n");
      out.write("\n");
      out.write("        <script src=\"jquery-3.6.0.min.js\"></script>\n");
      out.write("\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-expand-sm bg-light navbar-dark sticky-top\" id=\"card\">\n");
      out.write("            <a class=\"navbar-brand\" href=\"#\"><img src=\"logo/0_stack_overflow_logo.jpg\"style=\"height:30px;margin-top:-20px\"/></a>\n");
      out.write("            <ul class=\"navbar-nav\">\n");
      out.write("                &nbsp;<li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\"  id=\"link-1\" href=\"#\">About</a>\n");
      out.write("\n");
      out.write("                </li>\n");
      out.write("                &nbsp;<li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" id=\"link-2\" href=\"#\">Product</a>\n");
      out.write("\n");
      out.write("                </li>\n");
      out.write("                &nbsp; <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" id=\"link-3\" href=\"#\">For&nbsp;Teams</a>\n");
      out.write("\n");
      out.write("                </li>\n");
      out.write("            </ul>&nbsp; \n");
      out.write("            <div class=\"input-group mb-0\">\n");
      out.write("\n");
      out.write("                <input type=\"text\" class=\"form-control\" placeholder=\"search...\" aria-label=\"search\" aria-describedby=\"basic-addon1\">\n");
      out.write("                <div class=\"input-group-prepend\">\n");
      out.write("                    <span class=\"input-group-text\" id=\"basic-addon1\"><i class=\"fa fa-search\"></i></span>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <ul class=\"navbar-nav\">\n");
      out.write("                &nbsp;<li class=\"nav-item\">\n");
      out.write("                    <!--<a class=\"nav-link\" style=\"color:black\" href=\"#\">Login</a>-->\n");
      out.write("                    <input type=\"button\" class=\"btn btn-primary\" value=\"Login\"/>\n");
      out.write("                </li>\n");
      out.write("                &nbsp; <li class=\"nav-item\">\n");
      out.write("                    <input type=\"button\" class=\"btn btn-primary\" id=\"sign-up\" value=\"Sign Up\"/>\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("        </nav>\n");
      out.write("        \n");
      out.write("           <div class=\"container-fluid\" id=\"main\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-sm-3\" id=\"col-3-sidebar\">\n");
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-sm-6\"  id=\"all-question\">\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-sm-9\">\n");
      out.write("                                <h3>All Questions</h3>\n");
      out.write("                            </div>  \n");
      out.write("                            <div class=\"col-sm-3\">\n");
      out.write("                                <button class=\"btn btn-primary\">Ask&nbsp;Question</button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-sm-2\" id=\"card\" >\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-sm-12\" id=\"blog-row-12\">\n");
      out.write("                                <span>The Overflow Blog</span>\n");
      out.write("                            </div>  \n");
      out.write("                             <div class=\"col-sm-12\" id=\"blog-row-12-1\">\n");
      out.write("                                <a href=\"#\">Crystal balls and clairvoyance: Future proofing in a world of inevitable change</a>\n");
      out.write("                            </div> \n");
      out.write("                             <div class=\"col-sm-12\" id=\"blog-row-12-2\">\n");
      out.write("                                \n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-sm-12\" id=\"blog-row-12-3\">\n");
      out.write("                                <a href=\"#\">Make your open-source project public before you’re ready</a>\n");
      out.write("                            </div>\n");
      out.write("                             <div class=\"col-sm-12\" id=\"blog-row-12\">\n");
      out.write("                                <span>Featured on Meta</span>\n");
      out.write("                            </div> \n");
      out.write("                             <div class=\"col-sm-2\" id=\"blog-row-12-1\">\n");
      out.write("                                 <img src=\"logo/download.png\" height=\"20px\"/>\n");
      out.write("                                \n");
      out.write("                            </div> \n");
      out.write("                            <div class=\"col-sm-10\" id=\"blog-row-12-1\">\n");
      out.write("                                <a href=\"#\">Announcing the arrival of Valued Associate #1214: Dalmarus</a>\n");
      out.write("                            </div>\n");
      out.write("                             <div class=\"col-sm-12\" id=\"blog-row-12-2\">\n");
      out.write("                                \n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-sm-12\" id=\"blog-row-12-3\">\n");
      out.write("                                <a href=\"#\">Staging Ground: Reviewer Motivation, Scaling, and Open Questions</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-sm-1\">\n");
      out.write("                        \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("       \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
