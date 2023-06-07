<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page session="true" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");

    Connection conn = null;

    conn = Util.getConnection();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="../../css/thean_academy/lectures.css"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
             $(document).ready(function() {
                $('input[type=radio][name=menu]').change(function() {
                    var option = $(this).val();
                    $.ajax({
                        url: "lectureSearch.jsp",
                        type: "POST",
                        data: {
                            option: option
                        },
                        success: function(data) {
                            $(".contents").html(data);
                        },
                        error: function(error) {
                            console.log(error);
                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div id = "main">
            <div id = "body">
                <div class = "menu-container">
                    <div class = "menu">
                        <div class = "search">
                            <input type = "text" class = "search-box">
                            <button class = "search-btn">?</button>
                        </div>
                        <ul id = "menu-group">
                            <li><div>전체 </div> <input type = "radio" name = "menu" value = "all" checked></li>
                            <li><div>캐드 (2D)</div> <input type = "radio" name = "menu" value = "캐드"></li>
                            <li><div>모델링 (3D)</div> <input type = "radio" name = "menu" value = "model"></li>
                            <li><div>건축</div> <input type = "radio" name = "menu" value = "arch"></li>
                            <li><div>인테리어</div> <input type = "radio" name = "menu" value = "inter"></li>
                            <li><div>자격증</div> <input type = "radio" name = "menu" value = "certi"></li>
                            <li><div>전기/설비/목공</div> <input type = "radio" name = "menu" value = "mock"></li>
                            <li><div>건축사사무소</div> <input type = "radio" name = "menu" value = "office"></li>
                            <li><div>개인시행, 창업</div> <input type = "radio" name = "menu" value = "personal"></li>
                        </ul>
                    </div>
                </div>
                <div class = "content-container">
                    <div class= "contents"></div>
                </div>    
            </div>
        </div>
    </body>
</html>