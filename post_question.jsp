<%-- 
    Document   : post_question
    Created on : 29 May, 2022, 4:29:12 AM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
    String email = null;
    Cookie c[] = request.getCookies();  
    for (int i = 0; i <c.length; i++) {
        if (c[i].getName().equals("user")) {  
            email = c[i].getValue();
        }
    }
    if (email != null) {
        String title = request.getParameter("title");
        String about = request.getParameter("about");
        String tags = request.getParameter("tag");
        try{
             String code="";
             int sn=0;
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
             for(int i=0;i<=5;i++){
                 code=code+l.get(i);
             }
             int status=0; 
             Class.forName("com.mysql.jdbc.Driver");
             Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow","root","");
             Statement st=cn.createStatement();
             ResultSet rs=st.executeQuery("select MAX(sn) from question");
             if(rs.next()){
                 sn=rs.getInt(1); 
             }
             sn++; 
             PreparedStatement ps=cn.prepareStatement("insert into question values(?,?,?,?,?,?,?)");
             ps.setInt(1,sn);
             ps.setString(2,code);
             ps.setString(3,title);
             ps.setString(4,about);
             ps.setString(5,email);
             ps.setString(6,tags);
             ps.setInt(7,status);
             if(ps.executeUpdate()>0){
                 response.sendRedirect("dashboard.jsp");
             }
             
             
            
        }
        catch(Exception e){
            
        }
       
       
    } else {
        response.sendRedirect("index.jsp");
    }

    
   




%>
