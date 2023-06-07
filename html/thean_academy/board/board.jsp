<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");
    String text = "";
    String sql = "SELECT * FROM board";
    Connection conn = Util.getConnection();
    ResultSet res = null;
    PreparedStatement pstmt = Prepare.getPrepare(conn, sql);
    res = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Summernote</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
        <style>
            .note-editing-area {
                height: 30vw;
            }

            .note-editor {
                width: 60%;
            }
        </style>
    </head>
    <body>
        <form method="post" action = "boardSubmit.jsp">
            <textarea id="summernote" name="content"></textarea>
            <button type = "submit">제출</button>
        </form>
        <div><%
            while(res.next()) {
                %><div><%=res.getString("content")%></div><%
            }
        %></div>
        <script>
            $(document).ready(function() {
                $('#summernote').summernote();
            });
        </script>
    </body>
</html>