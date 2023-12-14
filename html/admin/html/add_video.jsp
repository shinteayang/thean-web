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
    int ct = Integer.parseInt(request.getParameter("ct"));
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
                    <div class="main-title">영상 추가</div>
                    <form action="add_video_action.jsp?id=<%=id%>&ct=<%=ct%>" enctype="multipart/form-data" method = "post">
                        <div class = "video-element">
                            <div class = "video-wrap">
                                <div style = "display: flex; width: 100%;">
                                    <input id = "video" type="text" name = "title" placeholder = "영상 제목을 입력하세요">
                                    <input type="file" name = "file1">
                                </div>
                            </div>
                        </div>
                        <button class = "search-btn" type = "submit">영상 추가</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>