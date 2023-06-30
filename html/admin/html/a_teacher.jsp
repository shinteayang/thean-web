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
                    <div class="main-title">강사 관리</div>
                    <table id = "table">
                        <tr>
                            <th style = "width: 15%;">이름</th>
                            <th style = "width: 30%;">아이디</th>
                            <th style = "width: 25%;">휴대폰번호</th>
                            <th style = "width: 25%;">이메일</th>
                            <th style = "width: 15%;">기능</th>
                        </tr>
                        <form action="">
                            <tr>
                                <td>1</td>
                                <td style = "text-align: left;">강의에 대한 질문</td>
                                <td>20230630</td>
                                <td><a>삭제</a> / <a href="contact_answer.jsp">답변</a></td>
                                <td></td>
                            </tr>
                        </form>
                        <form action="">
                            <tr>
                                <td>1</td>
                                <td style = "text-align: left;">강의에 대한 질문</td>
                                <td>20230630</td>
                                <td><a>삭제</a> / <a href="contact_answer.jsp">답변</a></td>
                            </tr>
                        </form>
                        <form action="">
                            <tr>
                                <td>1</td>
                                <td style = "text-align: left;">강의에 대한 질문</td>
                                <td>20230630</td>
                                <td><a>삭제</a> / <a href="contact_answer.jsp">답변</a></td>
                            </tr>
                        </form>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>