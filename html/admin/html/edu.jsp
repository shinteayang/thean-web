<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!doctype html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>더안건축-관리자</title>
        <link rel="stylesheet" href="../css/notice.css" />
        <link rel="stylesheet" href="../css/co.css" />
    </head>
    <body>
        <div class = "body">
            <jsp:include page="menubar.jsp"></jsp:include>
            <div class="main-container">
                <div class = "main-elements">
                    <div class="main-title">학습지원 관리</div>
                    <div class = "contact-title">학습지원에 대한 질문</div>
                    <div class = "info-container">
                        <div class = "info-wrap">
                            <div class="info">
                                <div class="b">작성자</div>
                                <div>안용진</div>
                            </div>
                            <div class="info">
                                <div class="b">작성날짜</div>
                                <div>20230630</div>
                            </div>
                        </div>
                        <div class = "info-wrap">
                            <a href="">삭제</a>&nbsp;/&nbsp;
                            <a href="edu_answer.jsp">답변</a>
                        </div>
                    </div>
                    <div class="content">
                        안녕하세요.
                    </div>
                    <div class = "contact-title">학습지원에 대한 답변</div>
                    <div class = "info-container">
                        <div class = "info-wrap">
                            <div class="info">
                                <div class="b">작성자</div>
                                <div>안용진</div>
                            </div>
                            <div class="info">
                                <div class="b">작성날짜</div>
                                <div>20230630</div>
                            </div>
                        </div>
                        <div class = "info-wrap">
                            <a href="edu_edit.jsp">수정</a>&nbsp;/&nbsp;
                            <a href="">삭제</a>
                        </div>
                    </div>
                    <div class="content">
                        안녕하세요.
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>