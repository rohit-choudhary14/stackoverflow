<%-- 
    Document   : user
    Created on : 4 Jun, 2022, 12:52:31 AM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    String email = null;
    String user_name = "";
    Cookie c[] = request.getCookies();
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("user")) {
            email = c[i].getValue();
        }

    }
    if (email != null) {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select name from user where email='" + email + "'");
            if (rs.next()) {
                user_name = rs.getString("name");
            }
        } catch (Exception e) {
        }

%>
<!DOCTYPE html>
<html>
    <head>
        <title>User <%=user_name%>-Stackoverflow</title> 
        <link href="logo/download.png" rel="icon">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap CSS -->
        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
       
        <link href="css/style.css" rel="stylesheet">
        <script>
            $(document).ready(function() {
                $(".btn.btn-danger").on("click", function() {

                    $("#set_name_user").hide();
                    $("#input_name").show();
                    $("#save-changes").show();
                    $("#edit-profile").hide();
                    $("#logout").hide();

                });
                $(".btn.btn-default").on("click", function() {
                    $("#set_name_user").show();
                    $("#input_name").hide();
                    $("#save-changes").hide();
                    $("#edit-profile").show();
                    $("#logout").show();

                });
                $("#save-changes").on("click", function() {
                    var name = $("#input_name").val();
                    $.post(
                            "update_profile.jsp", {name: name}, function(data) {
                        if (data.trim() === "success") {
                            $("#set_name_user").show();
                            $("#input_name").hide();
                            $("#save-changes").hide();
                            $("#edit-profile").show();
                            $("#logout").show();
                            $("#set_name_user").text(name);
                        }
                    });



                });
                $(".btn.btn-secondary").on("click", function() {
                    var rel = $(this).attr("rel");
                    $("#edit_question-" + rel).show();
                    $("#edit_title-" + rel).hide();
                    $("#edit_button_secondary-" + rel).hide();
                    $("#edit_button_primary-" + rel).show();
                    $("#edit_button_cancel-" + rel).show();
                });
                $(".view").on("click", function() {
                    var rel = $(this).attr("rel");
                    $("#edit_question-" + rel).hide();
                    $("#edit_title-" + rel).show();
                    $("#edit_button_secondary-" + rel).show();
                    $("#edit_button_primary-" + rel).hide();
                    $("#edit_button_cancel-" + rel).hide();
                });
                $(".view1").on("click", function() {

                    var question_id = $(this).attr("rel");
                    var rel = $(this).attr("rel1");
                    var title = $("#title-" + rel).val();

                    if (title.length > 15) {
                        $("#edit_info-" + rel).html(" ");
                        $.post(
                                "update_question.jsp", {question_id: question_id, title: title}, function(data) {
                            if (data.trim() === "success") {
                                $("#edit_question-" + rel).hide();
                                $("#show_title-" + rel).text(title);
                                $("#edit_title-" + rel).show();
                                $("#edit_button_secondary-" + rel).show();
                                $("#edit_button_primary-" + rel).hide();
                                $("#edit_button_cancel-" + rel).hide();

                            }

                        }


                        );

                    }
                    if (title.length < 15) {
                        $("#edit_info-" + rel).html("<span style='color:red'>Title must be at least 15 character you enter only" + title.length + "</span>");

                    }
                });
                $(".btn.btn-dark").on("click", function() {
                    var rel = $(this).attr("rel");
                    $("#answer_edit-" + rel).show();
                    $("#edit_answer-" + rel).hide();
                    $("#answer_button_dark-" + rel).hide();
                    $("#answer_button_primary-" + rel).show();
                    $("#answer_button_cancel-" + rel).show();
                });
                $(".view2").on("click", function() {
                    var rel = $(this).attr("rel");
                    $("#answer_edit-" + rel).hide();
                    $("#edit_answer-" + rel).show();
                    $("#answer_button_dark-" + rel).show();
                    $("#answer_button_primary-" + rel).hide();
                    $("#answer_button_cancel-" + rel).hide();
                });
                $(".view3").on("click", function() {

                    var comment_id = $(this).attr("rel");
                    var rel = $(this).attr("rel1");
                    var answer = $("#answer-" + rel).val();

                    
                    $.post(
                            "update_comment.jsp", {comment_id: comment_id, answer: answer}, function(data) {



                        if (data.trim() === "success") {

                            $("#show_answer-" + rel).text(answer);
                            $("#answer_edit-" + rel).hide();
                            $("#edit_answer-" + rel).show();
                            $("#answer_button_dark-" + rel).show();
                            $("#answer_button_primary-" + rel).hide();
                            $("#answer_button_cancel-" + rel).hide();
                        }

                    }



                    );
                }
                );
                $("#modal_hide").on("click",function(){
                    $("#logout_modal").modal('hide');
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
            #create-custom-filter{
                cursor: pointer;
                color:blue;

            }
            #input_name{
                display:none;
            }
            #save-changes{
                display:none;
            }
        </style>
    </head>
    <body >
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
            <a class="navbar-brand" href=""><img src="logo/0_stack_overflow_logo.jpg"style="height:30px;margin-top:-20px"/></a>
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
            </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="user.jsp" style="cursor:pointer;font-size:20px" >
                <img src="logo/244563b95ff22a5cc309cea450ba1922.png"style="height:30px"></a>
            <!-- <ul class="navbar-nav">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li class="nav-item">
                     <div class="nav-item dropdown">
                         <a  style="cursor:pointer;font-size:20px" data-toggle="dropdown">
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
            <!--<a class="nav-link" style="color:black" href="#">Login</a>

        </li>

    </ul> -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        </nav>



        <div class="container-fluid">
            <div class="row" >

                <div class="col-sm-2 card"  >
                    <div class="row" >
                        <section id="top-bar-fixed">
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

                    String name = "";
                    int answer_count = 0;
                    int question_count = 0;
                    try {

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
                        Statement st = cn.createStatement();
                        Statement st1 = cn.createStatement();
                        Statement st2 = cn.createStatement();
                        Statement st3 = cn.createStatement();
                        Statement st4 = cn.createStatement();
                        ResultSet rs = st.executeQuery("select name from user where email='" + email + "'");
                        if (rs.next()) {
                            name = rs.getString(1);
                        }












                %>
                <div class="col-sm-10" >
                    <div class="row" style="margin-top:2%">
                        <div class="col-sm-2">
                            <img src="logo/244563b95ff22a5cc309cea450ba1922.png"style="height:130px" class="img-fluid">


                        </div>
                        <div class="col-sm-4">
                            <div class="row">
                                <div class="col-sm-12" >
                                    <input type="text" class="form-control"  name="user"id="input_name" value="<%=name%>">

                                </div>
                                <div class="col-sm-12" >

                                    <h2 id="set_name_user"><%=name%></h2>
                                </div>
                                <div class="col-sm-6" style="margin-top:2%" id="edit-profile">
                                    <button class="btn btn-danger btn-block"><i class="fa fa-edit">&nbsp;&nbsp;Edit Profile</i></button>

                                </div>
                                <div class="col-sm-6" style="margin-top:2%" id="logout" >
                                    <button class="btn btn-info btn-block" data-toggle="modal" data-target="#logout_modal"><i class="fa fa-sign-out">&nbsp;&nbsp;logout</i></button>

                                </div>
                                <div class="col-sm-12" style="margin-top:2%" id="save-changes">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <button class="btn btn-primary btn-block">Save Changes</button>
                                        </div>
                                        <div class="col-sm-6">
                                            
                                            <button class="btn btn-default btn-block">Cancel</button>
                                        </div>

                                    </div>
                                </div>

                            </div>


                        </div>
                        <div class="col-sm-6">

                        </div>
                    </div>
                    <div class="row" style="margin-top:10%;margin-bottom:10%">
                        <div class="col-sm-2">

                        </div>
                        <div class="col-sm-10">
                            <div class="row">
                                <div class="col-sm-5">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h3>ANSWER</h3>
                                        </div>
                                        <%

                                            ResultSet rs1 = st1.executeQuery("select count(*) from answer where email='" + email + "'");
                                            if (rs1.next()) {
                                                answer_count = rs1.getInt(1);
                                        %>
                                        <div class="col-sm-12 card" style="height:100px">
                                            <%
                                                if (answer_count > 0) {




                                            %>
                                            <div class="row" style="margin-top:10%">
                                                <div class="col-sm-12">
                                                    You have answer <a  href data-toggle="modal" data-target="#answer_modal" style="cursor:pointer"><%=answer_count%></a> questions
                                                </div>
                                            </div>


                                            <%
                                            } else {
                                            %>
                                            <div class="row" style="margin-top:10%">
                                                <div class="col-sm-12">
                                                    You have not answered any questions
                                                </div>
                                            </div>


                                            <%                                                }



                                            %>

                                        </div>



                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="col-sm-1">

                                </div>
                                <div class="col-sm-5">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h3>QUESTION</h3>
                                        </div>
                                        <%
                                            ResultSet rs2 = st2.executeQuery("select count(*) from question where email='" + email + "'");
                                            if (rs2.next()) {

                                                question_count = rs2.getInt(1);

                                        %>
                                        <div class="col-sm-12 card" style="height:100px">
                                            <div class="row" style="margin-top:10%">
                                                <%

                                                    if (question_count > 0) {

                                                %>
                                                <div class="col-sm-12">
                                                    You have asked <a  href data-toggle="modal" data-target="#question_modal" style="cursor:pointer"><%=question_count%></a> questions
                                                </div>

                                                <%
                                                } else {
                                                %>

                                                <div class="col-sm-12">
                                                    You have not asked any questions
                                                </div>

                                                <%                                                        }
                                                    }

                                                %>
                                            </div>

                                        </div>
                                        <%

                                        %>

                                    </div>
                                </div>
                                <div class="col-sm-1">

                                </div>
                            </div>
                        </div>
                    </div>






                </div>
            </div>
        </div>

        <!-- question modal start-->
        <div class="modal" id="question_modal" >
            <div class="modal-dialog">
                <div class="modal-content" style="margin-left:-150px;width:150%">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">All questions</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row" style="overflow:scroll;">

                                <%
                                    String title = "";
                                    int sn = 1;
                                    int flag = 0;
                                    String question_id = "";
                                    ResultSet rs3 = st3.executeQuery("select * from question where email='" + email + "'");
                                    while (rs3.next()) {
                                        title = rs3.getString("title");
                                        flag = 1;
                                        question_id = rs3.getString("question_id");
                                %>

                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-sm-12" id="edit_title-<%=sn%>" >
                                            <h3 id="show_title-<%=sn%>"><%=title%></h3>
                                        </div>
                                        <div class="col-sm-12" id="edit_question-<%=sn%>" style="display:none;margin-top:2%">
                                            <textarea name="title" style="resize:none" class="form-control" id="title-<%=sn%>"><%=title%></textarea>

                                        </div>
                                        <div class="col-sm-12" id="edit_info-<%=sn%>" >

                                        </div>
                                        <div class="col-sm-12" id="edit_button_secondary-<%=sn%>">
                                            <button class="btn btn-secondary"  rel="<%=sn%>" style="float:right"><i class="fa fa-edit">&nbsp;&nbsp;Edit</i></button>

                                        </div>
                                        <div class="col-sm-6" id="edit_button_primary-<%=sn%>" style="display:none;margin-top:2%" >
                                            <a class="view1" rel="<%=question_id%>" rel1="<%=sn%>"><button class="btn btn-primary" >Save Changes</button></a>

                                        </div>
                                        <div class="col-sm-6" id="edit_button_cancel-<%=sn%>"style="display:none;margin-top:2%">
                                            <a style="cursor:pointer;float:right" class="view"rel="<%=sn%>" >Cancel</a>

                                        </div>
                                        <div class="col-sm-12" style="height:10px">

                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-12" style="height:1px;background-color:gray">

                                </div>
                                <div class="col-sm-12" style="height:20px">

                                </div>


                                <%
                                        sn++;
                                    }
                                %>

                            </div>
                        </div>

                    </div>



                </div>




            </div>
        </div>
        <!---question modal end-->



        <!--answer modal start-->

        <div class="modal" id="answer_modal" >
            <div class="modal-dialog">
                <div class="modal-content" style="margin-left:-150px;width:150%">

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">All questions</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row" style="overflow:scroll;">

                                <%

                                    String answer = "";
                                    String comment_id = "";
                                    int sn1 = 1;
                                    ResultSet rs4 = st4.executeQuery("select * from answer where email='" + email + "'");
                                    while (rs4.next()) {
                                        answer = rs4.getString("comment");
                                        comment_id = rs4.getString("answer_id");

                                %>



                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-sm-12" id="edit_answer-<%=sn1%>" >
                                            <h3 id="show_answer-<%=sn1%>"><%=answer%></h3>
                                        </div>
                                        <div class="col-sm-12" id="answer_edit-<%=sn1%>" style="display:none;margin-top:2%">
                                            <textarea name="answer" style="resize:none" class="form-control" id="answer-<%=sn1%>"><%=answer%></textarea>

                                        </div>
                                        <div class="col-sm-12" id="edit_info-<%=sn1%>" >

                                        </div>
                                        <div class="col-sm-12" id="answer_button_dark-<%=sn1%>">
                                            <button class="btn btn-dark"  rel="<%=sn1%>" style="float:right"><i class="fa fa-edit">&nbsp;&nbsp;Edit</i></button>

                                        </div>
                                        <div class="col-sm-6" id="answer_button_primary-<%=sn1%>" style="display:none;margin-top:2%" >
                                            <a class="view3" rel="<%=comment_id%>" rel1="<%=sn1%>"><button class="btn btn-primary" >Save Changes</button></a>

                                        </div>
                                        <div class="col-sm-6" id="answer_button_cancel-<%=sn1%>"style="display:none;margin-top:2%">
                                            <a style="cursor:pointer;float:right" class="view2"rel="<%=sn1%>" >Cancel</a>

                                        </div>
                                        <div class="col-sm-12" style="height:10px">

                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-12" style="height:1px;background-color:gray">

                                </div>
                                <div class="col-sm-12" style="height:20px">

                                </div>






                                <!--   <div class="col-sm-12">
                                       <div class="row">
                                           <div class="col-sm-12">
                                               <h3><%=answer%></h3>
                                           </div>
                                           <div class="col-sm-12">
                                               <button class="btn btn-dark" style="float:right"><i class="fa fa-edit">&nbsp;&nbsp;Edit</i></button>
   
                                           </div>
                                           <div class="col-sm-12" style="height:10px">
   
                                           </div>
                                       </div>
   
                                   </div>
                                   <div class="col-sm-12" style="height:1px;background-color:gray">
   
                                   </div>
                                   <div class="col-sm-12" style="height:20px">
   
                                   </div>-->


                                <%
                                        sn1++;
                                    }
                                %>

                            </div>
                        </div>

                    </div>



                </div>




            </div>
        </div>
        <!--- answer modal end-->





        <%


            } catch (Exception e) {
            }



        %>
<div class="modal" id="logout_modal" >
            <div class="modal-dialog">
                <div class="modal-content"style="margin-top:30%">

                   
                    <!-- Modal body -->
                    <div class="modal-body" >

                        <div class="login-form">
                            <div class="container-fluid">
                                <div class="row">
                                
                                    <div class="col-sm-12">
                                        <h3>Are you sure you want to logout ?<h3>
                                        
                                    </div>
                                    <div class="col-sm-12" style="height:40px">
                                       
                                    </div>
                                    <div class="col-sm-6" >
                                        <a href="logout.jsp"><button class="btn btn-warning btn-block py-2">Logout</button></a>
                                    </div>
                                     <div class="col-sm-6" >
                                         <input type="button"  class="btn-block"value="cancel" style="height:40px"id="modal_hide" >
                                    </div>
                            </div>
                            </div>
                            
                           
                        </div>

                    </div>



                </div>




            </div>
        </div>

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



        <%    } else {

                response.sendRedirect("index.jsp");
            }


        %>


    </body>
</html>
