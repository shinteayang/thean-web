<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%

String te = request.getParameter("te");
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/eduWrite.css"> 
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
                if(session == null || session.getAttribute("name") == null) {
                    %>
                        <script>
                            alert("로그인 후 이용 바랍니다.");
                            history.go(-1);
                        </script>
                    <%
                } else {      
                	if(te.equals("all")){
                	    %>
                        <script>
                            alert("강사 검색 후 이용해주세요");
                            history.go(-1);
                        </script>
                    <%
                	}else{
                	
                    %>   
                        <form method="post" action="eduInsert.jsp?">
                            <input id = "nm" type="text" name = "nm" autocomplete="off" placeholder = "문의 제목을 입력해주세요"/>
                            <textarea id="summernote" name="content"></textarea>
                            <input type="text" name="te" value="<%=te%>" hidden/>
                            <button type = "submit" class="submit_btn">제출</button>
                        </form>      
                         
                    <%  	
                	}
                }
            %>
        </div>
        <jsp:include page="../header/footer.jsp"></jsp:include>
        <script>
            $(document).ready(function() {
                $('#summernote').summernote();
            });
        </script>
    </body>
</html>