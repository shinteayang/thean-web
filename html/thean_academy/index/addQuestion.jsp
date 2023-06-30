<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));

    String sqlq = "SELECT * FROM questions WHERE id = " + id;

    Connection conn = Util.getConnection();
    PreparedStatement pq = Prepare.getPrepare(conn, sqlq);
    ResultSet rsq = pq.executeQuery();

    try {
        %><div class = "chat-message sent"><%
            if (rsq.next()) {
                %>
                    <div><%=rsq.getString("question")%></div>
                <%
            }else{
%>
                    <div>error</div>
                <%

            }
        %></div><%
    } catch (Exception e) {
        %><h1><%=e%></h1><%
    }

    conn.close();
%>
