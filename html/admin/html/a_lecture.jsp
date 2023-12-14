<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Connection conn = null;
    conn = Util.getConnection();
    String sql = "SELECT categorynum, categoryname, day, te_name, format(price, 0) as f_price, th_cat, img, te_no FROM CATE";
    String id = null;

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
                    <div class="main-title">강의 관리</div>
                    <table id = "table">
                        <tr>
                            <th style = "width: 20%;">썸네일</th>
                            <th style = "width: 30%;">제목</th>
                            <th style = "width: 10%;">카테고리</th>
                            <th style = "width: 10%;">강사</th>
                            <th style = "width: 20%;">가격</th>
                            <th style = "width: 10%;">기능</th>
                        </tr>
                        <%
                            ResultSet rs = ps.executeQuery();
                            while(rs.next()) {
                        %>
                            <tr>
                                <td><div class = "thumb" style = "background-image: url('../../../uploadimg/<%=rs.getString("img")%>');"></div></td>
                                <td><a href="a_video_index.jsp?id=<%=rs.getInt("categorynum")%>"><%=rs.getString("categoryname")%></a></td>
                                <td><%=rs.getString("th_cat")%></td>
                                <td><%=rs.getString("te_name")%></td>
                                <td><%=rs.getString("f_price")%>원</td>
                                <td><a href="a_delete_lecture.jsp?id=<%=rs.getInt("categorynum")%>">삭제</a></td>
                            </tr>
                        <%
                            }
                        %>
                    </table>
                    <form action="add_lecture.jsp">
                        <button class = "search-btn" type = "submit">강의 등록</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
<%
    conn.close();
%>