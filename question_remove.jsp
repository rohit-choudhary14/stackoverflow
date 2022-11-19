<%-- 
    Document   : question_remove
    Created on : 26 Jun, 2022, 1:50:57 AM
    Author     : rohit
--%>

<%@page contentType="text/html"  import="java.sql.*"pageEncoding="UTF-8"%>
<%
    String question_id="";
    String admin_email=null;
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("stackoverflow_admin")){
            admin_email=c[i].getValue();
            
        }
    }
    if(admin_email!=null){
                       if(request.getParameter("question_id").length()==0){
                           
                       }
                       else{
                            question_id=request.getParameter("question_id");
                           try{ 
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow","root","");
                                Statement st=cn.createStatement();
                                if(st.executeUpdate("delete from question where question_id='"+question_id+"'")>0){
                                    out.print("success");
                                }
                               
                           }
                           catch(Exception e){
                               
                           }
                       }
        
    }
    else{
        
    }
    
    
    
    
    %>