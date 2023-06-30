<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="../../css/thean_academy/notice.css">  
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div id="body">
            <div>
                <div class="title">공지사항</div>
            </div>
            <div class = "table-container">
                <table id="table">
                    <th class="th">게시번호</th>
                    <th class="th">공지사항</th>
                    <th class="th">게시날짜</th>
                    <th class="th">작성자</th>
                    <th class="th">분류</th>
                    <%
        request.setCharacterEncoding("UTF-8");

        String sql = "select * from inotice ORDER BY no ASC;";

        Connection conn = Util.getConnection();     
        ResultSet res = null;
        
        try {	 
            PreparedStatement ps = Prepare.getPrepare(conn, sql);
            ResultSet rs = ps.executeQuery();
        

            while(rs.next()){
                %>
                    <tr>
                        <td><%=rs.getString("no") %></td>
                        <td style = "text-align: left;"><a href="itnoticeas.jsp?id=<%=rs.getInt("no")%>"><%=rs.getString("index") %></a></td>
                        <td><%=rs.getString("date") %></td>
                        <td><%=rs.getString("user") %></td>
                        <td><%=rs.getString("cat") %></td>
                    </tr>         
                <%     
            }
        } catch (Exception e) { 
            %><h1>실패 원인: <%=e %>a</h1><%
        }
        %>
                </table>
            </div>
        </div>
        <div class = "kakao" OnClick="window.open('https://open.kakao.com/o/g2kr00ad')"></div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>