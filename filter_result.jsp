<%-- 
    Document   : filter_result
    Created on : 6 Jun, 2022, 5:51:48 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    String value = "";
    String question_id = "";
    String title = "";
    String body = "";
    String new_question_id = "";
    String tag = "";
    if (request.getParameter("value").length() == 0) {
    } else {
        value = request.getParameter("value");
        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
            Statement st = cn.createStatement();
            Statement st1 = cn.createStatement();
            Statement st2 = cn.createStatement();
            Statement st3 = cn.createStatement();
            Statement st4 = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from answer");

            int votes_count = 0;
            int question_count = 0;
            int views = 0;
                       
                        %>
                        
                        
                   <div class="col-sm-12">
    <div class="row">     
                        
                        <%
                ResultSet rs1 = st1.executeQuery("select * from question where status='0'");
                
               while (rs1.next()) {
                    new_question_id = rs1.getString("question_id");
                    title = rs1.getString("title");
                    body = rs1.getString("body");
                    tag = rs1.getString("tags");
                    int length = body.length();
                    ResultSet rs2 = st2.executeQuery("select count(*) from votes where question_id='" + new_question_id + "'");
                    if (rs2.next()) {
                        votes_count = rs2.getInt(1);
                    }
                    ResultSet rs3 = st3.executeQuery("select count(*) from answer where question_id='" + new_question_id + "'");
                    if (rs3.next()) {
                        question_count = rs3.getInt(1);
                    }
                    ResultSet rs4 = st4.executeQuery("select count(*) from views where question_id='" + new_question_id + "'");
                    if (rs4.next()) {
                        views = rs4.getInt(1);
                    }


        %>
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
                    <a href="sq.jsp?qid=<%=new_question_id%>"><%=title%></a>
                </div>
                <div class="col-sm-12">
                    <%
                        if (length > 200) {
                            String sub_about = body.substring(0, 150);


                    %>

                    <h6><%=sub_about%></h6>
                    <%
                    } else {

                    %>


                    <h6><%=body%></h6>




                    <%
                        }
                    %>


                </div>
                <div class="col-sm-12">
                    <div class="row">
                        <%
                            String tag1[] = tag.split("#");
                            for (int j = 1; j < tag1.length; j++) {

                        %>
                        <section  style="margin-bottom:2%;margin-left:3%" >
                            <button class="btn btn-info" style="background-color:#E1ECF4;border-color:#E1ECF4"> <a href="#" style="font-size:15px" id="basic-tag"><%=tag1[j]%></a></button>

                        </section> 



                        <%
                            }


                        %>
                    </div>
                </div>
            </div>

        </div>
        <div class="col-sm-12" style="height:1px;background-color:gray">

        </div>




        <%
                }
            
        %>

    </div>
</div>

<%



        } catch (Exception e) {
        }

    }










%>
