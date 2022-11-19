<%-- 
    Document   : user_answer
    Created on : 26 Jun, 2022, 3:16:31 AM
    Author     : rohit
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    String email = null;
    String user_code = "";
    String user_name = "";
    String user_email = "";
    Cookie c[] = request.getCookies();
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("stackoverflow_admin")) {
            email = c[i].getValue();
        }

    }
    if (email != null) {
        if (request.getParameter("ucode").length() == 0) {
        } else {
            user_code = request.getParameter("ucode");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from user where user_code='" + user_code + "'");
                if (rs.next()) {
                    user_name = rs.getString("name");
                    user_email = rs.getString("email");
                }



            } catch (Exception e) {
            }
        }

%>
<!DOCTYPE html>
<html>
    <head>
        <title><%=user_name%></title>
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
                $(".fa.fa-trash").on("click", function() {
                    var question_id = $(this).attr("rel");
                    var id = $(this).attr("rel1");

                    $.post(
                            "question_remove.jsp", {question_id: question_id}, function(data) {
                        if (data.trim() === "success") {
                            $("#question-" + id).fadeOut(1000);
                            $("#bg-" + id).fadeOut(1000);
                            $("#space-" + id).fadeOut(1000);
                        }
                    }



                    );


                });

            });
        </script>


    </head>
    <body >
        <nav class="navbar navbar-expand-sm bg-primary navbar-dark sticky-top" id="card">


            <a class="navbar-brand" href="admin_dashboard.jsp">dashboard</a>
            &nbsp;&nbsp;

            <div class="input-group mb-0">

                <input type="text" class="form-control" placeholder="search..." aria-label="search" aria-describedby="basic-addon1">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1"><i class="fa fa-search"></i></span>
                </div>
            </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="nav-item dropdown">
                <a  style="cursor:pointer;font-size:30px" data-toggle="dropdown">
                    <i class="fa fa-user"></i></a>
                <div class="dropdown-menu position-absolute"  style="margin-left:-130px;margin-top:13px">
                    <div class="row" >
                        <div class="col-sm-12" >
                            <a href="logout.jsp" class="dropdown-item">

                                <span><i class="fa fa-sign-out">Logout</i></span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>


            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        </nav>



        <div class="container-fluid">
            <div class="row"style="margin-top:2%" >

                <%
                    int sn = 1;
                    String title = "";
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
                        Statement st = cn.createStatement();
                        Statement st1 = cn.createStatement();
                        ResultSet rs = st.executeQuery("Select * from question ");
                        while (rs.next()) {
                            //
                            String question_id = rs.getString("question_id");
                            title = rs.getString("title");
                            int flag = 0;
                %>


                <%
                    ResultSet rs1 = st1.executeQuery("Select * from answer where email='" + user_email + "' AND question_id='" + question_id + "'");
                    while (rs1.next()) {
                        flag = 1;

                    }
                    if (flag == 1) {



                %>
                <div class="col-sm-12" id="question-<%=sn%>">

                    <div class="row"  id="question-hide-<%=sn%>">
                        <div class="col-sm-1">
                            <h4><%=sn%></h4>
                        </div>
                        <div class="col-sm-11">
                            <h3 style="color:green"> <%=title%></h3>
                        </div>
                    </div>
                    <%

                        ResultSet rs2 = st1.executeQuery("Select * from answer where email='" + user_email + "' AND question_id='" + question_id + "'");
                        while (rs2.next()) {

                            String replay = rs2.getString("comment");



                    %>

                    <div class="row">
                        <div class="col-sm-1">

                        </div>
                        <div class="col-sm-10">
                            <div class="row">
                                <div class="col-sm-12">
                                    <h6><%=replay%></h6>
                                </div>

                            </div>


                        </div>
                        <div class="col-sm-1">
                            <i class="fa fa-trash" rel1="<%=sn%>"rel="<%=question_id%>" style="color:red;cursor:pointer;font-size:30px"></i>
                        </div>


                        <div class="col-sm-12" style="height:1px;background-color:#F1F2F4" id="bg-<%=sn%>">

                        </div>
                        <div class="col-sm-12" style="height:30px" id="space-<%=sn%>">

                        </div>
                    </div>
               


                <%
                                }
                        %>
                         </div>
                        <%
                            }
                            sn++;
                        }
                    } catch (Exception e) {
                    }


















                %>




            </div>
        </div>

        <!-- Footer Start -->
        <%


            if (sn > 2) {

        %>
        <div class="container-fluid bg-dark text-light" >
            <%            } else if (sn == 1) {
            %>

            <div class="container-fluid bg-dark text-light" style="margin-top:20%">

                <%                      } else {
                %>

                <div class="container-fluid bg-dark text-light" style="margin-top:15%">

                    <%                          }


                    %>
                    <div class="row px-xl-5 pt-5">
                        <div class="col-sm-1">

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
