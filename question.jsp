<%-- 
    Document   : question
    Created on : 25 May, 2022, 3:36:14 PM
    Author     : rohit
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    String email = null;
    int permission = 1;
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
            ResultSet rs = st.executeQuery("select * from modal_permission where email='" + email + "'");
            if (rs.next()) {
                permission = rs.getInt("permission");



            } else {
                permission = 1;

            }



        } catch (Exception e) {
        }




%> 
<!DOCTYPE html>
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

            $(document).ready(function() {
                if (<%=permission%> == 1) {
                    $("#query-modal").modal();
                }
                if (<%=permission%> == 0) {
                    $("#query-modal").modal('hide');
                }
                $("#modal-close").on("click", function() {

                    var permission = 0;
                    $.post(
                            "modal_permission.jsp", {permission: permission}, function(data) {
                        if (data.trim() === "success") {
                            $("#query-modal").modal('hide');
                        }
                    }
                    );
                });
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
                $("#Summarize-up").on("click", function() {
                    var rel = $(this).attr("rel");
                    if (rel === "up") {

                        $("#Summarize").show();
                        $("#Summarize-up").attr("class", "fa fa-angle-down");
                        $(this).attr("rel", "down");
                    }
                    else {
                        $("#Summarize").hide();
                        $("#Summarize-up").attr("class", "fa fa-angle-up");
                        $(this).attr("rel", "up");
                    }



                });
                $("#Describe-up").on("click", function() {
                    var rel = $(this).attr("rel");
                    if (rel === "up") {

                        $("#Describe").show();
                        $("#Describe-up").attr("class", "fa fa-angle-down");
                        $(this).attr("rel", "down");
                    }
                    else {
                        $("#Describe").hide();
                        $("#Describe-up").attr("class", "fa fa-angle-up");
                        $(this).attr("rel", "up");
                    }


                });
                $("#code-up").on("click", function() {
                    var rel = $(this).attr("rel");
                    if (rel === "up") {

                        $("#code").show();
                        $("#code-up").attr("class", "fa fa-angle-down");
                        $(this).attr("rel", "down");
                    }
                    else {
                        $("#code").hide();
                        $("#code-up").attr("class", "fa fa-angle-up");
                        $(this).attr("rel", "up");
                    }


                });
                /*$("#reviewyourquestion").on("click", function() {
                 
                 var title = $("#title").val();
                 var tag = $("#tag").val();
                 var about = $("#about").val();
                 if (title.length >= 15 && tag.length > 0 && about.length >= 30) {
                 $("#info-title").html(" ");
                 $("#title").css("border-color", "");
                 $("#info-tag").html(" ");
                 $("#tag").css("border-color", "");
                 $("#info-about").html(" ");
                 $("#about").css("border-color", "");
                 var tag_split = [];
                 tag_split = tag.split(",");
                 var length = tag_split.length - 1;
                 if (length > 5) {
                 
                 
                 $("#tag").css("border-color", "red");
                 $("#info-tag1").html("<span style='color:red'>Please enter no more than 5 tags.</span>");
                 }
                 var v = 1;
                 var store1 = [];
                 var counting;
                 var spc = " ";
                 var set_for_post;
                 
                 if (length <= 5 && length > 1) {
                 
                 
                 $("#tag").css("border-color", " ");
                 $("#info-tag1").html(" ");
                 for (var i = 0; i < tag_split.length - 1; i++) {
                 
                 
                 $.post(
                 "tag_verification.jsp", {tag: tag_split[i]}, function(data) {
                 var check = data.substring(0, data.indexOf("/")).trim();
                 var check_tag;
                 if (check === "yes") {
                 $("#change-button").show();
                 $("#nochange-button").hide();
                 
                 
                 }
                 if (check === "no") {
                 $("#change-button").hide();
                 $("#nochange-button").show();
                 check_tag = data.substring(data.indexOf("/") + 1).trim();
                 v = 0;
                 if (i > 1) {
                 store1 = store1 + check_tag + spc;
                 }
                 else {
                 store1 = store1 + check_tag;
                 }
                 
                 }
                 if (v == 1) {
                 $("#tag").css("border-color", " ");
                 $("#info-tag1").html(" ");
                 $("#tag").attr("rel", 1)
                 }
                 if (v == 0) {
                 
                 $("#tag").css("border-color", "red");
                 $("#tag").attr("rel", 0)
                 $("#info-tag1").html("<span style='color:red'>Creating the new tag" + "  '" + store1 + "' requires at least 1500 reputation. Try something from the existing tags list instead.</span>");
                 }
                 
                 });
                 }
                 
                 }
                 else {
                 $.post(
                 "tag_verification.jsp", {tag: tag}, function(data) {
                 var check = data.substring(0, data.indexOf("/")).trim();
                 var check_tag;
                 if (check === "yes") {
                 $("#change-button").show();
                 $("#nochange-button").hide();
                 }
                 if (check === "no") {
                 $("#change-button").hide();
                 $("#nochange-button").show();
                 check_tag = data.substring(data.indexOf("/") + 1).trim();
                 v = 0;
                 if (i > 1) {
                 store1 = store1 + check_tag + spc;
                 }
                 else {
                 store1 = store1 + check_tag;
                 }
                 
                 }
                 if (v == 1) {
                 $("#tag").css("border-color", " ");
                 $("#info-tag1").html(" ");
                 $("#tag").attr("rel", 1);
                 }
                 if (v == 0) {
                 
                 $("#tag").css("border-color", "red");
                 $("#tag").attr("rel", 0);
                 $("#info-tag1").html("<span style='color:red'>Creating the new tag" + "  '" + store1 + "'requires at least 1500 reputation. Try something from the existing tags list instead.</span>");
                 }
                 
                 });
                 }
                 
                 }
                 
                 if (title.length <= 0) {
                 $("#info-title").html("<span style='color:red'>Title is missing.</span>");
                 $("#title").css("border-color", "red");
                 }
                 if (tag.length <= 0) {
                 $("#info-tag").html("<span style='color:red'>Please enter at least one tag</span>");
                 $("#title").css("border-color", "red");
                 }
                 if (about.length <= 0) {
                 $("#info-about").html("<span style='color:red'>Body is missing.</span>");
                 $("#about").css("border-color", "red");
                 }
                 if (about.length > 0 && about.length < 30) {
                 
                 $("#info-about").html("<span style='color:red'>Body must contain at least 30 characters you enter only " + about.length + "</span>");
                 $("#about").css("border-color", "red");
                 }
                 if (about.length >= 30) {
                 
                 $("#info-about").html("");
                 $("#about").css("border-color", "");
                 }
                 if (title.length >= 15) {
                 $("#info-title").html(" ");
                 $("#title").css("border-color", "");
                 }
                 if (title.length < 15 && title.length > 0) {
                 $("#info-title").html("<span style='color:red'>Title must be at least 15 characters you enter only " + title.length + "</span>");
                 $("#title").css("border-color", "red");
                 }
                 if (tag.length > 0) {
                 $("#info-tag").html(" ");
                 $("#title").css("border-color", "");
                 }
                 
                 
                 
                 });*/
                /* $("#tag").keyup(function() {
                 
                 var keyword = [];
                 var check_keyword = [];
                 var verify_keyword = [];
                 //$("#list_tag").show();
                 keyword = $(this).val();
                 check_keyword = $(this).val();
                 if (keyword.length > 0) {
                 for (var i = 0; i < keyword.length; i++) {
                 
                 if (keyword[i] === " ") {
                 
                 var store = keyword.trim();
                 $("#tag").val(store);
                 }
                 if (check_keyword[i] === ",") {
                 verify_keyword = check_keyword.split(",");
                 }
                 
                 
                 
                 $.post(
                 "tag_finder.jsp", {keyword: keyword}, function(data) {
                 //$("#show-tag").html(data.trim());
                 $(".none").on("click", function() {
                 
                 var tag = $(this).text();
                 var flag = 0;
                 var tag1 = [];
                 var index;
                 tag1 = $("#tag").val();
                 for (var i = 0; i < tag1.length; i++) {
                 if (tag1[i] === ",") {
                 flag = 1;
                 index = i;
                 }
                 }
                 if (flag == 1) {
                 var tag2 = [];
                 for (var i = 0; i <= index; i++) {
                 tag2 = tag2 + tag1[i];
                 }
                 tag2 = tag2 + tag;
                 $("#tag").val(tag2 + ",");
                 }
                 else {
                 
                 $("#tag").val(tag + ",");
                 }
                 });
                 }
                 
                 );
                 }
                 
                 
                 }
                 });*/

                $("#reviewforquestion").on("click", function() {

                    var title = $("#title").val();

                    var about = $("#about").val();
                    var val = [];
                    var tag = [];
                    tag = $("#tag").val();
                    


                    if (title.length >= 15 && about.length >= 30 && tag.length > 0) {
                        $("#info-title").html(" ");
                        $("#title").css("border-color", "");
                        $("#info-tag").html(" ");
                        $("#tag").css("border-color", "");
                        $("#info-about").html(" ");
                        $("#about").css("border-color", "");
                        $.post(
                            
                               "title_verfication.jsp",{title:title},function(data){
                               
                                   
                               
                               if(data.trim()==="yes"){
                                    $("#info-title").html(" ");
                                    $("#title").css("border-color", "");
                                    $("#similar_question_list").html(" ");
                              
                     

                        for (var i = 0; i < tag.length; i++) {
                            if (tag[i] === " ") {
                                $("#info-tag").html("<span style='color:red'>Space is't allowed here</span>");
                                $("#tag").css("border-color", "red");
                                $("#tag").val("");

                            }
                            if (tag[i] === "@") {
                                $("#info-tag").html("<span style='color:red'>@ is't allowed here</span>");
                                $("#tag").css("border-color", "red");
                                $("#tag").val("");
                            }
                            if (tag[i] === "-") {
                                $("#info-tag").html("<span style='color:red'>- is't allowed here</span>");
                                $("#tag").css("border-color", "red");
                                $("#tag").val("");
                            }
                            if (tag[i] === "$") {
                                $("#info-tag").html("<span style='color:red'>-$is't allowed here</span>");
                                $("#tag").css("border-color", "red");
                                $("#tag").val("");
                            }
                            if (tag[i] === "!") {
                                $("#info-tag").html("<span style='color:red'>!is't allowed here</span>");
                                $("#tag").css("border-color", "red");
                                $("#tag").val("");
                            }
                            if (tag[i] === "&") {
                                $("#info-tag").html("<span style='color:red'>&is't allowed here</span>");
                                $("#tag").css("border-color", "red");
                                $("#tag").val("");
                            }
                            if (tag[i] === "%") {
                                $("#info-tag").html("<span style='color:red'>&is't allowed here</span>");
                                $("#tag").css("border-color", "red");
                                $("#tag").val("");
                            }
                            if (tag[i] === ",") {
                                $("#info-tag").html("<span style='color:red'>,is't allowed here</span>");
                                $("#tag").css("border-color", "red");
                                $("#tag").val("");
                            }
                            if (tag[i] != " ") {
                                $("#info-tag").html(" ");
                                $("#tag").css("border-color", "");

                            }

                            if (tag[i] != " ") {
                                $("#info-tag").html(" ");
                                $("#tag").css("border-color", "");

                            }
                        }
                        $.post(
                            
                          "tag_verification.jsp",{tag:tag},function(data){
                           
                           if(data.trim()==="true"){
                                 $("#reviewforquestion").hide();
                                 $("#change-button").show();
                                 $("#info-tag").html("");
                                $("#tag").css("border-color", "");
                               
                           }
                           else{
                               
                                $("#info-tag").html("<span stle='color:red'Creating the new tag requires at least 1500 reputation. Try something from the existing tags list instead.");
                                $("#tag").css("border-color", "red");
                               
                           }
                      
                               
                      
                          }
                
                        );
                             }
                             if(data.trim()!="yes"){
                                   $("#info-title").html("<span style='color:red'>A question with that title already exists; please be more specific.</span>");
                                    $("#title").css("border-color", "red");
                                    $("#similar_question_list").html(data);
                                    
                                 
                                 
                             }
                           
                           
                               }
                       );
                
                
                




                    }

                    if (title.length <= 0) {
                        $("#info-title").html("<span style='color:red'>Title is missing.</span>");
                        $("#title").css("border-color", "red");
                    }
                    if (tag.length <= 0) {

                        $("#info-tag").html("<span style='color:red'>Please enter at least one tag.</span>");
                        $("#tag").css("border-color", "red");
                    }

                    if (about.length <= 0) {
                        $("#info-about").html("<span style='color:red'>Body is missing.</span>");
                        $("#about").css("border-color", "red");
                    }
                    if (about.length > 0 && about.length < 30) {

                        $("#info-about").html("<span style='color:red'>Body must contain at least 30 characters you enter only " + about.length + "</span>");
                        $("#about").css("border-color", "red");
                    }
                    if (about.length >= 30) {

                        $("#info-about").html("");
                        $("#about").css("border-color", "");
                    }
                    if (title.length >= 15) {
                        $("#info-title").html(" ");
                        $("#title").css("border-color", "");
                    }
                    if (title.length < 15 && title.length > 0) {
                        $("#info-title").html("<span style='color:red'>Title must be at least 15 characters you enter only " + title.length + "</span>");
                        $("#title").css("border-color", "red");
                    }

                });
                $("#tag").keyup(function() {
                    var val = [];
                    var tag = [];
                    tag = $(this).val();

                    for (var i = 0; i < tag.length; i++) {
                        if((tag[0]!="#")){
                             $("#info-tag1").html("<span style='color:red'>Each tag must satart with '#'</span>");
                             $("#tag").css("border-color", "red");
                             $("#tag").val("");
                        }
                        if((tag[0]==="#")){
                             $("#info-tag1").html("");
                             $("#tag").css("border-color", "");
                            
                        }
                        if (tag[i] === " ") {
                            $("#info-tag").html("<span style='color:red'>Space is't allowed here</span>");
                            $("#tag").css("border-color", "red");
                            $("#tag").val("");
                        }
                        if (tag[i] === "@") {
                            $("#info-tag").html("<span style='color:red'>@ is't allowed here</span>");
                            $("#tag").css("border-color", "red");
                            $("#tag").val("");
                        }
                        if (tag[i] === "-") {
                            $("#info-tag").html("<span style='color:red'>- is't allowed here</span>");
                            $("#tag").css("border-color", "red");
                            $("#tag").val("");
                        }
                        if (tag[i] === "$") {
                            $("#info-tag").html("<span style='color:red'>-$is't allowed here</span>");
                            $("#tag").css("border-color", "red");
                            $("#tag").val("");
                        }
                        if (tag[i] === "!") {
                            $("#info-tag").html("<span style='color:red'>!is't allowed here</span>");
                            $("#tag").css("border-color", "red");
                            $("#tag").val("");
                        }
                        if (tag[i] === "&") {
                            $("#info-tag").html("<span style='color:red'>&is't allowed here</span>");
                            $("#tag").css("border-color", "red");
                            $("#tag").val("");
                        }
                        if (tag[i] === "%") {
                            $("#info-tag").html("<span style='color:red'>&is't allowed here</span>");
                            $("#tag").css("border-color", "red");
                            $("#tag").val("");
                        }
                        if (tag[i] === ",") {
                            $("#info-tag").html("<span style='color:red'>,is't allowed here</span>");
                            $("#tag").css("border-color", "red");
                            $("#tag").val("");
                        }
                        if (tag[i] != " ") {
                            $("#info-tag").html(" ");
                            $("#tag").css("border-color", "");

                        }


                    }


                });
            });

        </script>
        <style>
            #card1{


                box-shadow:1px 1px 5px rgba(0,0, 0, 0.4);
                background-color:#F1F2F4;
                height:200px;
                display:none;
            } 
            #Summarize{
                display:none;
            }
            #Describe{
                display: none;
            }
            #code{
                display: none;
            }
            #store-tag{
                display:none;
            }
            #change-button{
                display:none;
            }
            @media only screen and (max-width:500px) {
  /* For mobile phones: */
  #card-Draft{
      display:none;
  }
  #search_bar{
     margin-left:30px;
     
  } 
  
  #logo-img{
      display:none;
  }
  #navbar_nav-1{
      display:inline-block;
      margin-right:300px;
      margin-bottom:-80px;
  }
  #link-2{
      display:none;
  }
  #profile{
      display:none;
  }
  
 
  
}

        </style>
    </head>

    <body style="background-color:#F1F2F4">
        <nav class="navbar navbar-expand-sm bg-light navbar-dark sticky-top" id="card">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <ul class="navbar-nav" id="navbar_nav-1">

                <div class="nav-item dropdown">
                    <a  style="cursor:pointer;font-size:20px" data-toggle="dropdown">
                        <i class="fa fa-reorder" id="reorder"></i></a>
                    <div class="dropdown-menu position-absolute"   id="card"style="margin-right:-300px;margin-top:13px">
                        <div class="row" >
                            <div class="col-sm-12" style="margin-top:2%">
                                <a href="dashboard.jsp" class="dropdown-item">

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
               

            </ul>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a  href="dashboard.jsp"class="navbar-brand" ><img src="logo/0_stack_overflow_logo.jpg"style="height:30px;margin-top:-20px" id="logo-img"/></a>
            &nbsp;&nbsp;
            <ul class="navbar-nav">

                &nbsp;<li class="nav-item">
                    <a class="nav-link" id="link-2" href="#">Product</a>


            </ul>&nbsp;
            <div class="input-group mb-0">

                <input type="text" class="form-control" id="search_bar" placeholder="search..." aria-label="search" aria-describedby="basic-addon1">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1"><i class="fa fa-search"></i></span>
                </div>
            </div>
            <ul class="navbar-nav">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li class="nav-item">
                    <div class="nav-item dropdown" id="profile">
                        <a  href="user.jsp"style="cursor:pointer;font-size:20px" >
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



        <div class="container-fluid" >
            <div class="row"  style="margin-top:2%">
                <div class="col-sm-4">
                    <h3>Ask a public question</h3>
                </div>
                <div class="col-sm-8">
                    <img src="logo/graphic-pricing-top.svg">
                </div>

            </div>
            <div class="row"  >
                <div class="col-sm-1">

                </div>
                <div class="col-sm-7" >
                    <form method="post" action="post_question.jsp">
                        <div class="row" id="card-for-question" style="background-color:white" style="margin-top:2%">
                            <div class="col-sm-12"style="margin-top:2%">
                                <h5>Title</h5>
                            </div>
                            <div class="col-sm-12">
                                <span>Be specific and imagine you’re asking a question to another person</span>
                            </div>
                            <div class="col-sm-12">
                                <input type="text" name="title"  id="title"class="form-control" placeholder="e.g. Is there an R function for finding index of an element of a vector">
                                <span id="info-title"></span>
                            </div>
                            <div class="col-sm-12" style="margin-top:2%">
                                <section id="similar_question_list">
                                
                            </section>
                            </div>
                            

                            <div class="col-sm-12" style="margin-top:2%">
                                <h5>Body</h5>
                            </div>
                            <div class="col-sm-12">
                                <span>Include all the information someone would need to answer your question</span>
                            </div>
                            <div class="col-sm-12">
                                <textarea rows="10" class="form-control"  name="about" id="about"style="resize:none"></textarea>
                                <span id="info-about"></span>
                            </div>
                            <div class="col-sm-12" style="margin-top:2%">
                                <h5>Tags</h5>
                            </div>
                            <div class="col-sm-12">
                                <span>Add up to 5 tags to describe what your question is about</span>
                            </div>
                            <div class="col-sm-12">
                                <input type="text" name="tag" id="tag"  class="form-control" placeholder="e.g. (#c#html#php)">
                                <span id="info-tag"></span>
                                 <span id="info-tag1"></span>
                            </div>





                            <div class="col-sm-12" style="margin-top:5%">

                            </div>


                            <!--<div class="row" style="margin-top:5%">
                                <div class="col-sm-12">
                                    <button class="btn btn-primary">Review your question</button>
                                </div>
                            </div>-->
                        </div>
                        <div class="row" style="margin-top:1%">

                            <div class="col-sm-4" >
                                <button class="btn btn-info btn-block py-2" id="change-button"  >Post</button>
                                <input type="button" class="btn btn-primary btn-block py-2"  id="reviewforquestion"value="Review your question" >
                            </div>
                            <div class="col-sm-8" ></div>
                        </div>
                        <div class="row" style="margin-top:5%">

                        </div>
                    </form>
                </div>

                <div class="col-sm-3" id="card-Draft" >
                    <div class="row" style="background-color:#F8F6F6;height:70px" >
                        <div class="col-sm-12" >
                            <h4 style="margin-top:20px">Step 1: Draft your question</h4>
                        </div>
                    </div>
                    <div class="row"  style="background-color:white;">
                        <div class="col-sm-12"style="height:20px" ></div>
                        <div class="col-sm-12" >
                            <span>The community is here to help you with specific coding, algorithm, or language problems.</span>
                        </div>
                        <div class="col-sm-12"style="height:20px" ></div>
                        <div class="col-sm-12" >
                            <span>Avoid asking opinion-based questions.</span>
                        </div>
                        <div class="col-sm-12"style="height:20px" ></div>
                        <div class="col-sm-12" >
                            <div class="row">

                                <div class="col-sm-10">
                                    <b><span style="color:blueviolet">1.</span><span>Summarize the problem</span></b>
                                </div>
                                <div class="col-sm-2">
                                    <i class="fa fa-angle-up"  id="Summarize-up" rel="up"style="font-size:20px;cursor:pointer"></i>
                                </div>

                                <div class="col-sm-12" id="Summarize">
                                    <li>Include details about your goal</li>
                                    <li>Describe expected and actual results</li>
                                    <li>Include any error messages</li>
                                </div>
                            </div>
                            <div class="row" style="margin-top:2%">

                                <div class="col-sm-10">
                                    <b> <span style="color:blueviolet">2.</span><span>Describe what you’ve tried</span></b>
                                </div>
                                <div class="col-sm-2">
                                    <i class="fa fa-angle-up"id="Describe-up" rel="up" style="font-size:20px;cursor:pointer"></i>
                                </div>

                                <div class="col-sm-12" id="Describe">
                                    <p>Show what you’ve tried and tell us what you found (on this site or elsewhere) and why it didn’t meet your needs. You can get better answers when you provide research.</p>
                                </div>
                            </div>
                            <div class="row" style="margin-top:2%">

                                <div class="col-sm-10">
                                    <b> <span style="color:blueviolet">3.</span><span>Show some code</span></b>
                                </div>
                                <div class="col-sm-2">
                                    <i class="fa fa-angle-up"  id="code-up" rel="up"style="font-size:20px;cursor:pointer"></i>
                                </div>

                                <div class="col-sm-12" id="code">
                                    <p>When appropriate, share the minimum amount of code others need to reproduce your problem </p>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>


        <!-- query modal satrt-->
        <div class="modal" id="query-modal" >
            <div class="modal-dialog">
                <div class="modal-content" style="margin-top:19%">

                    <!-- Modal Header 
                    <div class="modal-header">
                        <h4 class="modal-title">Sign in</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    -->
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row" style="margin-top:2%">
                                <div class="col-sm-12">
                                    <h3>Asking a good question</h3>
                                </div>
                                <div class="col-sm-12" style="height:40px"></div>
                                <div class="col-sm-12">
                                    <h6>You’re ready to ask your first programming-related question and the community is here to help! To get you the best answers, we’ve provided some guidance:</h6>
                                </div>
                                <div class="col-sm-12" style="height:40px"></div>
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-sm-1">
                                            <h4 style="color:blueviolet">1.</h4>
                                        </div>
                                        <div class="col-sm-11">
                                            <h5>Summarize the problem</h5>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-1">
                                            <h4 style="color:blueviolet">2.</h4>
                                        </div>
                                        <div class="col-sm-11">
                                            <h5>Describe what you’ve tried</h5>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-1">
                                            <h4 style="color:blueviolet">3.</h4>
                                        </div>
                                        <div class="col-sm-11">
                                            <h5>When appropriate,show some code</h5>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-12" style="height:40px"></div>
                                <div class="col-sm-6">
                                    <button class="btn btn-primary" class="close" data-dismiss="modal">Start Writing</button>
                                </div>
                                <div class="col-sm-6">
                                    <a  style="float:right;color:red;cursor:pointer" id="modal-close" >Don't show me this again</a>
                                </div>
                            </div>

                        </div>

                    </div>



                </div>




            </div>
        </div>
        <!-- query mmodal end-->



        <%    }
    else {

                %>
                <html>
    <head>
        <title>Login to ask question-stack overflow</title>
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
            $(".fa.fa-reorder").on("click", function() {
                    var id = $(this).attr("id");
                    alert(id);
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
            
            </script>
    </head>
           <body style=" background-color:#F1F2F4;">
                <nav class="navbar navbar-expand-sm bg-light navbar-dark sticky-top" id="card">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <ul class="navbar-nav">
 
                 <div class="nav-item dropdown">
                     <a  style="cursor:pointer;font-size:20px" data-toggle="dropdown">
                         <i class="fa fa-reorder" id="reorder"></i></a>
                     <div class="dropdown-menu position-absolute"   id="card"style="margin-right:-300px;margin-top:13px">
                         <div class="row" >
                             <div class="col-sm-12" style="margin-top:2%">
                                 <a href="index.jsp" class="dropdown-item">
                                    
                                     <span>Home</span>
                                 </a>
                             </div>
                             <div class="col-sm-12" style="margin-top:2%">
                                 <a  href="index.jsp" class="dropdown-item">
                                    
                                     <span>Public</span>
                                 </a>
                             </div>
                            
                             <div class="col-sm-12" style="margin-top:2%">
                                 <a  href="index.jsp" class="dropdown-item">
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
 
             </ul> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       
            <a class="navbar-brand" href="index.jsp"><img src="logo/0_stack_overflow_logo.jpg"style="height:30px;margin-top:-20px"/></a>
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
               <div class="container-fluid" >
                   <div class="row" style="margin-top:5%;height:150px">
                       <div class="col-sm-4">
                           
                       </div>
                       <div class="col-sm-4 card" style=" background-color:#FBF3D5;">
                           <div class="row">
                               <div class="col-sm-12" style="margin-top:10%">
                                   <span>You must be logged in to ask a question on Stack Overflow</span>
                                   
                               </div>
                               <div class="col-sm-12">
                                   <center><span>Log in below or <a href data-toggle="modal" data-target="#myModal2">sign up</a></span></center>
                                   
                               </div>
                           </div>
                           
                       </div>
                       <div class="col-sm-4">
                           
                       </div>
                   </div>
                    <div class="row" style="margin-top:3%;margin-bottom:0px;">
                        <div class="col-sm-4">
                            
                        </div>
                        <div class="col-sm-4">
                           
                        </div>
                        <div class="col-sm-4">
                            
                        </div>
                    </div>
                   <div class="row" style="height:300px">
                       <div class="col-sm-4">
                           
                       </div>
                       <div class="col-sm-4 card">
                           <div class="row" style="margin-top:1%">
                               <div class="col-sm-12">
                               <center><img src="logo/0_stack_overflow_logo.jpg"style="height:30px;"/></center>
                            <div class="login-form">
                            <form action="login.jsp"  method="post">
                                <div class="form-group" style="margin-top:3%">
                                    <label>Email:</label>
                                    <input type="email"  name="email"class="form-control"required="required">
                                </div>
                                <div class="form-group" style="margin-top:3%">
                                    <label>Password:</label>
                                    <input type="password" name="password" class="form-control" required="required">
                                </div>
                                <div class="form-group" style="margin-top:3%">
                                    <button type="submit" class="btn btn-primary btn-block btn-round"  style="color:white">Log in</button>
                                </div>
                                      
                            </form>

                        </div>
                                        
                               </div>
                           </div>
                       </div>
                       <div class="col-sm-4">
                           
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
                
                
                
                
                
                <%
            }


        %>

    </body>
</html>
