<%-- 
    Document   : views
    Created on : 2 Jun, 2022, 11:48:45 PM
    Author     : rohit
--%>

<%@page contentType="text/html"  import="java.sql.*"pageEncoding="UTF-8"%>
<%
    
    String email=null;
    String question_id="";
    int sn=0;
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue();
        }
    }
    if(email!=null){
                  if(request.getParameter("question_id").length()==0){
                      
                  }
                  else{
                         question_id=request.getParameter("question_id");
                         try{
                               Class.forName("com.mysql.jdbc.Driver");
                               Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow","root","");
                               Statement st=cn.createStatement();
                                ResultSet rs=st.executeQuery("select MAX(sn) from views ");
                               if(rs.next()){
                                   sn=rs.getInt(1);
                               }
                               sn++; 
                               ResultSet rs1=st.executeQuery("select * from views where email='"+email+"' AND question_id='"+question_id+"'");
                               if(rs1.next()){
                                   
                               }
                               else{
                                     PreparedStatement ps=cn.prepareStatement("insert into views values(?,?,?)");
                                     ps.setInt(1,sn);
                                     ps.setString(2,question_id);
                                     ps.setString(3,email);
                                     if(ps.executeUpdate()>0){
                                         
                                     }
                               }
                               
                         }
                         catch(Exception e){
                             
                         }
                  }
        
    }
    else{
        
    }
    
    
    
    
    %>
