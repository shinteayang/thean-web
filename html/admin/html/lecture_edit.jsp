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
            $('.index').click(function() {
                $.ajax({
                url: 'add_index.jsp',
                method: 'GET',
                success: function(response) {
                    $('.index-elements').append(response);
                },
                error: function() {
                    alert('목차를 추가하는 데 실패했습니다.');
                }
                });
            });

            $(document).on('click', '.video', function() {
                var idx = $(this).closest('.index-element');
                $.ajax({
                url: 'add_video.jsp',
                method: 'GET',
                success: function(response) {
                    idx.find('.video-elements').append(response);
                },
                error: function() {
                    alert('영상을 추가하는 데 실패했습니다.');
                }
                });
            });

            $(document).on('click', '.index-element .exit', function() {
                var idx = $(this).closest('.index-element');
                idx.remove();
            });

            $(document).on('click', '.close-vd', function() {
                var video = $(this).closest('.video-element');
                video.remove();
            });
        });
    </script>
    </head>
    <body>
        <div class = "body">
            <jsp:include page="menubar.jsp"></jsp:include>
            <div class="main-container">
                <div class = "main-elements">
                    <div class="main-title">강의 수정</div>
                    <form action="" name = "form">
                        <input type="text" id = "title" placeholder = "제목을 입력하세요">
                        <div class = "add-elements">
                            <div class = "add-element">
                                <div class = "l-title">카테고리 분류</div>
                                <div>
                                    <select name="category" id="">
                                        <option value="">카테고리 선택</option>
                                        <option value="">캐드</option>
                                    </select>
                                </div>
                            </div>
                            <div class = "add-element">
                                <div class = "l-title">강사</div>
                                <div>
                                    <select name="teacher" id="">
                                        <option value="">강사 선택</option>
                                        <option value="">안용진</option>
                                    </select>
                                </div>
                            </div>
                            <div class="add-element">
                                <div class = "l-title">소개 영상</div>
                                <div>
                                    <input type="file">
                                </div>
                            </div>
                            <div class="add-element">
                                <div class = "l-title">강의 소개</div>
                                <div>
                                    <textarea name="intro" id = "summernote"></textarea>
                                </div>
                            </div>
                            <div class="add-element">
                                <div class = "l-title">난이도</div>
                                <div>
                                    <select name="difficulty" id="">
                                        <option value="">난이도 선택</option>
                                        <option value="">1</option>
                                        <option value="">2</option>
                                        <option value="">3</option>
                                        <option value="">4</option>
                                        <option value="">5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="add-element">
                                <div class = "l-title">추천대상</div>
                                <div>
                                    <textarea name="recom" id = "summernote2"></textarea>
                                </div>
                            </div>
                            <script>
                                var index_cnt = 0;
                                var video_cnt = 0;
                            </script>
                            <div class="add-element">
                                <div class = "l-title">목차</div>
                                <div>
                                    <div class = "index-elements">
                                        <div class="index-element">
                                            <div class = "exit">✕</div>
                                            <div class = "index-wrap">
                                                <input type="text" id = "title" name = "index-title" placeholder = "목차를 입력하세요">
                                                <div class = "video-title">영상 목록</div>
                                                <div class = "video-elements">
                                                    <div class = "video-element">
                                                        <div class = "video-wrap">
                                                            <div style = "display: flex; width: 100%;">
                                                                <input id = "video" type="text" name = "title" placeholder = "영상 제목을 입력하세요">
                                                                <input type="file">
                                                            </div>
                                                            <div class = "close-vd">✕</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class = "add-index video">+ 영상 추가</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class = "add-index index">+ 목차 추가</div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button type = "submit" class = "search-btn">완료</button>
                            <button type = "button" class = "search-btn" onClick = "history.go(-1);">취소</button>
                        </div>
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