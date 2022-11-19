<%-- 
    Document   : tag_finder
    Created on : 26 May, 2022, 11:03:22 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<%
    String keyword = "";
    String email = null;
    int finder=0;
     String search_keyword[]={""};
      String search_keyword1[]={""};
            char d = ' ';

    Cookie c[] = request.getCookies();
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("user")) {
            email = c[i].getValue();
        }
    }
    if (email != null) {
        if (request.getParameter("keyword").length() == 0) {
        } 
        else {
           
            keyword = request.getParameter("keyword");//php,
            for (int j = 0; j < keyword.length(); j++) {
                d = keyword.charAt(j);//php,p
                if (d == ',') {
                    finder=1;
                    search_keyword = keyword.split(",");

                }
            }
           
            //out.print(search_keyword[0]);



%>
<div class="col-sm-12">
    <div class="row">

        <%
            try {
                int flag = 0;
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
                Statement st = cn.createStatement();
              if(finder==1){
                        for(int k=0;k<search_keyword.length;k++){
                            String new_keyword=search_keyword[k];
                         ResultSet rs = st.executeQuery("select * from tag where tag like '%" + new_keyword + "%' ");
                         int sn = 1;
                         finder=0;
                         while (rs.next()) {
                             flag = 1;
                             String tag = rs.getString("tag");

                 %>

        <div class="col-sm-3"  style="cursor:pointer" >
            <div class='alert alert-info alert-dismissible' rel="<%=sn%>"><a  style='cursor:pointer'class='close' data-dismiss='alert' aria-label='close'>&times;</a><span class="none"><%=tag%></span></div>
            
        </div>



        <%
                }   sn++;
            }
              }
              else{
                     finder=0;
                   ResultSet rs = st.executeQuery("select * from tag where tag like '%" +keyword + "%' ");
                         int sn = 1;
                        while(rs.next()) {
                             flag = 1;
                             String tag = rs.getString("tag");

                 %>

        <div class="col-sm-3"  style="cursor:pointer" >
            <div class='alert alert-info alert-dismissible' rel="<%=sn%>"><a  style='cursor:pointer'class='close' data-dismiss='alert' aria-label='close'>&times;</a><span class="none"><%=tag%></span></div>
            
           
        </div>
                  
                  
                  <%
                  
              }
              }
            
            if (flag == 0) {
        %>
        <div class="col-sm-12">
            <span>No result found</span>
        </div>
    </div>
</div>
<%          }
            
            }
            catch (Exception e) {
            }
        }

    } else {
    }



%>