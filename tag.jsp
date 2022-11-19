<%-- 
    Document   : tag
    Created on : 11 Jun, 2022, 1:56:34 AM
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
        <title>Tags-Stackoverflow</title>
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
                        $(document).ready(function(){
                           /*$(".fa.fa-search").on("click",function(){
                              var text= $("#tag_search").val();
                              $("#"+text).css("border-color","red");
                               
                           });*/
                           $("#tag_search").keyup(function(){
                               var text= $(this).val();
                               $("#"+text).css("border-color","red");
                               
                           });
                            $("#tag_search").keydown(function(){
                               var text= $(this).val();
                               $("#"+text).css("border-color","");
                               
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
             @media only screen and (max-width:500px) {
                 .col-sm-2.card{
                   display:none;
                 }
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
                    String des = "";
                    
                    try {

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
                        Statement st = cn.createStatement();
                       
                       











                %>
                <div class="col-sm-10" >
                    <div class="row" style="margin-top:2%">
                        <div class="col-sm-12">
                            <h3>Tags</h3>
                        </div>
                        <div class="col-sm-6">
                            <span>A tag is a keyword or label that categorizes your question with other, similar questions. Using the right tags makes it easier for others to find and answer your question.
                            </span>
                        </div>
                        <div class="col-sm-6"></div>


                        <div class="col-sm-12" style="height:10px;">


                        </div>
                        <div class="col-sm-3">

                            <div class="input-group mb-0">

                                <input type="text" class="form-control" id="tag_search"placeholder="Filter by tag name" aria-label="search" aria-describedby="basic-addon1">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fa fa-search"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-9">
                            
                        </div>
                        <div class="col-sm-12" style="height:10px;">


                        </div>
                       
                            
                          
                       <%
                        
                         ResultSet rs = st.executeQuery("select * from  tag");
                        while (rs.next()) {
                            tag=rs.getString("tag");
                            des=rs.getString("des");
                            
                            %>
                             
                            <div class="col-sm-3 card-body"  >
                                <div class="row" style="height:200px">
                                    <div class="col-sm-12 card" id="<%=tag%>">
                                        <section  style="margin-top:2%;" >
                                             <button class="btn btn-info" style="background-color:#E1ECF4;border-color:#E1ECF4"> <a href="tagged.jsp?tagged=<%=tag%>" style="font-size:15px" class="tag"><%=tag%></a></button>
                                                
                                         </section>
                                             <section  style="margin-top:2%;" > <span style="font-size:15px"><%=des%></span>
                                             </section>
                                            
                                    </div>
                                            
                                                 
                                </div>
                               
                                
                                
                                
                                
                               
                            </div>
                                             
                                        
                            
                            
                            
                            
                            <%
                           
                        }

                        
                        
                        
                        
                        %>
  
                            
                            
                        




                    </div>
                </div>
                <%

                    } catch (Exception e) {
                    }



                %>


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
                           /*$(".fa.fa-search").on("click",function(){
                              var text= $("#tag_search").val();
                              $("#"+text).css("border-color","red");
                               
                           });*/
                           $("#tag_search").keyup(function(){
                               var text= $(this).val();
                              
                               $("#"+text).css("border-color","red");
                              
                               
                           });
                            $("#tag_search").keydown(function(){
                               var text= $(this).val();
                               $("#"+text).css("border-color","");
                               
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
                    String des = "";
                    
                    try {

                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
                        Statement st = cn.createStatement();
                       
                       











                %>
                <div class="col-sm-10" >
                    <div class="row" style="margin-top:2%">
                        <div class="col-sm-12">
                            <h3>Tags</h3>
                        </div>
                        <div class="col-sm-6">
                            <span>A tag is a keyword or label that categorizes your question with other, similar questions. Using the right tags makes it easier for others to find and answer your question.
                            </span>
                        </div>
                        <div class="col-sm-6"></div>


                        <div class="col-sm-12" style="height:10px;">


                        </div>
                        <div class="col-sm-3">

                            <div class="input-group mb-0">

                                <input type="text" class="form-control" id="tag_search" placeholder="Filter by tag name" aria-label="search" aria-describedby="basic-addon1">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1"><i class="fa fa-search"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-9">
                            
                        </div>
                        <div class="col-sm-12" style="height:10px;">


                        </div>
                       
                            
                          
                       <%
                        
                         ResultSet rs = st.executeQuery("select * from  tag");
                        while (rs.next()) {
                            tag=rs.getString("tag");
                            des=rs.getString("des");
                            
                            %>
                             
                            <div class="col-sm-3 card-body"  >
                                <div class="row" style="height:200px">
                                    <div class="col-sm-12 card" id="<%=tag%>" >
                                        <section  style="margin-top:2%;" >
                                             <button class="btn btn-info" style="background-color:#E1ECF4;border-color:#E1ECF4"> <a href="tagged.jsp?tagged=<%=tag%>" style="font-size:15px" class="tag"><%=tag%></a></button>
                                                
                                         </section>
                                             <section  style="margin-top:2%;" > <span style="font-size:15px"><%=des%></span>
                                             </section>
                                            
                                    </div>
                                            
                                                 
                                </div>
                               
                                
                                
                                
                                
                               
                            </div>
                                             
                                        
                            
                            
                            
                            
                            <%
                           
                        }

                        
                        
                        
                        
                        %>
  
                            
                            
                        




                    </div>
                </div>
                <%

                    } catch (Exception e) {
                    }



                %>


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


                      
                      
                      
                      
                      <%
               
            }


        %>


    </body>
</html>
