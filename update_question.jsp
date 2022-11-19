<%-- 
    Document   : update_question
    Created on : 12 Jun, 2022, 12:38:57 AM
    Author     : rohit
--%>

<%@page contentType="text/html"  import="java.sql.*"pageEncoding="UTF-8"%>
<%
    
    String email=null;
    String title="";
    String question_id="";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue();
        }
    }
    if(email!=null){
                 if(request.getParameter("title").length()==0 || request.getParameter("question_id").length()==0){
                     
                 }
                 else{
                       title=request.getParameter("title");
                       question_id=request.getParameter("question_id");
                       try{
                            Class.forName("com.mysql.jdbc.Driver");
                            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow","root","");
                            Statement st=cn.createStatement();
                            if(st.executeUpdate("update question set title='"+title+"' where question_id='"+question_id+"'")>0){
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
