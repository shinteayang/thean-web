<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>

<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    
    String sql = "select * from cs where no="+id+";";
   
%>
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
            <div class = "update-title">수정하기</div>
            <form action="goud.jsp" onsubmit = "return checkNull()" method="post">
            <%
             try {
                        Connection conn = Util.getConnection(); 
                        PreparedStatement ps = Prepare.getPrepare(conn, sql);
                        ResultSet rs = ps.executeQuery();
                    
                        if(rs.next()) {

                            %>
                            <input id = "nm" type="text" name = "idx" autocomplete="off" value="<%=rs.getString("idx")%>"/>
                            <textarea id="summernote" name="txt" placeholder = "문의 내용을 입력해주세요"><%=rs.getString("text")%></textarea>
                            
                            
                            
                            <%




                        }
            
            
            
            
            
             }catch(Exception e){


             }
            
            
            
            
            
            
            
            
            %>
                
                <input type="radio" name="pb" value="off" checked>공개
                <input type="radio" name="pb" value="on">비공개
                <input type="text" name="id" value="<%=id%>" hidden>
                <div class = "warning">※ 한번 등록한 문의는 수정이나 삭제할 수 없습니다</div>

                <button class = "submit-btn" type = "submit">등록하기</button>
            </form>      
        </div>
        <jsp:include page="../header/footer.jsp"></jsp:include>
        <script>
            $(document).ready(function() {
                $('#summernote').summernote();

                $('#board_content').val("${board_data.BOARD_CONTENT}");
                $('#board_content').summernote({
                        placeholder: '최대 500자 작성 가능합니다.',
                        height: 300,
                        lang: 'ko-KR',
                        callbacks: {
                            onImageUpload: function(files, editor, welEditable) {
                                for(var i = files.length -1; i>=0; i--) {
                                    sendFile(files[i], this);
                                }
                            }
                        }
                });
            });
        </script>
    </body>
</html>