<%-- 
    Document   : reply
    Created on : 31 May, 2022, 1:11:27 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
    
    String question_id="";
    String  email="";
    String answer="";
    int sn=0;
    String answer_id="";
    Cookie c[]=request.getCookies();
    for(int i=0;i<c.length;i++){
        if(c[i].getName().equals("user")){
            email=c[i].getValue();
        }
    }
    if(email!=null){
                       if(request.getParameter("question_id").length()==0 || request.getParameter("answer").length()==0){
                           
                       }
                       else{
                             question_id=request.getParameter("question_id");
                             answer=request.getParameter("answer");
                             LinkedList l=new LinkedList();
                             for(int i=0;i<=9;i++){
                                 l.add(new Integer(i)); 
                             }
                             for(char i='A';i<='Z';i++){
                                  l.add(i); 
                             }
                             for(char i='a';i<='z';i++){
                                  l.add(i);
                             }
                             Collections.shuffle(l);
                              for(int i=1;i<=8;i++){
                                  answer_id=answer_id+l.get(i); 
                             }
                             
                             try{
                                   Class.forName("com.mysql.jdbc.Driver");
                                   Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow","root","");
                                   Statement st=cn.createStatement();
                                   Statement st1=cn.createStatement();
                                   
                                   ResultSet rs=st.executeQuery("select MAX(sn) from answer");
                                   if(rs.next()){
                                       sn=rs.getInt(1);
                                   }
                                   sn++;
                                   PreparedStatement ps=cn.prepareStatement("insert into answer values(?,?,?,?,?)");
                                   ps.setInt(1,sn);
                                   ps.setString(2,question_id);
                                   ps.setString(3,answer);
                                   ps.setString(4,answer_id);
                                   ps.setString(5,email);
                                   if(ps.executeUpdate()>0){
                                        if(st1.executeUpdate("update question set status='1' where question_id='"+question_id+"'")>0){
                                            out.print("success");
                                         }
                                       
                                   }
                                  
                                   
                                   
                                   
                                   
                                   
                             }
                             catch(Exception e){
                                 out.print(e.getMessage());
                             }
                       }
    }
    else{
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    %>
