<%-- 
    Document   : update_comment
    Created on : 12 Jun, 2022, 1:58:35 AM
    Author     : rohit
--%>

<%@page contentType="text/html"  import="java.sql.*"pageEncoding="UTF-8"%>
<%
    
    String email=null;
    String answer="";
    String comment_id="";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue();
        }
    }
    if(email!=null){
                 if(request.getParameter("answer").length()==0 || request.getParameter("comment_id").length()==0){
                     
                 }
                 else{
                       answer=request.getParameter("answer");
                       comment_id=request.getParameter("comment_id");
                       try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow","root","");
                            Statement st=cn.createStatement();
                            if(st.executeUpdate("update answer set comment='"+answer+"' where answer_id='"+comment_id+"'")>0){
                                out.print("success");
                            }
                            else{
                                 out.print("something went wrong");
                            }
                            
                       }
                       catch(Exception e){
                           
                       }
                 }
        
    }
    else{
        
    }
    
    
    
    %>
