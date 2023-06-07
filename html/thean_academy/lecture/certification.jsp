<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%@ page import="java.time.LocalDate"%>
<%
    request.setCharacterEncoding("UTF-8");

    String ct = request.getParameter("ct");
    String name = request.getParameter("name");
    String ho = request.getParameter("ho");

    LocalDate now = LocalDate.now();

    int year = now.getYear();
    int month = now.getMonthValue();
    int day = now.getDayOfMonth();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/certification.css">
        <script>
            window.print();
        </script>
    </head>
    <body>
        <div class = "main">
            <div class = "wrap">
                <div class = "num">더안건축 <%=year%> - <%=ho%>호</div>
                <div class = "title">이수증</div>
                <div class = "info">
                    <div>강의명&nbsp;&nbsp;<%=ct%></div>
                    <div>이름&nbsp;&nbsp;<%=name%></div>
                </div>
                <div class = "content">
                    위 사람은 「<%=ct%>」 과정에 적극적인 자세로 참여하며 전 과정을 성실하게 수료하였기에 이 증서를 수여합니다.
                </div>
                <div class = "date"><%=year%>년 <%=month%>월 <%=day%>일</div>
                <div class = "teacher">더안건축학원장 안 용 진</div>
                <img class = "stamp" src="../../../img/stamp.jpg" alt="">
            </div>
        </div>
    </body>
</html>