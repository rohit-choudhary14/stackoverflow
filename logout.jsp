<%-- 
    Document   : logout
    Created on : 31 May, 2022, 4:02:17 AM
    Author     : rohit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email=null;
    Cookie c=new Cookie("user",email);
    c.setMaxAge(0);
    response.addCookie(c);
    response.sendRedirect("index.jsp");
    
    
    
    
    
    %>
