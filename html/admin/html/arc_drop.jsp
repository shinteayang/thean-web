<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
int id = Integer.parseInt(request.getParameter("id"));
String nm = request.getParameter("nm");
String gps = request.getParameter("gps");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <table style="border:solid 1px;"> 
     <tr style="border:solid 1px;">
     <th style="border:solid 1px;">게시물제목</th>
     <th style="border:solid 1px;">위치</th>
     </tr>
     <tr style="border:solid 1px;">
     <td style="border:solid 1px;"><%=nm%></td>
     <td style="border:solid 1px;"><%=gps%></td>
     </tr>
    </table>
</body>
<h3>삭제하시겠습니까?</h3>
<a href="arc.jsp?select=all&search=">취소</a>
<a href="arc_drop_ok.jsp?id=<%=id%>">삭제</a>


</html>