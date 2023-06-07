<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");
    String content = request.getParameter("content");

    String sql = "INSERT INTO board(content) VALUES(?)";
    Connection conn = Util.getConnection();
    ResultSet res = null;
    PreparedStatement pstmt = Prepare.getPrepare(conn, sql);
    pstmt.setString(1, content);

    pstmt.executeUpdate();


%>