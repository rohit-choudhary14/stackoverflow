<%-- 
    Document   : login
    Created on : 23 May, 2022, 10:47:42 PM
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
               ResultSet rs=st.executeQuery("select * from user where email='"+email+"'");
               if(rs.next()){
                          if(rs.getString("password").equals(password)){
                               Cookie c=new Cookie("user",email);
                               c.setMaxAge(36000);
                               response.addCookie(c);
                               response.sendRedirect("dashboard.jsp");
                          }
                          else{
                               response.sendRedirect("index.jsp?password_does't_match");
                          }
                   
               }
               else{
                   
                    response.sendRedirect("index.jsp?user_does't_exist");
               }
          }
          catch(Exception e){
              
          }
        
        
    }
    
    
    
    %>
