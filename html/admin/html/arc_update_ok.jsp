<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.UtilArc"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%

String nm = request.getParameter("nm");
String work=request.getParameter("work");
String gps = request.getParameter("gps");
String ground=request.getParameter("ground");
String grow=request.getParameter("grow");
String design=request.getParameter("design");
String photo=request.getParameter("photo");
String etc=request.getParameter("etc");
String id=request.getParameter("id");

  Connection conn = null;
  conn = UtilArc.getConnection();
  String sql="";

  try {
  sql="update arc set nm='"+nm+"', work='"+work+"', gps='"+gps+"', ground="+ground+", grow="+grow+", design='"+design+"', photo='"+photo+"', etc='"+etc+"' where id="+id+";";
  PreparedStatement ps = conn.prepareStatement(sql);
  ps.executeUpdate();
  %>
    <script>location.href = "arc.jsp?select=all&search="; 
    alert("수정되었습니다");
    </script>




  <%
  
  }catch(Exception e){
  %><%=sql%><%

  }
%>