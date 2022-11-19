<%-- 
    Document   : admin_login
    Created on : 25 Jun, 2022, 11:54:59 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    
   String email="";
   String password="";
   if(request.getParameter("email").length()==0|| request.getParameter("password").length()==0){
       
   }
   else{
       email=request.getParameter("email");
       password=request.getParameter("password");
       try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow","root","");
            Statement st=cn.createStatement();
            ResultSet rs=st.executeQuery("select * from admin where email='"+email+"'");
            if(rs.next()){
                     if(rs.getString("password").equals(password)){
                         Cookie c=new Cookie("stackoverflow_admin",email);
                         c.setMaxAge(36000);
                         response.addCookie(c);
                         response.sendRedirect("admin_dashboard.jsp");
                     }
                     else{
                          response.sendRedirect("index.jsp?password=invalid");
                     }
            }
            else{
                response.sendRedirect("index.jsp?email=invalid");
            }
            
            
       }
       catch(Exception e){
           
       }
   }
    
    
    %>
