<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Util"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>더안건축학원</title>
        <style>
            * {
                margin: 0;
                padding: 0;
            }

            #main {
                width: 100%;
                height: 100vh;
                margin-bottom: 100px;
            }

            .img {
                width: 100%;
                height: 100%;
                background-image: url('../../../img/intro.jpg');
                background-size: 100%;
                background-repeat: no-repeat;
                background-position: center center;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../header/header.jsp"></jsp:include>
        <div id="main">
            <div class = "img">
            
            </div>
        </div>
        <jsp:include page="../header/footer.jsp"></jsp:include>
    </body>
</html>