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
                    <div class="main-title">강의 등록</div>
                    <form action="add_lec_action.jsp" name = "form" method = "post" enctype="multipart/form-data">
                        <input type="text" id = "title" name = "title" placeholder = "제목을 입력하세요">
                        <div class = "add-elements">
                            <div class = "add-element">
                                <div class = "l-title">카테고리 분류</div>
                                <div>
                                    <select name="category" id="">
                                        <option value="">카테고리 선택</option>
                                        <option value="캐드">캐드</option>
                                    </select>
                                </div>
                            </div>
                            <div class = "add-element">
                                <div class = "l-title">강사</div>
                                <div>
                                    <select name="teacher" id="">
                                        <option value="">강사 선택</option>
                                        <option value="안용진">안용진</option>
                                    </select>
                                </div>
                            </div>
                            <%-- <div class = "add-element">
                                <div class = "l-title">수익 분류</div>
                                <div>
                                    <input type="text" name="rev"> %
                                </div>
                            </div> --%>
                            <div class="add-element">
                                <div class = "l-title">강의 썸네일</div>
                                <div>
                                    <input type="file" name = "1thumb">
                                </div>
                            </div>
                            <div class="add-element">
                                <div class = "l-title">강의 커버</div>
                                <div>
                                    <input type="file" name = "2cover">
                                </div>
                            </div>
                            <div class="add-element">
                                <div class = "l-title">소개 영상</div>
                                <div>
                                    <input type="file" name = "3intro">
                                </div>
                            </div>
                            <div class="add-element">
                                <div class = "l-title">가격</div>
                                <div>
                                    <input type="text" name = "price">(원)
                                </div>
                            </div>
                            <div class="add-element">
                                <div class = "l-title">잔여 기간</div>
                                <div>
                                    <input type="text" name = "day">(일)
                                </div>
                            </div>
                            <div class="add-element">
                                <div class = "l-title">강의 소개</div>
                                <div>
                                    <textarea name="intro" id = "summernote" type = "text"></textarea>
                                </div>
                            </div>
                            <div class="add-element">
                                <div class = "l-title">실습 파일</div>
                                <div>
                                    <input type="file" name = "4training">
                                </div>
                            </div>
                            <div class="add-element">
                                <div class = "l-title">난이도</div>
                                <div>
                                    <select name="difficulty" id="">
                                        <option value="">난이도 선택</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </div>
                            </div>
                            <div class="add-element">
                                <div class = "l-title">추천대상</div>
                                <div>
                                    <textarea name="recom" id = "summernote2" type = "text"></textarea>
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