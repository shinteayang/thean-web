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
                    <div class="main-title">공지사항 관리</div>
                    <table id = "table">
                        <tr>
                            <th style = "width: 10%;">번호</th>
                            <th style = "width: 45%;">제목</th>
                            <th style = "width: 10%;">작성자</th>
                            <th style = "width: 10%;">날짜</th>
                            <th style = "width: 10%;">분류</th>
                            <th style = "width: 15%;">기능</th>
                        </tr>
                        <form action="">
                            <tr>
                                <td>1</td>
                                <td style = "text-align: left;">강의에 대한 질문</td>
                                <td>안용진</td>
                                <td>20230630</td>
                                <td>더안건축 개발팀</td>
                                <td><a href="notice_edit.jsp">수정</a> / <a>삭제</a></td>
                            </tr>
                        </form>
                    </table>
                    <button class = "search-btn" onClick = "location.href='add_notice.jsp'">공지사항 작성</button>
                </div>
            </div>
        </div>
    </body>
</html>