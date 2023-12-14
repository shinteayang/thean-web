<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
%>
<!doctype html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>더안건축-관리자</title>
        <link rel="stylesheet" href="../css/teacher.css" />
        <link rel="stylesheet" href="../css/co.css" />
    </head>
    <body>
        <div class = "body">
            <jsp:include page="menubar.jsp"></jsp:include>
            <div class="main-container">
                <div class = "main-elements">
                    <div class="main-title">목차 추가</div>
                    <form action="add_index_action.jsp" method="post">
                        <input type="text" id = "title" name = "index-title" placeholder = "목차를 입력하세요">
                        <input type="hidden" name = "id" value="<%=id%>">
                        <button class = "search-btn" type = "submit">완료</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>