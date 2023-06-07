<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/gonotice.css"> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
        <script>
            function checkNull() {
                const title = $("#nm").val().trim();
                const text = $("#sp").val().trim();

                if (title.length == 0) {
                    alert('제목을 입력해주세요.');
                    return false;
                }

                if (text.length == 0) {
                    alert('내용을 입력해주세요.');
                    return false;
                }

                return true;
            }
        </script>
    </head>
    <body>
        <jsp:include page="../header/header.jsp"></jsp:include>
        <div class = "body">
            <%   
                if(session == null || session.getAttribute("name")==null) {
                    %>
                      <form action="gonoticeok.jsp" onsubmit = "return checkNull()" method="post">
                            <div class = "non-custm-container">
                                <div class = "non-custm">비회원 정보 입력</div>
                                <input id = "con" type="text" name = "digit" autocomplete="off" placeholder = "전화번호를 -없이 입력"/><br>
                                <input name="name" id="con" placeholder = "이름 입력"/>
                                <input type="password" id = "con" name="pwd" placeholder = "비밀번호 입력"> 
                            </div>
                            <input id = "nm" type="text" name = "nm" autocomplete="off" placeholder = "문의 제목을 입력해주세요"/>
                            <textarea id="summernote" name="content" placeholder = "문의 내용을 입력해주세요"></textarea>
                            <input type="radio" name="pb" value="off" checked>공개
                            <input type="radio" name="pb" value="on">비공개
                            <div class = "warning">※ 한번 등록한 문의는 수정이나 삭제할 수 없습니다</div>
                            <button class = "submit-btn" type = "submit">등록하기</button>
                        </form>      
                    <% 
                } else {         
                    %>   
                        <form action="gonoticeok.jsp" onsubmit = "return checkNull()" method="post">
                            <input id = "nm" type="text" name = "nm" autocomplete="off" placeholder = "문의 제목을 입력해주세요"/>
                            <textarea id="summernote" name="content" placeholder = "문의 내용을 입력해주세요"></textarea>
                           <div class = "yn">
                            <div class = "y">
                                <input id = "y" type="radio" name="pb" value="off" checked style = "margin: 0;">
                                <label for="y" class = "ynlabel">공개</label>
                            </div>
                            <div class = "y">
                                <input id = "n" type="radio" name="pb" value="on" style = "margin: 0;">
                                <label for="n" class = "ynlabel">비공개</label>
                            </div>
                           </div>
                            <div class = "warning">
                                ※ 한번 등록한 문의는 수정이나 삭제할 수 없습니다<br>
                                ※ 환불 문의는 1대1 고객센터를 이용해주시기 바랍니다
                            </div>
                            <button class = "submit-btn" type = "submit">등록하기</button>
                        </form>      
                    <%  	
                }
            %>
        </div>
        <jsp:include page="../header/footer.jsp"></jsp:include>
        <script>
            $(document).ready(function() {
                $('#summernote').summernote();
            });

            alert('※ 강의 내용에 관련된 문의는 ‘학습지원’ 게시판에\n 해당 강사님에게 직접 하셔야 합니다\n※ 환불 문의는 1대1 고객센터를 이용해주시기 바랍니다');
        </script>
    </body>
</html>