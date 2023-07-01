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
        <link rel="stylesheet" href="../css/co.css" />
        <link rel="stylesheet" href="../css/slide.css" />
    </head>
    <body>
        <div class = "body">
            <jsp:include page="menubar.jsp"></jsp:include>
            <div class="main-container">
                <div class = "main-elements">
                    <div class="main-title">할인 쿠폰 관리</div>
                    <div class="main-element">
                        <form action="">
                            <table id = "table">
                                <tr>
                                    <th>쿠폰 코드</th>
                                    <th>포인트</th>
                                    <th>기능</th>
                                </tr>
                                <tr>
                                    <td>welcomethean</td>
                                    <td>10000</td>
                                    <td><b>삭제</b></td>
                                </tr>
                            </table>
                        </form>
                        <form action="">
                            <div>
                                <div class = "sub-title">할인 쿠폰 추가</div>
                                <div class = "element">
                                    <div class = "e-title">쿠폰 코드</div>
                                    <input type = "text" name = "code">
                                </div>
                                <div class = "element">
                                    <div class = "e-title">포인트</div>
                                    <input type = "text" name = "point">
                                </div>
                                <button class = "search-btn" type = "submit">추가</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>