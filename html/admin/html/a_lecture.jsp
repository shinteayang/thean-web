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
        <link rel="stylesheet" href="../css/teacher.css" />
        <link rel="stylesheet" href="../css/co.css" />
    </head>
    <body>
        <div class = "body">
            <jsp:include page="menubar.jsp"></jsp:include>
            <div class="main-container">
                <div class = "main-elements">
                    <div class="main-title">강의 관리</div>
                    <table id = "table">
                        <tr>
                            <th style = "width: 20%;">썸네일</th>
                            <th style = "width: 30%;">카테고리</th>
                            <th style = "width: 10%;">강사</th>
                            <th style = "width: 20%;">가격</th>
                            <th style = "width: 20%;">기능</th>
                        </tr>
                        <form action="">
                            <tr>
                                <td><div class = "thumb" style = "background-image: url('');"></div></td>
                                <td>실사 도면 그리기</td>
                                <td>안용진</td>
                                <td>300,000원</td>
                                <td><a href = "lecture_edit.jsp">수정</a> / <a>삭제</a></td>
                            </tr>
                        </form>
                    </table>
                    <form action="add_lecture.jsp">
                        <button class = "search-btn" type = "submit">강의 등록</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>