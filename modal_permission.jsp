<%-- 
    Document   : modal_permission
    Created on : 28 May, 2022, 9:47:50 PM
    Author     : rohit
--%>

<%@page contentType="text/html"  import="java.sql.*"pageEncoding="UTF-8"%>
<%
   String email=null;
   int permission;
   Cookie c[]=request.getCookies();
   for(int i=0;i<c.length;i++){
       if(c[i].getName().equals("user")){
           email=c[i].getValue();
       }
   }
   if(email!=null){
           if(request.getParameter("permission").length()==0){
               
           }
           else{
                permission=Integer.parseInt(request.getParameter("permission"));
                try{
                      Class.forName("com.mysql.jdbc.Driver");
                      Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow","root","");
                      Statement st=cn.createStatement();
                      if(st.executeUpdate("insert into modal_permission values('"+email+"',0)")>0){
                          out.print("success");
                      }
                      else{
                          
                      }
                }
                catch(Exception e){
                    
                }
           }
   }
   else{
       
   }
    
    
    
    %>