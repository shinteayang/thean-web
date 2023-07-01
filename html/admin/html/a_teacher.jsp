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
                    <div class="main-element">
                        <form action="">
                            <input type="text" class = "search" placeholder = "검색어 입력" name="search">
                            <button class = "search-btn" type = "submit">검색</button>
                        </form>
                        <table id = "table">
                            <tr>
                                <th style = "width: 10%;">이름</th>
                                <th style = "width: 30%;">아이디</th>
                                <th style = "width: 20%;">휴대폰번호</th>
                                <th style = "width: 20%;">이메일</th>
                                <th style = "width: 20%;">기능</th>
                            </tr>
                            <form action="">
                                <tr>
                                    <td>안용진</td>
                                    <td style = "text-align: left;">dksdydwls</td>
                                    <td>01012345678</td>
                                    <td>dksdydwls@gmail.com</td>
                                    <td>
                                        <select name="" id="">
                                            <option value="">등급 선택</option>
                                            <option value="member">회원</option>
                                            <option value="teacher">강사</option>
                                            <option value="admin">관리자</option>
                                        </select>
                                    </td>
                                </tr>
                            </form>
                        </table>
                    </div>
                    <button class = "search-btn" onClick = "location.href='add_teacher.jsp'">강사등록</button>
                </div>
            </div>
        </div>
    </body>
</html>