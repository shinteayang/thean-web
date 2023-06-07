<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util" %>
<%@ page import="DBPKG.Prepare" %>
<%
    request.setCharacterEncoding("UTF-8");

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String sql = "select * from CATE where categorynum = 27";

    conn = Util.getConnection();
    pstmt = Prepare.getPrepare(conn, sql);
    rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
        if (rs.next()) {
            %>
                <div>
                    <%=rs.getString("categorynum")%>
                </div>
            <%
        }
    %>
</body>
</html>