<%-- 
    Document   : tag_verification
    Created on : 27 May, 2022, 11:47:20 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*"pageEncoding="UTF-8"%>
<%
    
    String tag="";
    String email=null;
    
    
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
           email=c[i].getValue(); 
            
        }
        
    }
    if(email!=null){
                  if(request.getParameter("tag").length()==0){
                      
                  }
                  else{
                        tag=request.getParameter("tag");
                        String arr[]=tag.split("#");
                        String s="";
                        
                        try{
                              Class.forName("com.mysql.jdbc.Driver");
                              Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow","root",""); 
                              Statement st=cn.createStatement();
                              for(int i=0;i<arr.length;i++){
                                 ResultSet rs=st.executeQuery("select * from tag where tag='"+arr[i]+"'");
                                 if(rs.next()){
                                     s="true";
                                 }
                                 else{
                                     s="false";
                                 }
                              
                              }
                              out.print(s);
                              
                        }
                        catch(Exception e){
                            
                        }
                  }
        
    }
    else{
        
    }
    
    
    
    
    
    
    %>

