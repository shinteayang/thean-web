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
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
        <script>
            $(document).ready(function() {
                $('.add').click(function() {
                    $.ajax({
                        url: 'add_portfolio.jsp',
                        method: 'GET',
                        success: function(response) {
                            $('.portfolio-elements').append(response);
                        },
                        error: function() {
                            alert('목차를 추가하는 데 실패했습니다.');
                        }
                    });
                });

                $(document).on('click', '.close', function() {
                    var idx = $(this).closest('.portfolio-element');
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
                    <div class="main-title">강사 등록</div>
                    <form action="">
                        <table id = "table">
                            <tr>
                                <th style = "width: 10%;">이름</th>
                                <th style = "width: 30%;">아이디</th>
                                <th style = "width: 30%;">휴대폰번호</th>
                                <th style = "width: 30%;">이메일</th>
                            </tr>
                            <tr>
                                <td>안용진</td>
                                <td style = "text-align: left;">dksdydwls</td>
                                <td>01012345678</td>
                                <td>dksdydwls@gmail.com</td>
                            </tr>
                        </table>
                        <div class = "l-title">강사 소개</div>
                        <textarea id = "summernote" name="teacher_intro"></textarea>
                        <div class = "l-title">강사 이력</div>
                        <textarea id = "summernote2" name="teacher_record"></textarea>
                        <div class = "l-title">강사 포트폴리오</div>
                        <div class = "portfolio-elements">
                            <div class = "portfolio-element">
                                <input type="file">
                                <div class = "close">✕</div>
                            </div>
                        </div>
                        <div class = "add">+ 포트폴리오 추가</div>
                        <button type = "submit" class = "search-btn">완료</button>
                        <button type = "button" class = "search-btn" onClick="history.go(-1);">취소</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <script>
        $(document).ready(function() {
            $('#summernote').summernote();
            $('#summernote2').summernote();
        });
    </script>
</html>