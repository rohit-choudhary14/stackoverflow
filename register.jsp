<%-- 
    Document   : register
    Created on : 23 May, 2022, 10:34:13 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
    String name="";
    String email="";
    String password="";
    String user_code="";
    int sn=0;
    if(request.getParameter("name").length()==0|| request.getParameter("email").length()==0|| request.getParameter("password").length()==0){
        
        
    }
    else{
           name=request.getParameter("name");
           email=request.getParameter("email");
           password=request.getParameter("password");
           LinkedList l=new LinkedList();
           for(int i=1;i<=9;i++){
               
               l.add(new Integer(i));
           }
           for(char i='A';i<='Z';i++){
               
               l.add(i);
           }
           for(char i='a';i<='z';i++){
               
               l.add(i);
           }
           Collections.shuffle(l);
           for(int i=1;i<=9;i++){
               user_code=user_code+l.get(i);
           }
           
           
           try{
               
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow","root","");
                Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery("select MAX(sn) from user");
                if(rs.next()){
                    sn=rs.getInt(1);
                }
                sn++;
                ResultSet rs1=st.executeQuery("select * from user where email='"+email+"'");
                if(rs1.next()){
                    response.sendRedirect("index.jsp?this_email_is_alredy_registerd_with_us");
                }
                else{
                        PreparedStatement ps=cn.prepareStatement("insert into user values(?,?,?,?,?)");
                        ps.setInt(1,sn);
                        ps.setString(2,user_code);
                        ps.setString(3,name);
                        ps.setString(4,email);
                        ps.setString(5,password);
                        if(ps.executeUpdate()>0){
                            response.sendRedirect("index.jsp?Registere_Success");
                        }
                }
                
                
               
           }
           catch(Exception e){
               
           }
        
        
        
    }
    
    
    
    %>

