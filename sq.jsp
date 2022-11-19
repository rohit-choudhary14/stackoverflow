<%-- 
    Document   : sq
    Created on : 30 May, 2022, 4:16:29 PM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    String email = null;
    String title = "";
    String about = "";
    String question_id = "";

    Cookie c[] = request.getCookies();
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("user")) {
            email = c[i].getValue();
        }

    }
    if (email != null) {
        if (request.getParameter("qid").length() == 0) {
        } else {
            question_id = request.getParameter("qid");

        }

%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tour-Stackoverflow</title>
        <link href="logo/download.png" rel="icon">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap CSS -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="jquery-3.6.0.min.js"></script>
        <link href="css/style.css" rel="stylesheet">
        <script>
            $(document).ready(function() {

            $(".fa.fa-reorder").on("click", function() {
            var id = $(this).attr("id");
            if (id === "reorder") {
            $(this).removeClass("fa fa-reorder");
            $(this).addClass("fa fa-close");
            $(this).attr("id", "close");
            $(".dropdown-menu.position-absolute").show();
            }
            else {
            $(this).removeClass("fa fa-close");
            $(this).addClass("fa fa-reorder");
            $(this).attr("id", "reorder");
            $(".dropdown-menu.position-absolute").hide();
            }




            });
            $("#cancel-card").on("click", function() {

            $("#card1").slideUp();

            });
            $("#filter").on("click", function() {

            $("#card1").slideDown();

            });
            $("#up").on("click", function() {
            var text = $("#votes").text();
            var question_id = $(this).attr("rel");

            if (text === "1") {
            $("#votes").text("0");
            }
            if (text === "-1") {
            $("#votes").text("0");
            }
            if (text === "0") {
            $("#votes").text("1");
            }
            var votes = $("#votes").text();
            $.post(
            "votes.jsp", {question_id: question_id, votes: votes}, function(data) {

            }

            );


            });
            $("#down").on("click", function() {
            var text = $("#votes").text();
            var question_id = $(this).attr("rel");

            if (text === "1") {
            $("#votes").text("0");
            }
            if (text === "0") {
            $("#votes").text("-1");
            }
            if (text === "-1") {
            $("#votes").text("0");
            }
            var votes = $("#votes").text();
            $.post(
            "votes.jsp", {question_id: question_id, votes: votes}, function(data) {

            }

            );


            });
            $("#post-answer").on("click", function() {
            var answer = $("#comment-answer").val();
            var question_id = $(this).attr("rel");
            var user_name = $(this).attr("rel1");
            var sn=$(this).attr("rel2");
            var answer_count=$(this).attr("rel3");
            
            if (answer.length >= 30) {
            $("#info-comment-answer").html("");
            $("#comment-answer").css("border-color", "");

            $.post(
            "reply.jsp", {question_id: question_id, answer: answer}, function(data) {
             $(".btn.btn-success.btn-block").text(sn+"  "+"ANSWER");
              if(answer_count==="0"){
              
                $("#first_time_answer_filter").show();
                $("#first_time_answer_break").show();
                 answer_count=parseInt(answer_count)+1;
                 $("#post-answer").attr("rel3",answer_count);
              
              
              
              }
            $("#show-answer").prepend("<div class='row' style='margin-top:2%'><div class='col-sm-12'><span id='reply-comment'></span></div> <div class='col-sm-12'><a href='' style='float:right' id='set-name-for-comment'></a></div> <div class='col-sm-12' style='height:1px;background-color:gray'></div></div>");
            $("#set-name-for-comment").text(user_name);
            if(answer.length>150){
            $("#reply-comment").html("<span id='cover_answer_view-"+sn+"'> "+answer.substring(0, 150)+" <span style='cursor:pointer'  rel='"+sn+"' class='show_answer'><b>.....See More</b></span></span><span style='display:none' id='full_answer-"+sn+"'> "+answer+" <span style='cursor:pointer' rel='"+sn+"' class='hide_answer'><b>...See Less</b></span></span>");
            $(".show_answer").on("click",function(){
            var id=$(this).attr("rel");
            $("#full_answer-"+id).show();
            $("#cover_answer_view-"+id).hide();



            });
            $(".hide_answer").on("click",function(){
            var id=$(this).attr("rel");
            $("#full_answer-"+id).hide();
            $("#cover_answer_view-"+id).show();





            });





            }
            else{

            $("#reply-comment").text(answer);
            }

            $("#comment-answer").val("");
            sn=parseInt(sn)+1;
            $("#post-answer").attr("rel2",sn);





            });


            }
            if (answer.length < 30) {
            $("#info-comment-answer").html("<span style='color:red'>Body must be at least 30 characters, you entered" + answer.length + "</span>");
            $("#comment-answer").css("border-color", "red");
            }

            if (answer.length <= 0) {
            $("#info-comment-answer").html("<span style='color:red'>Body is missing</span>");
            $("#comment-answer").css("border-color", "red");
            }


            });

            $(".show_answer").on("click",function(){
            var id=$(this).attr("rel");
            $("#full_answer-"+id).show();
            $("#cover_answer_view-"+id).hide();



            });
            $(".hide_answer").on("click",function(){
            var id=$(this).attr("rel");
            $("#full_answer-"+id).hide();
            $("#cover_answer_view-"+id).show();





            });

            });

        </script> 
        <style>
            #card1{


                box-shadow:1px 1px 5px rgba(0,0, 0, 0.4);
                background-color:#F1F2F4;
                height:200px;
                display:none;
                margin-left:-40px;
            } 
            a:hover{
                text-decoration: none;
            }

        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-light navbar-dark sticky-top" id="card">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <!-- <ul class="navbar-nav">
 
                 <div class="nav-item dropdown">
                     <a  style="cursor:pointer;font-size:20px" data-toggle="dropdown">
                         <i class="fa fa-reorder" id="reorder"></i></a>
                     <div class="dropdown-menu position-absolute"   id="card"style="margin-right:-300px;margin-top:13px">
                         <div class="row" >
                             <div class="col-sm-12" style="margin-top:2%">
                                 <a href="#" class="dropdown-item">
                                    
                                     <span>Home</span>
                                 </a>
                             </div>
                             <div class="col-sm-12" style="margin-top:2%">
                                 <a href="#" class="dropdown-item">
                                    
                                     <span>Public</span>
                                 </a>
                             </div>
                            
                             <div class="col-sm-12" style="margin-top:2%">
                                 <a href="#" class="dropdown-item">
                                     <i class="fa fa-globe"></i>
                                    
                                     <span>Questions</span>
                                 </a>
                             </div>
                              <div class="col-sm-12" style="margin-top:2%">
                                 <a href="#" class="dropdown-item">
                                    
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                     <span>Tags</span>
                                 </a>
                             </div>
                              <div class="col-sm-12" style="margin-top:2%">
                                 <a href="#" class="dropdown-item">
                                    
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                     <span>users</span>
                                 </a>
                             </div>
                         <div class="col-sm-12" style="margin-top:2%">
                                 <a href="#" class="dropdown-item">
                                    
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                     <span>Companies</span>
                                 </a>
                             </div>
 
                         </div>
                     </div>
                 </div>
                 </div>
                 </li>
 
             </ul>-->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="navbar-brand" href="dashboard.jsp"><img src="logo/0_stack_overflow_logo.jpg"style="height:30px;margin-top:-20px"/></a>
            &nbsp;&nbsp;
            <ul class="navbar-nav">

                &nbsp;<li class="nav-item">
                    <a class="nav-link" id="link-2" href="#">Product</a>


            </ul>&nbsp;
            <div class="input-group mb-0">

                <input type="text" class="form-control" placeholder="search..." aria-label="search" aria-describedby="basic-addon1">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1"><i class="fa fa-search"></i></span>
                </div>
            </div>
            <ul class="navbar-nav">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li class="nav-item">
                    <div class="nav-item dropdown">
                        <a  href="user.jsp" style="cursor:pointer;font-size:20px" >
                            <img src="logo/244563b95ff22a5cc309cea450ba1922.png"style="height:30px"></a>
                        <div class="dropdown-menu position-absolute1"  style="margin-left:-300px;margin-top:20px">
                            <div class="row" >
                                <div class="col-sm-12" style="margin-top:2%">
                                    <a href="#" class="dropdown-item">
                                        <i class="fa fa-user-circle-o" style="color:#F1F2F4">
                                        </i>
                                        <span>My Profile</span>
                                    </a>
                                </div>





                                <div class="col-sm-12" >
                                    <a href="logout.jsp" class="dropdown-item"><i class="fa fa-sign-out" style="color:#F1F2F4">
                                        </i>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <span>Logout</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--<a class="nav-link" style="color:black" href="#">Login</a>-->

                </li>

            </ul>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        </nav>



        <div class="container-fluid">
            <div class="row" >

                <div class="col-sm-2 card"   >
                    <div class="row" >
                        <section  id="top-bar-fixed">
                            <div class="col-sm-12" style="margin-top:2%">
                                <a href="dashboard.jsp" class="dropdown-item">

                                    <span>Home</span>
                                </a>
                            </div>
                            <div class="col-sm-12" style="margin-top:2%">
                                <a href="dashboard.jsp" class="dropdown-item">

                                    <span>Public</span>
                                </a>
                            </div>

                            <div class="col-sm-12" style="margin-top:2%">
                                <a href="dashboard.jsp" class="dropdown-item">
                                    <i class="fa fa-globe"></i>

                                    <span>Questions</span>
                                </a>
                            </div>
                            <div class="col-sm-12" style="margin-top:2%">
                                <a href="tag.jsp" class="dropdown-item">

                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>Tags</span>
                                </a>
                            </div>
                            <div class="col-sm-12" style="margin-top:2%">
                                <a href="#" class="dropdown-item">

                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>users</span>
                                </a>
                            </div>
                            <div class="col-sm-12" style="margin-top:2%">
                                <a href="#" class="dropdown-item">

                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>Companies</span>
                                </a>
                            </div>
                        </section>
                    </div>

                </div>


                <%

                    String tag = "";
                    int answer_count = 0;
                    String name = "";
                    String user_email = "";
                    String user_name = "";
                    int votes_count = 0;


                    try {

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
                        Statement st = cn.createStatement();
                        Statement st1 = cn.createStatement();
                        Statement st2 = cn.createStatement();
                        Statement st3 = cn.createStatement();
                        ResultSet rs = st.executeQuery("select * from question where question_id='" + question_id + "'");
                        if (rs.next()) {
                            title = rs.getString("title");
                            about = rs.getString("body");
                            tag = rs.getString("tags");


                        }
                        ResultSet rs1 = st.executeQuery("select count(*) from answer where question_id='" + question_id + "'");
                        if (rs1.next()) {
                            answer_count = rs1.getInt(1);


                        }
                        ResultSet rs5 = st.executeQuery("select name from user where email='" + email + "'");
                        if (rs5.next()) {
                            user_name = rs5.getString("name");


                        }
                        ResultSet rs6 = st3.executeQuery("select votes from votes where question_id='" + question_id + "' AND email='" + email + "'");
                        if (rs6.next()) {
                            votes_count = rs6.getInt("votes");


                        }















                %>
                <div class="col-sm-10" >
                    <div class="row"  style="margin-top:2%">
                        <div class="col-sm-10">
                            <h3><%=title%></h3>
                        </div>
                        <div class="col-sm-2"  >
                            <a href="question.jsp" style="color:white"><button class="btn btn-primary">Ask Question</button></a>


                        </div>
                        <div class="col-sm-12"  style="height:1px;background-color:gray"></div>
                        <div class="col-sm-1" style="margin-top:15px;">
                            <div class="row">
                                <div class="col-sm-12">
                                    <i class="fa fa-play"  id="up" rel="<%=question_id%>"style="transform:rotate(270deg);font-size:40px;cursor:pointer;color:#D3D3D3"></i>
                                </div>
                                <div class="col-sm-12">
                                    <span style="font-size:25px;margin-left:8%;color:#D3D3D3" id="votes"><%=votes_count%></span>
                                </div> 
                                <div class="col-sm-12"> 
                                    <i class="fa fa-play" id="down" rel="<%=question_id%>"style="transform:rotate(90deg);font-size:40px;cursor:pointer;color:#D3D3D3"></i>
                                </div>
                            </div>





                        </div>
                        <div class="col-sm-11">
                            <div class="row" style="margin-top:15px;">
                                <div class="col-sm-12">
                                    <span><%=about%></span>
                                </div>

                                <%
                                    String tag1[] = tag.split("#");
                                    for (int j = 1; j < tag1.length; j++) {

                                %>
                                <section  style="margin-bottom:2%;margin-left:2%;margin-top:2%" >
                                    <button class="btn btn-info" style="background-color:#E1ECF4;border-color:#E1ECF4"> <a href="tagged.jsp?tagged=<%=tag1[j]%>" style="font-size:15px"><%=tag1[j]%></a></button>

                                </section> 
                                <%
                                    }



                                    if (answer_count > 0) {

                                %>


                                <div class="col-sm-12" style="margin-top:70px;">
                                    <div class="row">
                                        <div class="col-sm-6">

                                            <div class="form-group">

                                                <select class="form-control" >
                                                    <option>Highest Score(default)</option>
                                                    <option>Date Modified(newest first)</option>
                                                    <option>Date created(oldest first)</option>
                                                </select>
                                            </div>



                                        </div>
                                        <div class="col-sm-3">

                                        </div>

                                        <div class="col-sm-3">

                                            <button class='btn btn-success btn-block'style='float:right'> <%=answer_count%>&nbsp;&nbsp;<span>ANSWER</span></button>



                                        </div>
                                    </div>


                                </div>
                                <div class="col-sm-12" style="height:1px;background-color:gray;margin-top:2%">

                                </div>
                                <%                                    }



                               
                                 if (answer_count==0) {

                                %>


                                <div class="col-sm-12" style="margin-top:70px;display:none"  id="first_time_answer_filter">
                                    <div class="row">
                                        <div class="col-sm-6">

                                            <div class="form-group">

                                                <select class="form-control" >
                                                    <option>Highest Score(default)</option>
                                                    <option>Date Modified(newest first)</option>
                                                    <option>Date created(oldest first)</option>
                                                </select>
                                            </div>



                                        </div>
                                        <div class="col-sm-3">

                                        </div>

                                        <div class="col-sm-3">

                                            <button class='btn btn-success btn-block'style='float:right'> <%=answer_count%>&nbsp;&nbsp;<span>ANSWER</span></button>



                                        </div>
                                    </div>


                                </div>
                                <div class="col-sm-12" style="height:1px;background-color:gray;margin-top:2%;display:none" id="first_time_answer_break">

                                </div>
                                <%                                    }



                                %>
                                <div class="col-sm-12" style="margin-top:5px;">

                                    <%
                                        String answer = "";

                                        int sn = 1;
                                        ResultSet rs2 = st1.executeQuery("select * from answer where question_id='" + question_id + "'");
                                        while (rs2.next()) {
                                            answer = rs2.getString("comment");
                                            user_email = rs2.getString("email");
                                            ResultSet rs4 = st2.executeQuery("select name from user where email='" + user_email + "'");
                                            if (rs4.next()) {
                                                name = rs4.getString("name");


                                            }






                                    %>
                                    <div class="row" style="margin-top:2%">
                                        <div class="col-sm-12">
                                            <%
                                                if (answer.length() > 150) {
                                            %>
                                            <span id="cover_answer_view-<%=sn%>"><%=answer.substring(0, 150)%><span style='cursor:pointer'  rel="<%=sn%>" class='show_answer'><b>.....See More</b></span></span>

                                            <span style='display:none' id='full_answer-<%=sn%>'><%=answer%><span style='cursor:pointer' rel="<%=sn%>" class='hide_answer'><b>...See Less</b></span></span>


                                            <%
                                            } else {
                                            %>
                                            <span><%=answer%></span>
                                            <%
                                                }
                                            %>

                                        </div>
                                        <div class="col-sm-12">

                                            <a href='' style="float:right">-<%=name%></a>
                                        </div>
                                        <div class="col-sm-12" style="height:1px;background-color:gray">

                                        </div>
                                    </div>
                                    <%
                                            sn++;
                                        }


                                    %>

                                </div>
                                <div class="col-sm-12"  style="margin-top:5px"id="show-answer">

                                </div>



                                <%
                                    if (answer_count > 0) {

                                %>

                                <div class="col-sm-12" style="margin-top:200px">
                                    <h5>Know someone who can answer? Share a link to this question via <a href="#">email</a>, <a href="#">Twitter</a>, or <a href="#">Facebook.</a></h5>
                                </div>


                                <%                        } else {

                                %>
                                <div class="col-sm-12" style="margin-top:20px">
                                    <h5>Know someone who can answer? Share a link to this question via <a href="#">email</a>, <a href="#">Twitter</a>, or <a href="#">Facebook.</a></h5>
                                </div>




                                <%                                                 }

                                %>

                                <div class="col-sm-12" style="margin-top:2%">
                                    <h5>Your Answer</h5>
                                </div>
                                <div class="col-sm-12" style="margin-top:2%">

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <textarea class="form-control" id="comment-answer" rows="10"  style="resize:none" placeholder="Write your answer here..."></textarea>
                                            <span id="info-comment-answer"></span>
                                        </div>

                                    </div>
                                </div>




                                <div class="col-sm-12" style="margin-top:2%">
                                    <button class="btn btn-primary" id="post-answer" rel="<%=question_id%>" rel1="<%=user_name%>" rel2="<%=sn%>" rel3="<%=answer_count%>">Post Your Answer</button>
                                </div>
                                <div class="col-sm-12" style="margin-top:2%">
                                    <h5>Browse other questions tagged
                                        <%

                                            for (int j = 1; j < tag1.length; j++) {

                                        %>

                                        <button class="btn btn-info" style="background-color:#E1ECF4;border-color:#E1ECF4"> <a href="#" style="font-size:15px"><%=tag1[j]%></a></button>


                                        <%
                                            }
                                        %>
                                        or <a href="question.jsp">ask your own question.</a>
                                    </h5>
                                </div>
                            </div>



                        </div>
                        <!----
                        <div class="col-sm-4"style="margin-top:15px;height:435px;margin-left:50px" id="side-blog-2"   >
                            <div class="row" >
                                <div class="col-sm-12" id="new-blog-row-2">
                                    <span><b>The Overflow Blog</b></span>
                                </div>
                                <div class="col-sm-12" id="new-blog-row-12">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <i class="fa fa-edit"></i>

                                        </div>
                                        <div class="col-sm-10">
                                            <span>The science of interviewing developers</span>

                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-12" id="new-blog-row-12">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <i class="fa fa-edit"></i>

                                        </div>
                                        <div class="col-sm-10">
                                            <span>Turns out the Great Resignation goes both ways</span>

                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-12" id="new-blog-row-2">
                                    <span ><b>Featured on Meta</b></span>
                                </div>
                                <div class="col-sm-12" id="new-blog-row-12">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <i class="fa fa-comments"></i>

                                        </div>
                                        <div class="col-sm-10">
                                            <span>Announcing the arrival of Valued Associate</span>

                                        </div>
                                    </div>

                                </div>

                                <div class="col-sm-12" id="new-blog-row-12">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <i class="fa fa-comments"></i>

                                        </div>
                                        <div class="col-sm-10">
                                            <span>Improvements to site status and incident communication</span>

                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-12" id="new-blog-row-12">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <img src="logo/download.png" height="20px"/>

                                        </div>
                                        <div class="col-sm-10">
                                            <span>Retiring Our Community-Specific Closure Reasons for Server Fault and Super User</span>

                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-12" id="new-blog-row-12">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <img src="logo/download.png" height="20px"/>


                                        </div>
                                        <div class="col-sm-10">
                                            <span>Temporarily pausing the site satisfaction survey</span>

                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-12" id="new-blog-row-12">
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <img src="logo/download.png" height="20px"/>


                                        </div>
                                        <div class="col-sm-10">
                                            <span>Staging Ground: Reviewer Motivation, Scaling, and Open Questions</span>
                                        </div>
                                    </div>

                                </div>

                            </div>

                        </div>
                                        <div class="col-sm-1">
                                            
                                        </div>
                        

                    </div>



                </div>



                        <!---- <div class="col-sm-3"style="margin-top:15px;height:484px;margin-left:30px" id="side-blog-2"   >
                             <div class="row" >
                                 <div class="col-sm-12" id="new-blog-row-2">
                                     <span><b>The Overflow Blog</b></span>
                                 </div>
                                 <div class="col-sm-12" id="new-blog-row-12">
                                     <div class="row">
                                         <div class="col-sm-2">
                                             <i class="fa fa-edit"></i>
         
                                         </div>
                                         <div class="col-sm-10">
                                             <span>The science of interviewing developers</span>
         
                                         </div>
                                     </div>
         
                                 </div>
                                 <div class="col-sm-12" id="new-blog-row-12">
                                     <div class="row">
                                         <div class="col-sm-2">
                                             <i class="fa fa-edit"></i>
         
                                         </div>
                                         <div class="col-sm-10">
                                             <span>Turns out the Great Resignation goes both ways</span>
         
                                         </div>
                                     </div>
         
                                 </div>
                                 <div class="col-sm-12" id="new-blog-row-2">
                                     <span ><b>Featured on Meta</b></span>
                                 </div>
                                 <div class="col-sm-12" id="new-blog-row-12">
                                     <div class="row">
                                         <div class="col-sm-2">
                                             <i class="fa fa-comments"></i>
         
                                         </div>
                                         <div class="col-sm-10">
                                             <span>Announcing the arrival of Valued Associate</span>
         
                                         </div>
                                     </div>
         
                                 </div>
         
                                 <div class="col-sm-12" id="new-blog-row-12">
                                     <div class="row">
                                         <div class="col-sm-2">
                                             <i class="fa fa-comments"></i>
         
                                         </div>
                                         <div class="col-sm-10">
                                             <span>Improvements to site status and incident communication</span>
         
                                         </div>
                                     </div>
         
                                 </div>
                                 <div class="col-sm-12" id="new-blog-row-12">
                                     <div class="row">
                                         <div class="col-sm-2">
                                             <img src="logo/download.png" height="20px"/>
         
                                         </div>
                                         <div class="col-sm-10">
                                             <span>Retiring Our Community-Specific Closure Reasons for Server Fault and Super User</span>
         
                                         </div>
                                     </div>
         
                                 </div>
                                 <div class="col-sm-12" id="new-blog-row-12">
                                     <div class="row">
                                         <div class="col-sm-2">
                                             <img src="logo/download.png" height="20px"/>
         
         
                                         </div>
                                         <div class="col-sm-10">
                                             <span>Temporarily pausing the site satisfaction survey</span>
         
                                         </div>
                                     </div>
         
                                 </div>
                                 <div class="col-sm-12" id="new-blog-row-12">
                                     <div class="row">
                                         <div class="col-sm-2">
                                             <img src="logo/download.png" height="20px"/>
         
         
                                         </div>
                                         <div class="col-sm-10">
                                             <span>Staging Ground: Reviewer Motivation, Scaling, and Open Questions</span>
                                         </div>
                                     </div>
         
                                 </div>
         
                             </div>
         
                         </div>
                         <div class="col-sm-1">
                         </div>-->


                    </div>
                </div>
                <%

                    } catch (Exception e) {
                    }



                %>
                <!-- Footer Start -->
                <div class="container-fluid bg-dark text-light">
                    <div class="row px-xl-5 pt-5">
                        <div class="col-sm-1">
                            <img src="logo/768px-Stack_Overflow_icon.svg.png"style="height:70px;margin-top:-20px"/>

                        </div>
                        <div class="col-sm-3">
                            <div class="row">
                                <div class="col-sm-12">

                                    <h4 class="mb-4 display-5 font-weight-semi-bold"><span class="text-light font-weight-bold">STACK&nbsp;OVERFLOW</span></h4>

                                    <p>Question</p>
                                    <p>Help</p>
                                </div>

                            </div>



                        </div>
                        <div class="col-lg-8 col-md-12">
                            <div class="row">
                                <div class="col-md-4 mb-5">
                                    <h5 class="font-weight-bold text-light mb-4">Products</h5>
                                    <div class="d-flex flex-column justify-content-start">
                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Teams</a>
                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Advertising</a>
                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Collective</a>
                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Talent</a>

                                    </div>
                                </div>
                                <div class="col-md-4 mb-5">
                                    <h5 class="font-weight-bold text-light mb-4">Company</h5>
                                    <div class="d-flex flex-column justify-content-start">
                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>About</a>
                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Press</a>
                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Work Here</a>
                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Legal</a>

                                        <a class="text-light" href=""><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                                    </div>
                                </div>
                                <div class="col-md-4 mb-5">
                                    <h5 class="font-weight-bold text-light mb-4">STACK EXCHANGE NETWORK</h5>
                                    <div class="d-flex flex-column justify-content-start">
                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Technology</a>
                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Culture & Recreation</a>
                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Life & arts</a>
                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Professional</a>


                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>

                </body>
                </html>



                <%    } else {
                    if (request.getParameter("qid").length() == 0) {
                    } else {
                        question_id = request.getParameter("qid");

                    }
                %>

                <html>
                    <head>
                        <title>Ask a question-Stack overflow</title>
                        <meta content="width=device-width, initial-scale=1.0" name="viewport">
                        <meta content="Free HTML Templates" name="keywords">
                        <meta content="Free HTML Templates" name="description">
                        <link href="logo/download.png" rel="icon">
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
                        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
                        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
                        <link href="css/style.css" rel="stylesheet">
                        <script>

                            $(document).ready(function(){
                            $("#post-answer").on("click",function(){
                            // 
                            var post=$("#comment-answer").val();
                            if(post.length===0){
                            $("#comment-answer").css("border-color","red");
                            $("#info-comment-answer").html("<span style='color:red'>Answer can't be empty</span>");
                            }
                            if(post.length<30 && post.length>0){
                            $("#comment-answer").css("border-color","red");
                            $("#info-comment-answer").html("<span style='color:red'>Answer must be at least 30 character you enter only '"+post.length+"' character</span>");
                            }
                            if(post.length>=30){
                            $("#comment-answer").css("border-color","");
                            $("#info-comment-answer").html("");
                            $("#myModal1").modal();
                            }




                            });
                            $(".show_answer").on("click",function(){
                            var id=$(this).attr("rel");
                            $("#full_answer-"+id).show();
                            $("#cover_answer_view-"+id).hide();



                            });
                            $(".hide_answer").on("click",function(){
                            var id=$(this).attr("rel");
                            $("#full_answer-"+id).hide();
                            $("#cover_answer_view-"+id).show();





                            });
                            });




                        </script>
                    </head>
                    <body>
                        <nav class="navbar navbar-expand-sm bg-light navbar-dark sticky-top" id="card">
                            <a class="navbar-brand" href="#"><img src="logo/0_stack_overflow_logo.jpg"style="height:30px;margin-top:-20px"/></a>
                            <ul class="navbar-nav">
                                &nbsp;<li class="nav-item">
                                    <a class="nav-link"  id="link-1" href="#">About</a>

                                </li>
                                &nbsp;<li class="nav-item">
                                    <a class="nav-link" id="link-2" href="#">Product</a>

                                </li>
                                &nbsp; <li class="nav-item">
                                    <a class="nav-link" id="link-3" href="#">For&nbsp;Teams</a>

                                </li>
                            </ul>&nbsp; 
                            <div class="input-group mb-0">

                                <input type="text" class="form-control" placeholder="search..." aria-label="search" aria-describedby="basic-addon1">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fa fa-search"></i></span>
                                </div>
                            </div>
                            <ul class="navbar-nav">
                                &nbsp;<li class="nav-item">
                                    <!--<a class="nav-link" style="color:black" href="#">Login</a>-->
                                    <input type="button" class="btn btn-primary" value="Login"  data-toggle="modal" data-target="#myModal1"/>
                                </li>
                                &nbsp; <li class="nav-item">
                                    <input type="button" class="btn btn-primary" id="sign-up"  data-toggle="modal" data-target="#myModal2" value="Sign Up"/>
                                </li>
                            </ul>

                        </nav>
                        <div class="container-fluid">
                            <div class="row" >

                                <div class="col-sm-2 card"  >
                                    <div class="row" >
                                        <section id="top-bar-fixed">
                                            <div class="col-sm-12" style="margin-top:2%">
                                                <a href="index.jsp" class="dropdown-item">

                                                    <span>Home</span>
                                                </a>
                                            </div>
                                            <div class="col-sm-12" style="margin-top:2%">
                                                <a href="index.jsp" class="dropdown-item">

                                                    <span>Public</span>
                                                </a>
                                            </div>

                                            <div class="col-sm-12" style="margin-top:2%">
                                                <a href="index.jsp" class="dropdown-item">
                                                    <i class="fa fa-globe"></i>

                                                    <span>Questions</span>
                                                </a>
                                            </div>
                                            <div class="col-sm-12" style="margin-top:2%">
                                                <a href="tag.jsp" class="dropdown-item">

                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span>Tags</span>
                                                </a>
                                            </div>
                                            <div class="col-sm-12" style="margin-top:2%">
                                                <a href="#" class="dropdown-item">

                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span>users</span>
                                                </a>
                                            </div>
                                            <div class="col-sm-12" style="margin-top:2%">
                                                <a href="#" class="dropdown-item">

                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span>Companies</span>
                                                </a>
                                            </div>
                                        </section>
                                    </div>

                                </div>
                                <%

                                    String tag = "";
                                    int answer_count = 0;
                                    String name = "";
                                    String user_email = "";
                                    String user_name = "";
                                    int votes_count = 0;


                                    try {

                                        Class.forName("com.mysql.jdbc.Driver");
                                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
                                        Statement st = cn.createStatement();
                                        Statement st1 = cn.createStatement();
                                        Statement st2 = cn.createStatement();
                                        Statement st3 = cn.createStatement();
                                        ResultSet rs = st.executeQuery("select * from question where question_id='" + question_id + "'");
                                        if (rs.next()) {
                                            title = rs.getString("title");
                                            about = rs.getString("body");
                                            tag = rs.getString("tags");


                                        }
                                        ResultSet rs1 = st1.executeQuery("select count(*) from answer where question_id='" + question_id + "'");
                                        if (rs1.next()) {
                                            answer_count = rs1.getInt(1);


                                        }















                                %>
                                <div class="col-sm-10" >
                                    <div class="row"  style="margin-top:2%">
                                        <div class="col-sm-10">
                                            <h3><%=title%></h3>
                                        </div>
                                        <div class="col-sm-2"  >
                                            <a href="question.jsp" style="color:white"><button class="btn btn-primary">Ask Question</button></a>


                                        </div>
                                        <div class="col-sm-12"  style="height:1px;background-color:gray"></div>
                                        <div class="col-sm-1" style="margin-top:15px;">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <i class="fa fa-play"  id="up" rel="<%=question_id%>"style="transform:rotate(270deg);font-size:40px;cursor:pointer;color:#D3D3D3"></i>
                                                </div>
                                                <div class="col-sm-12">
                                                    <span style="font-size:25px;margin-left:8%;color:#D3D3D3" id="votes"><%=votes_count%></span>
                                                </div> 
                                                <div class="col-sm-12"> 
                                                    <i class="fa fa-play" id="down" rel="<%=question_id%>"style="transform:rotate(90deg);font-size:40px;cursor:pointer;color:#D3D3D3"></i>
                                                </div>
                                            </div>




                                        </div>
                                        <div class="col-sm-11">
                                            <div class="row" style="margin-top:15px;">
                                                <div class="col-sm-12">
                                                    <span><%=about%></span>
                                                </div>

                                                <%
                                                    String tag1[] = tag.split("#");
                                                    for (int j = 1; j < tag1.length; j++) {

                                                %>
                                                <section  style="margin-bottom:2%;margin-left:2%;margin-top:2%" >
                                                    <button class="btn btn-info" style="background-color:#E1ECF4;border-color:#E1ECF4"> <a href="tagged.jsp?tagged=<%=tag1[j]%>" style="font-size:15px"><%=tag1[j]%></a></button>

                                                </section> 
                                                <%
                                                    }



                                                    if (answer_count > 0) {

                                                %>


                                                <div class="col-sm-12" style="margin-top:70px;">
                                                    <div class="row">
                                                        <div class="col-sm-6">

                                                            <div class="form-group">

                                                                <select class="form-control" >
                                                                    <option>Highest Score(default)</option>
                                                                    <option>Date Modified(newest first)</option>
                                                                    <option>Date created(oldest first)</option>
                                                                </select>
                                                            </div>



                                                        </div>
                                                        <div class="col-sm-3">

                                                        </div>

                                                        <div class="col-sm-3">

                                                            <button class='btn btn-success btn-block'style='float:right'> <%=answer_count%>&nbsp;&nbsp;ANSWER</button>



                                                        </div>
                                                    </div>


                                                </div>
                                                <div class="col-sm-12" style="height:1px;background-color:gray;margin-top:2%">

                                                </div>
                                                <%                                    }



                                                %>
                                                <div class="col-sm-12" style="margin-top:5px;">

                                                    <%
                                                        String answer = "";

                                                        int sn = 1;
                                                        ResultSet rs2 = st1.executeQuery("select * from answer where question_id='" + question_id + "'");
                                                        while (rs2.next()) {
                                                            answer = rs2.getString("comment");
                                                            user_email = rs2.getString("email");
                                                            ResultSet rs4 = st2.executeQuery("select name from user where email='" + user_email + "'");
                                                            if (rs4.next()) {
                                                                name = rs4.getString("name");


                                                            }






                                                    %>
                                                    <div class="row" style="margin-top:2%">
                                                        <div class="col-sm-12">
                                                            <%
                                                                if (answer.length() > 150) {
                                                            %>
                                                            <span id="cover_answer_view-<%=sn%>"><%=answer.substring(0, 150)%><span style='cursor:pointer'  rel="<%=sn%>" class='show_answer'><b>.....See More</b></span></span>

                                                            <span style='display:none' id='full_answer-<%=sn%>'><%=answer%><span style='cursor:pointer' rel="<%=sn%>" class='hide_answer'><b>...See Less</b></span></span>


                                                            <%
                                                            } else {
                                                            %>
                                                            <span><%=answer%></span>
                                                            <%
                                                                }
                                                            %>

                                                        </div>
                                                        <div class="col-sm-12">

                                                            <a href=""style="float:right">-<%=name%></a>
                                                        </div>
                                                        <div class="col-sm-12" style="height:1px;background-color:gray">

                                                        </div>
                                                    </div>
                                                    <%
                                                            sn++;
                                                        }


                                                    %>

                                                </div>
                                                <div class="col-sm-12"  style="margin-top:5px"id="show-answer">

                                                </div>



                                                <%
                                                    if (answer_count > 0) {

                                                %>

                                                <div class="col-sm-12" style="margin-top:200px">
                                                    <h5>Know someone who can answer? Share a link to this question via <a href="#">email</a>, <a href="#">Twitter</a>, or <a href="#">Facebook.</a></h5>
                                                </div>


                                                <%                        } else {

                                                %>
                                                <div class="col-sm-12" style="margin-top:20px">
                                                    <h5>Know someone who can answer? Share a link to this question via <a href="#">email</a>, <a href="#">Twitter</a>, or <a href="#">Facebook.</a></h5>
                                                </div>




                                                <%                                                 }

                                                %>

                                                <div class="col-sm-12" style="margin-top:2%">
                                                    <h5>Your Answer</h5>
                                                </div>
                                                <div class="col-sm-12" style="margin-top:2%">

                                                    <div class="row">
                                                        <div class="col-sm-12">
                                                            <textarea class="form-control" id="comment-answer" rows="10"  style="resize:none" placeholder="Write your answer here..."></textarea>
                                                            <span id="info-comment-answer"></span>
                                                        </div>

                                                    </div>
                                                </div>




                                                <div class="col-sm-12" style="margin-top:2%">
                                                    <button class="btn btn-primary" id="post-answer" rel="<%=question_id%>" rel1="<%=user_name%>">Post Your Answer</button>
                                                </div>
                                                <div class="col-sm-12" style="margin-top:2%">
                                                    <h5>Browse other questions tagged
                                                        <%

                                                            for (int j = 1; j < tag1.length; j++) {

                                                        %>

                                                        <button class="btn btn-info" style="background-color:#E1ECF4;border-color:#E1ECF4"> <a href="#" style="font-size:15px"><%=tag1[j]%></a></button>


                                                        <%
                                                            }
                                                        %>
                                                        or <a href="question.jsp">ask your own question.</a>
                                                    </h5>
                                                </div>
                                            </div>



                                        </div>

                                    </div>
                                </div>
                                <%

                                    } catch (Exception e) {
                                    }



                                %>

                                <!-- Footer Start -->
                                <div class="container-fluid bg-dark text-light">
                                    <div class="row px-xl-5 pt-5">
                                        <div class="col-sm-1">
                                            <img src="logo/768px-Stack_Overflow_icon.svg.png"style="height:70px;margin-top:-20px"/>

                                        </div>
                                        <div class="col-sm-3">
                                            <div class="row">
                                                <div class="col-sm-12">

                                                    <h4 class="mb-4 display-5 font-weight-semi-bold"><span class="text-light font-weight-bold">STACK&nbsp;OVERFLOW</span></h4>

                                                    <p>Question</p>
                                                    <p>Help</p>
                                                </div>

                                            </div>



                                        </div>
                                        <div class="col-lg-8 col-md-12">
                                            <div class="row">
                                                <div class="col-md-4 mb-5">
                                                    <h5 class="font-weight-bold text-light mb-4">Products</h5>
                                                    <div class="d-flex flex-column justify-content-start">
                                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Teams</a>
                                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Advertising</a>
                                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Collective</a>
                                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Talent</a>

                                                    </div>
                                                </div>
                                                <div class="col-md-4 mb-5">
                                                    <h5 class="font-weight-bold text-light mb-4">Company</h5>
                                                    <div class="d-flex flex-column justify-content-start">
                                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>About</a>
                                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Press</a>
                                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Work Here</a>
                                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Legal</a>

                                                        <a class="text-light" href=""><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                                                    </div>
                                                </div>
                                                <div class="col-md-4 mb-5">
                                                    <h5 class="font-weight-bold text-light mb-4">STACK EXCHANGE NETWORK</h5>
                                                    <div class="d-flex flex-column justify-content-start">
                                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Technology</a>
                                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Culture & Recreation</a>
                                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Life & arts</a>
                                                        <a class="text-light mb-2" href=""><i class="fa fa-angle-right mr-2"></i>Professional</a>


                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                </div>








                                <!--login Modal start-->
                                <div class="modal" id="myModal1" >
                                    <div class="modal-dialog">
                                        <div class="modal-content">

                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">Sign in</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <!-- Modal body -->
                                            <div class="modal-body">

                                                <div class="login-form">
                                                    <form action="login.jsp"  method="post">
                                                        <div class="form-group">
                                                            <label>Email:</label>
                                                            <input type="email"  name="email"class="form-control"required="required">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Password:</label>
                                                            <input type="password" name="password" class="form-control" required="required">
                                                        </div>
                                                        <div class="form-group">
                                                            <button type="submit" class="btn btn-info btn-block btn-round"  style="color:white">Log in</button>
                                                        </div>
                                                        <div class="clearfix">
                                                            <label class="float-left form-check-label"><input type="checkbox"> Remember me</label>
                                                            <a href="#" class="float-right" style="color:blue">Forgot Password?</a>
                                                        </div>        
                                                    </form>

                                                </div>

                                            </div>



                                        </div>




                                    </div>
                                </div>

                                <!-- login modal end-->
                                <!--register Modal start-->
                                <div class="modal" id="myModal2" >
                                    <div class="modal-dialog">
                                        <div class="modal-content">

                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">Sign Up</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <!-- Modal body -->
                                            <div class="modal-body">

                                                <div class="login-form">
                                                    <form action="register.jsp"  method="post">
                                                        <div class="form-group">
                                                            <label>Name:</label>
                                                            <input type="name"  name="name" class="form-control"required="required">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Email:</label>
                                                            <input type="email"  name="email" class="form-control"required="required">
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Password:</label>
                                                            <input type="password" name="password" class="form-control" required="required">
                                                        </div>
                                                        <div class="form-group">
                                                            <button type="submit" class="btn btn-primary btn-block btn-round"  style="color:white">Sign Up</button>
                                                        </div>

                                                    </form>

                                                </div>

                                            </div>



                                        </div>




                                    </div>
                                </div>

                                <!-- register modal end-->




                                </body>
                                </html>

                                <%


                                    }


                                %>



