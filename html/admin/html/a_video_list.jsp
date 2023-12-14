<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    int ct = Integer.parseInt(request.getParameter("ct"));
    String title = request.getParameter("title");

    Connection conn = null;
    conn = Util.getConnection();

    String sql = "SELECT * FROM MV WHERE mid_title=" + id;

    PreparedStatement ps = conn.prepareStatement(sql);
%>
<!doctype html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>더안건축-관리자</title>
        <link rel="stylesheet" href="../css/teacher.css" />
        <link rel="stylesheet" href="../css/co.css" />
    </head>
    <body>
        <div class = "body">
            <jsp:include page="menubar.jsp"></jsp:include>
            <div class="main-container">
                <div class = "main-elements">
                    <div class="main-title"><%=title%></div>
                    <table id = "table">
                        <tr>
                            <th style = "width: 80%;">영상 제목</th>
                            <th style = "width: 20%;">기능</th>
                        </tr>
                        <%
                            ResultSet rs = ps.executeQuery();
                            while(rs.next()) {
                        %>
                            <tr>
                                <form action="update_video.jsp?number=<%=rs.getInt("mv_number")%>" name = "form" method = "post" enctype="multipart/form-data">
                                    <td><input type="text" value = "<%=rs.getString("mv_name")%>" name="link"><input type="file" name = "file1"><input type="hidden" name = "id" value = "<%=rs.getInt("mv_number")%>"></td>
                                    <td><button type = "submit">수정</button> / <a href="a_delete_video.jsp?id=<%=rs.getInt("mv_number")%>&title=<%=title%>&ct=<%=ct%>">삭제</a></td>
                                </form>
                            </tr>
                        <%
                            }
                        %>
                    </table>
                    <button class = "search-btn" type = "button" onClick = "location.href='add_video.jsp?id=<%=id%>&ct=<%=ct%>'">영상 추가</button>
                </div>
            </div>
        </div>
    </body>
</html>