<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String title = null;
    Connection conn = null;
    conn = Util.getConnection();

    String sql = "SELECT categoryname FROM CATE where categorynum=" + id;
    String sql2 = "SELECT mid_title as title, id FROM mid_title WHERE ctnum=" + id;

    PreparedStatement ps = conn.prepareStatement(sql);
    PreparedStatement ps2 = conn.prepareStatement(sql2);

    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        title = rs.getString("categoryname");
    }
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
                            <th style = "width: 80%;">목차</th>
                            <th style = "width: 20%;">기능</th>
                        </tr>
                        <%
                            ResultSet rs2 = ps2.executeQuery();
                            while(rs2.next()) {
                        %>
                            <tr>
                                <td><a href="a_video_list.jsp?id=<%=rs2.getString("id")%>&title=<%=rs2.getString("title")%>&ct=<%=id%>"><%=rs2.getString("title")%></a></td>
                                <td><a href="a_delete_index.jsp?id=<%=rs2.getInt("id")%>">삭제</a></td>
                            </tr>
                        <%
                            }
                        %>
                    </table>
                    <div>
                        <button class = "search-btn" type = "button" onClick = "location.href='add_index.jsp?id=<%=id%>'">목차 등록</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>