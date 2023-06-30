<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javax.servlet.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    int cnt = Integer.parseInt(request.getParameter("cnt"));
%>
<!doctype html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>더안건축-관리자</title>
        <link rel="stylesheet" href="../css/arc.css" />
        <link rel="stylesheet" href="../css/co.css" />
    </head>
    <body>
        <div class = "body">
            <jsp:include page="menubar.jsp"></jsp:include>
            <div class="main-container">
                <div class = "main-elements">
                    <div class="main-title">건축 사진 추가</div>
                    <form action="">
                        <div class="main-element">
                            <div class = "info-form">
                                <div class = "element">
                                    <div class = "e-title">이름</div>
                                    <textarea style = "width: 200px;" name = "name"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">용도</div>
                                    <textarea style = "width: 200px;" name = "usage"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">위치</div>
                                    <textarea style = "width: 200px;" name = "loc"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">대지면적</div>
                                    <textarea style = "width: 200px;" name = "land"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">연면적</div>
                                    <textarea style = "width: 200px;" name = "total"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">설계</div>
                                    <textarea style = "width: 200px;" name = "des"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">촬영</div>
                                    <textarea style = "width: 200px;" name = "rec"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">기타</div>
                                    <textarea style = "width: 200px;" name = "etc"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">사진</div>
                                    <%
                                        for (int i = 0; i < cnt; i++) {
                                            %><input type = "file" name = "file"><%
                                        }
                                    %>
                                </div>
                            </div>
                        </div>
                        <div class = "btns">
                            <button type = "submit" class = "search-btn">확인</button>
                            <button type = "button" onClick = "history.go(-1);" class = "search-btn">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>