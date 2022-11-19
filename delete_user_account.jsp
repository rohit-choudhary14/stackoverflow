<%-- 
    Document   : delete_user_account
    Created on : 25 Jun, 2022, 4:34:46 PM
    Author     : rohit
--%>

<%@page contentType="text/html"  import="java.sql.*"pageEncoding="UTF-8"%>
<%
    String user_id = "";
    String admin_email = null;
    String user_email = "";
    Cookie c[] = request.getCookies();
    for (int i = 0; i < c.length; i++) {
        if (c[i].getName().equals("stackoverflow_admin")) {
            admin_email = c[i].getValue();
        }
    }
    if (admin_email != null) {
        if (request.getParameter("user_id").length() == 0) {
        } else {
            user_id = request.getParameter("user_id");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from user where user_code='" + user_id + "'");
                if (rs.next()) {
                    user_email = rs.getString("email");
                    if (st.executeUpdate("delete from user where user_code='" + user_id + "' AND email='" + user_email + "'") > 0) {
                        ResultSet rs1 = st.executeQuery("select * from question where email='" + user_email + "'");
                        if (rs1.next()) {
                            if (st.executeUpdate("delete from question where email='" + user_email + "'") > 0) {
                            }
                        }

                        ResultSet rs2 = st.executeQuery("select * from answer where email='" + user_email + "'");
                        if (rs2.next()) {
                            if (st.executeUpdate("delete from answer where email='" + user_email + "'") > 0) {
                            }
                        }




                        out.print("success");
                    }

                }
                else {
                }
            } catch (Exception e) {
            }
        }
    } else {
    }

















%>
