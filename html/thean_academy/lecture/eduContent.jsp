<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="../../../css/thean_academy/eduContent.css" />
</head>
<body>
	<jsp:include page="../header/header.jsp"></jsp:include>
	<div class = "main">
		<div class = "content">
            <div class = "title">강의를 보다가 궁금해서 달아봅니다.</div>
            <div class = "info-wrap">
                <div class = "info">
                    <div class = "b">작성자</div>
                    <div class = "w">백승민</div>
                </div>
                <div class = "info">
                    <div class = "b">작성날짜</div>
                    <div class = "w">2023-04-14</div>
                </div>
            </div>
            <div class="te">

            </div>
            <a class = "back-btn" href="education.jsp">뒤로가기</a>
		</div>
	</div>
	<jsp:include page="../contact/contact.jsp"></jsp:include>
	<jsp:include page="../header/footer.jsp"></jsp:include> 
</body>
</html>