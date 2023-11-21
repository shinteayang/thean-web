<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
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
    <div>
    <form action="arc_update_ok.jsp">
    <h3>이름</h3>
    <input type="text" name="nm" value="<%=nm%>">
        <h3>용도</h3>
        <input type="text" name="work" value="<%=work%>">
        <h3>위치</h3>
        <input type="text" name="gps" value="<%=gps%>">
        <h3>대지면적</h3>
        <input type="text" name="ground" value="<%=ground%>">
        <h3>연면적</h3>
        <input type="text" name="grow" value="<%=grow%>">
        <h3>설계</h3>
        <input type="text" name="design" value="<%=design%>">
        <h3>촬영</h3>
        <input type="text" name="photo" value="<%=photo%>">
        <h3>기타</h3>
        <input type="text" name="etc" value="<%=etc%>">
        <input type="text" name="id" value="<%=id%>" hidden>

        <h2>수정하시겠습니까?</h3>
        <a href="arc.jsp?select=all&search=">취소</a>
       <button type="submit">수정완료</button>

    </form>
    
    
    </div>
</body>


</html>