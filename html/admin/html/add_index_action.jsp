<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    request.setCharacterEncoding("UTF-8");
    int id = Integer.parseInt(request.getParameter("id"));
    String title = request.getParameter("index-title");

    Connection conn = null;
    conn = Util.getConnection();

    String sql = "INSERT INTO mid_title (mid_title, ctnum) VALUES (?, ?)";

    PreparedStatement ps = conn.prepareStatement(sql);
    ps.setString(1, title);
    ps.setInt(2, id);
    ps.executeUpdate();

    response.sendRedirect("a_video_index.jsp?id=" + id);
%>