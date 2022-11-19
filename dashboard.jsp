<%-- 
    Document   : dashboard
    Created on : 23 May, 2022, 11:36:57 PM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    String email = null;
    Cookie c[] = request.getCookies();
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("user")) {
            email = c[i].getValue();
        }

    }
    if (email != null) {

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
                    $("#filter").attr("rel", "hide");

                });
                $("#filter").on("click", function() {



                    var rel = $(this).attr("rel");
                    if (rel === "hide") {
                        $("#card1").slideDown();
                        $(this).attr("rel", "show");
                    }
                    else {
                        $("#card1").slideUp();
                        $(this).attr("rel", "hide");
                    }

                });
                $("#create-custom-filter").on("click", function() {
                    var rel = $("#filter").attr("rel");
                    if (rel === "hide") {
                        $("#card1").slideDown();
                        $("#filter").attr("rel", "show");
                    }
                    else {
                        $("#card1").slideUp();
                        $("#filter").attr("rel", "hide");
                    }

                });
                $("#watch-tag").on("click", function() {


                    $("#watch-tag-div").html("<div class='input-group mb-0'><input type='text' class='form-control' placeholder='search...' aria-label='search' aria-describedby='basic-addon1' id='tag-search'> <div class='input-group-prepend'><span class='input-group-text' id='basic-addon1'><i class='fa fa-search' id='search' style='cursor:pointer'></i></span></div></div>");



                });
                $(".link1").on("click", function() {
                    var question_id = $(this).attr("rel");

                    $.post(
                            "views.jsp", {question_id: question_id}, function(data) {

                    }

                    );


                });
                $("#no-answer").on("click", function() {
                    var rel = $(this).attr("rel");
                    if (rel === "0") {
                        $(this).attr("rel", "1");
                    }
                    else {
                        $(this).attr("rel", "0");
                    }
                });
                $("#apply-filter-all").on("click", function() {
                    var check = $("#no-answer").attr("rel");
                    var value = $("#no-answer").val();
                    if (check === "1") {
                        $("#info-checkbox").html("");
                        $.post(
                                "filter_result.jsp", {value: value}, function(data) {

                            $("#filter_result").html(data.trim());

                        }


                        );
                    }
                    if (check === "0") {
                        $("#info-checkbox").html("<span style='color:red'>*Please select at least one.</span>");
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
                margin-left:10px;
            } 
            a:hover{
                text-decoration: none;
            }
            #create-custom-filter{
                cursor: pointer;
                color:blue;

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
            <a href="user.jsp" style="cursor:pointer;font-size:20px">
                <img src="logo/244563b95ff22a5cc309cea450ba1922.png"style="height:30px"></a>
            <!-- <ul class="navbar-nav">
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<li class="nav-item">
                     <div class="nav-item dropdown">
                         
            <!--<div class="dropdown-menu position-absolute1"  style="margin-left:-300px;margin-top:20px">
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
            </div>-->
            <!--  </div>
            <!--<a class="nav-link" style="color:black" href="#">Login</a>

        </li>

    </ul> -->
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        </nav>



        <div class="container-fluid">
            <div class="row" >

                <div class="col-sm-2 card"  >
                    <div class="row" >
                        <section id="top-bar-fixed">
                            <div class="col-sm-12" style="margin-top:2%">
                                <a href="" class="dropdown-item">

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

                    String title = "";
                    String about = "";
                    int question = 0;
                    int votes_count = 0;
                    int total_page = 0;
                    String sub_about = "";
                    String tags = "";
                    String question_id = "";
                    int question_count = 0;
                    int views = 0;
                    int start = 0;
                    int end =6;
                    int sn = 0;
                    int next = 0;
                    int pre = 0;



                    try {


                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
                        Statement st = cn.createStatement();
                        Statement st1 = cn.createStatement();
                        Statement st2 = cn.createStatement();
                        Statement st3 = cn.createStatement();

                        ResultSet rs = st.executeQuery("select count(*) from question");
                        if (rs.next()) {
                            question = rs.getInt(1);
                        }
                        total_page = question /end;














                %>
                <div class="col-sm-6" >
                    <div class="row" style="margin-top:2%">
                        <div class="col-sm-9">
                            <h3>ALL QUESTIONS</h3>
                        </div>
                        <div class="col-sm-3">
                            <a href="question.jsp" style="color:white"><button class="btn btn-primary btn-block">Ask Question</button></a>
                        </div>
                        <div class="col-sm-12" style="height:10px;">

                        </div>
                        <div class="col-sm-9">
                            <span><%=question%> Questions</span>
                        </div>
                        <div class="col-sm-3">
                            <button class="btn btn-info btn-block" id="filter" rel="hide">Filter</button>
                        </div>
                        <div class="col-sm-12" style="height:10px;">

                        </div>
                        
                        <div class="col-sm-12" id="card1" >
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <span>Filter by</span>
                                        </div>
                                        <div class="col-sm-12">
                                            <input type="checkbox" id="no-answer"  rel="0" value="No Answer" unchecked="unchecked">&nbsp;No Answer
                                        </div>
                                        <div class="col-sm-12">
                                            <input type="checkbox" id="no-answer-accept" rel="0"  value="No Accepted Answer" unchecked="unchecked">&nbsp;No Accepted Answer
                                        </div>
                                        <div class="col-sm-12">
                                            <input type="checkbox"  id="has-bounty"  rel="0"value="Has Bounty" unchecked="unchecked">&nbsp;Has Bounty
                                        </div>
                                        <div class="col-sm-12" style="margin-top:2%">
                                            <span id="info-checkbox"></span>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-4">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <span>Sorted by</span>
                                        </div>
                                        <div class="col-sm-12">
                                            <input type="radio" name="sort" checked/>&nbsp;Newest
                                        </div>
                                        <div class="col-sm-12">
                                            <input type="radio" name="sort"/>&nbsp;Recent Activity
                                        </div>
                                        <div class="col-sm-12">
                                            <input type="radio" name="sort">&nbsp;Highest Score
                                        </div>
                                        <div class="col-sm-12">
                                            <input type="radio" name="sort">&nbsp;Most Frequent
                                        </div>
                                        <div class="col-sm-12">
                                            <input type="radio" name="sort">&nbsp;Bounty Ending Soon
                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-4">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <span>Tagged With</span>
                                        </div>
                                        <div class="col-sm-12">
                                            <input type="radio" name="tagged"/>&nbsp;My Watched Tags
                                        </div>
                                        <div class="col-sm-12">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <input type="radio" name="tagged"/>&nbsp;The Following tags

                                                </div>
                                                <div class="col-sm-12">
                                                    <input type="text" class="form-control" placeholder="e.g. python,java,javascript"/>
                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>
                                <div class="col-sm-12" style="height:1px;background-color:gray">

                                </div>
                                <div class="col-sm-12" style="height:10px">

                                </div>
                                <div class="col-sm-6" >
                                    <button class="btn btn-primary" id="apply-filter-all">Apply Filter</button>
                                </div>
                                <div class="col-sm-6" >
                                    <a  style="float:right;cursor: pointer;color:blue" id="cancel-card">Cancel</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-12" style="height:10px;">

                        </div>
                        <div class="col-sm-12" style="height:1px;background-color:gray">

                        </div>
                        <section id="filter_result">
                            <div class="col-sm-12 ">
                                <div class="row">
                                    <%

                                        if (request.getParameter("page") == null) {

                                            sn=0;
                                            start =0;
                                        } else {

                                            sn = Integer.parseInt(request.getParameter("page"));
                                            
                                                
                                                start = sn *6; 
                                           


                                        }
                                        int flag=0;
                                        ResultSet rs1 = st.executeQuery("select * from question limit " + start + ","+end+ " ");
                                        while (rs1.next()) {
                                            flag=1;
                                            title = rs1.getString("title");
                                            about = rs1.getString("body");
                                            tags = rs1.getString("tags");
                                            question_id = rs1.getString("question_id");
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
                                                <a href="sq.jsp?qid=<%=question_id%>" class="link1" rel="<%=question_id%>"><%=title%></a>
                                            </div>
                                            <div class="col-sm-12">
                                                <%
                                                    if (length > 200) {
                                                        sub_about = about.substring(0, 150);


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
                                    <div class="col-sm-12" style="height:1px;background-color:gray">

                                    </div>
                                    <%
                                        }
                                       

                                    %>

                                    <div class="col-sm-12" style="margin-top:2%">
                                        <div class="row">



                                            <div class="col-sm-12">
                                                <%
                                              
                                               
                                                if (sn>0) {
                                                         
                                               
                                                        %>

                                              <button class="btn btn-dark round"><a href="dashboard.jsp?page=<%=sn-1%>"> 
                                                    pre
                                                </a></button>

                                                <%
                                                    }
                                                      
                                                     if (total_page>sn) { 
                                                          

                                                        
                                                %>
                                                <button class="btn btn-dark round"><a href="dashboard.jsp?page=<%=sn+1%>"> 
                                                    next
                                                </a></button>



                                                <%

                                                     
                                                    }


                                                %>

                                            </div>






                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>


                    </div>
                </div>
                <%

                    } catch (Exception e) {
                    }



                %>
                <div class="col-sm-3"   >
                    <div class="row" style="margin-top:15px;height:484px;margin-left:30px" id="side-blog-2" >
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
                    <div class="row" style="margin-top:15px;height:484px;margin-left:30px">

                        <div class="col-sm-12">
                            <div class="row" id="card-finder-tag">
                                <div class="col-sm-12" style="background-color:#F8F9F9;">
                                    <div class="row">
                                        <div class="col-sm-12" style="margin-top:20px">
                                            <span >Custom Filter</span>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-sm-12" style="margin-top:20px">
                                            <a  id="create-custom-filter">Create a custom filter</a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="row" id="card-finder-tag1">
                                <div class="col-sm-12" style="background-color:#F8F9F9;height:60px">
                                    <div class="row">
                                        <div class="col-sm-12" style="margin-top:20px">
                                            <span >Watched Tags</span>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-12" >
                                    <div class="row">
                                        <div class="col-sm-12" >
                                            <div class="row">
                                                <div class="col-sm-12" id="search-img-div">
                                                    <center><img src="logo/search-512.webp" style="height:50px"></center>
                                                </div>
                                                <div class="col-sm-12" id="text-div">
                                                    <center><a >Watch tags to curate your list of questions.</a></center>
                                                </div>
                                                <div class="col-sm-12"  >
                                                    <div class="row">
                                                        <div class="col-sm-12" id="watch-tag-div" >
                                                            <center><button class="btn btn-info btn-round"  id="watch-tag"style="background-color:#E1ECF4;border-color:#E1ECF4;color:black"><i class="fa fa-eye"></i>&nbsp;&nbsp;Watch a tag</button></center>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>



                                        </div>
                                    </div>

                                </div>
                            </div>
                            <!---   <div class="row" id="card-finder-tag2">
                                   <div class="col-sm-12" style="background-color:#F8F9F9;height:60px">
                                       <div class="row">
                                           <div class="col-sm-12" style="margin-top:20px;">
                                               <span >Watched Tags</span>
                                           </div>
                                       </div>
                                       
                                   </div>
                                   <div class="col-sm-12" >
                                       <div class="row">
                                           <div class="col-sm-12" >
                                               <div class="row">
                                                   <div class="col-sm-12" id="search-img-div">
                                                       <center><img src="logo/search-512.webp" style="height:50px"></center>
                                                   </div>
                                                   <div class="col-sm-12" id="text-div">
                                                      <center><a >Watch tags to curate your list of questions.</a></center>
                                                   </div>
                                                    <div class="col-sm-12"  >
                                                        <div class="row">
                                                            <div class="col-sm-12" id="watch-tag-div" >
                                                                 <center><button class="btn btn-info btn-round"  id="watch-tag"style="background-color:#E1ECF4;border-color:#E1ECF4;color:black"><i class="fa fa-eye"></i>&nbsp;&nbsp;Watch a tag</button></center>
                                                            </div>
                                                           
                                                        </div>
                                                     
                                                   </div>
                                               </div>
                                               
                                               
                                              
                                           </div>
                                       </div>
                                       
                                   </div>
                               </div>-->
                        </div>
                    </div>



                </div>
                <div class="col-sm-1">
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
