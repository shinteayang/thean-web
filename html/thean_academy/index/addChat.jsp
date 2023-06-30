<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));

    String sqla = "SELECT * FROM answers WHERE id = " + id;

    Connection conn = Util.getConnection();
    PreparedStatement pa = Prepare.getPrepare(conn, sqla);
    ResultSet rsa = pa.executeQuery();

    try {
        Thread.sleep(300);
        %><div class = "chat-message received"><%
            while (rsa.next()) {
                %>
                    <div><%=rsa.getString("answer")%></div>
                <%
            }
        %></div><%
    } catch (Exception e) {
        %><h1><%=e%></h1><%
    }

    conn.close();
%>
