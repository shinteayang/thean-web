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
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script>
            $(document).ready(function() {
                $('.add').click(function() {
                    $.ajax({
                        url: 'add_history.jsp',
                        method: 'GET',
                        success: function(response) {
                            $('.history-elements').append(response);
                        },
                        error: function() {
                            alert('목차를 추가하는 데 실패했습니다.');
                        }
                    });
                });

                $(document).on('click', '.close', function() {
                    var idx = $(this).closest('.history-element');
                    idx.remove();
                });
            });
        </script>
    </head>
    <body>
        <div class = "body">
            <jsp:include page="menubar.jsp"></jsp:include>
            <div class="main-container">
                <div class = "main-elements">
                    <div class="main-title">History 편집</div>
                    <div class="main-element">
                        <form action="">
                            <div class = "history-elements">
                                <div class = "history-element">
                                    <div>
                                        <div><input type="text" placeholder = "연도" name = "year"></div>
                                        <div><textarea type="text" placeholder = "연혁" name = "content"></textarea></div>
                                    </div>
                                    <div class = "close">✕</div>
                                </div>
                            </div>
                            <div class = "add">+ 사진 추가</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>