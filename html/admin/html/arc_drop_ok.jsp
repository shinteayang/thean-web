<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.UtilArc"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
String id=request.getParameter("id");
  Connection conn = null;
  conn = UtilArc.getConnection();
  String sql="";

  try {
  sql="delete from arc where id="+id;
  PreparedStatement ps = conn.prepareStatement(sql);
  ps.executeUpdate();
  %>
    <script>location.href = "arc.jsp?select=all&search="; 
    alert("삭제되었습니다");
    </script>




  <%
  
  }catch(Exception e){


  }
%>