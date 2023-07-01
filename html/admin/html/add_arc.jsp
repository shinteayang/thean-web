<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javax.servlet.*" %>
<!doctype html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>더안건축-관리자</title>
        <link rel="stylesheet" href="../css/arc.css" />
        <link rel="stylesheet" href="../css/co.css" />
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script>
            $(document).ready(function() {
                $('.add').click(function() {
                    $.ajax({
                        url: 'add_photo.jsp',
                        method: 'GET',
                        success: function(response) {
                            $('.photo-elements').append(response);
                        },
                        error: function() {
                            alert('목차를 추가하는 데 실패했습니다.');
                        }
                    });
                });

                $(document).on('click', '.close', function() {
                    var idx = $(this).closest('.photo-element');
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
                    <div class="main-title">건축 사진 추가</div>
                    <form action="">
                        <div class="main-element">
                            <div class = "info-form">
                                <div class = "element">
                                    <div class = "e-title">이름</div>
                                    <textarea style = "width: 200px;" name = "name"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">용도</div>
                                    <textarea style = "width: 200px;" name = "usage"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">위치</div>
                                    <textarea style = "width: 200px;" name = "loc"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">대지면적</div>
                                    <textarea style = "width: 200px;" name = "land"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">연면적</div>
                                    <textarea style = "width: 200px;" name = "total"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">설계</div>
                                    <textarea style = "width: 200px;" name = "des"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">촬영</div>
                                    <textarea style = "width: 200px;" name = "rec"></textarea>
                                </div>
                                <div class = "element">
                                    <div class = "e-title">기타</div>
                                    <textarea style = "width: 200px;" name = "etc"></textarea>
                                </div>
                            </div>
                            <div class = "container">
                                <div class = "e-title">사진</div>
                                <div class = "photo-elements">
                                    <div class = "photo-element">
                                        <input type="file">
                                        <div class = "close">✕</div>
                                    </div>
                                </div>
                                <div class = "add">+ 사진 추가</div>
                            </div>
                        </div>
                        <div class = "btns">
                            <button type = "submit" class = "search-btn">확인</button>
                            <button type = "button" onClick = "history.go(-1);" class = "search-btn">취소</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>