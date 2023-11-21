<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String count = request.getParameter("count");
%>
<head>
    <meta charset="utf-8">
</head>
<div class = "photo-element">
    <input type="file" name = "file<%=count%>" id = "file<%=count%>">
    <div class = "close">✕</div>
</div>