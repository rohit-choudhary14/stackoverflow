<%-- 
    Document   : votes
    Created on : 3 Jun, 2022, 7:29:51 PM
    Author     : rohit
--%>

<%@page contentType="text/html"  import="java.sql.*"pageEncoding="UTF-8"%>
<%
    String question_id = "";
    int vote = 0;
    String email = null;
    Cookie c[] = request.getCookies();
    for (int i = 0; i < c.length; i++) {

        if (c[i].getName().equals("user")) {
            email = c[i].getValue();
        }
    }
    if (email != null) {
        if (request.getParameter("question_id").length() == 0 || request.getParameter("votes").length() == 0) {
        } else {
            question_id = request.getParameter("question_id");
            vote = Integer.parseInt(request.getParameter("votes"));
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stackoverflow", "root", "");
                Statement st = cn.createStatement();
                ResultSet rs = st.executeQuery("select * from votes where question_id='" + question_id + "' AND email='" + email + "'");
                if (rs.next()) {
                    if (vote == 0) {
                        if (st.executeUpdate("delete from votes where question_id='" + question_id + "' AND email='" + email + "'") > 0) {
                        }
                    } 
                    else {
                        if (st.executeUpdate("update votes set votes='" + vote + "' where question_id='" + question_id + "' AND email='" + email + "'") > 0) {
                        }
                    }
                } else {
                    PreparedStatement ps = cn.prepareStatement("insert into votes values(?,?,?)");
                    ps.setString(1, question_id);
                    ps.setString(2, email);
                    ps.setInt(3, vote);
                    if (ps.executeUpdate() > 0) {
                    }
                }


            } catch (Exception e) {
            }
        }
    } else {
    }



%>
