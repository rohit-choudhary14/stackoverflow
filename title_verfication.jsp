<%-- 
    Document   : title_verfication
    Created on : 11 Jun, 2022, 6:08:50 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>

<%

    String email = null;
    String title = "";
    Cookie c[] = request.getCookies();
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("user")) {
            email = c[i].getValue();
        }
    }
    if (email != null) {
        if (request.getParameter("title").length() == 0) {
        } else {
            title = request.getParameter("title");
            try {
                int flag = 0;
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
                Statement st = cn.createStatement();
                Statement st1 = cn.createStatement();
                Statement st2 = cn.createStatement();
                Statement st3 = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from question where title like '%" +title+ "%'");
                %>
                
                
                <%
                   int question_count=0;   
                   int  views=0;
                   int votes_count=0;
                while (rs.next()) {
                    String about = rs.getString("body");
                    String tags = rs.getString("tags");
                    String question_id = rs.getString("question_id");
                    int length = about.length();
                    ResultSet rs2 = st1.executeQuery("select count(*) from answer where question_id='" + question_id + "'");
                    if (rs2.next()) {
                        question_count = rs2.getInt(1);
                    }
                    ResultSet rs3 = st2.executeQuery("select count(*) from views where question_id='" + question_id + "'");
                    if (rs3.next()) {
                        views = rs3.getInt(1);
                    }
                    ResultSet rs4 = st3.executeQuery("select count(*) from votes where question_id='" + question_id + "'");
                    if (rs4.next()) {
                       votes_count = rs4.getInt(1);
                    }




                    flag = 1;
                    %>
                     <div class="col-sm-12 card " style="overflow:">
                                <div class="row">
                     <div class="col-sm-2" >
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <span> <%=votes_count%> votes</span> 
                                            </div>
                                            <div class="col-sm-12">
                                                <span><%=question_count%> answer</span>
                                            </div>
                                            <div class="col-sm-12">
                                                <span><%=views%> views</span>
                                            </div>
                                        </div>
                                    </div>
                                             <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <a href="sq.jsp?qid=<%=question_id%>" class="link1" rel="<%=question_id%>"><%=title%></a>
                                            </div>
                                            <div class="col-sm-12">
                    
                     <%
                                                    if (length > 200) {
                                                       String  sub_about = about.substring(0, 150);


                                                %>

                                                <h6><%=sub_about%></h6>



                                                <%
                                                } else {

                                                %>

                                                <h6><%=about%></h6>

                                                <%

                                                    }
                                                %>
                                            </div>
                                              <div class="col-sm-12">
                                                <div class="row">
                                                    <%
                                                        String tag1[] = tags.split("#");
                                                        for (int j = 1; j < tag1.length; j++) {

                                                    %>
                                                    <section  style="margin-bottom:2%;margin-left:3%" >
                                                        <button class="btn btn-info" style="background-color:#E1ECF4;border-color:#E1ECF4"> <a href="tagged.jsp?tagged=<%=tag1[j]%>" style="font-size:15px" class="tag"><%=tag1[j]%></a></button>

                                                    </section> 

                                                    <%
                                                        }


                                                    %>
                                                </div>
                                            </div>
                                                 </div>

                                    </div>
                                    
                                                     </div>
                 </div>
                
                    
                    <%
                            
                            
                }
                %>
                
                           
                <%
                if (flag == 0) {

                    out.print("yes");
                }
            } catch (Exception e) {
            }

        }


    } else {
    }



%>
