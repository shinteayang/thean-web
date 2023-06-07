<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    int us = Integer.parseInt(request.getParameter("us"));

    String sqla = "";
    String sql = "select * from cs where no="+id+" and user_no="+us+";";
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="../../css/thean_academy/itnoticeas.css" />
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div class = "main">
            <div class = "content">
                <%              
                    try {
                        Connection conn = Util.getConnection(); 
                        PreparedStatement ps = Prepare.getPrepare(conn, sql);
                        ResultSet rs = ps.executeQuery();
                    
                        if(rs.next()) {
                            %>  
                                <div class = "title"><%=rs.getString("idx") %></div>
                                <div class = "info-wrap">
                                    <div class = "info">
                                        <div class = "b">작성자</div>
                                        <div><%=rs.getString("username")%></div>
                                    </div>
                                    <div class = "info">
                                        <div class = "b">작성날짜</div>
                                        <div><%=rs.getString("date") %></div>
                                    </div>
                                </div>
                                <textarea readonly class="te"><%=rs.getString("text") %></textarea>
                            <%   
                        } 
                        
                        sqla = "select answer,datean,answerte from cs where no="+id+" and user_no="+us+" and checkaa='답변완료';";
                        PreparedStatement pes = Prepare.getPrepare(conn, sqla);
                        ResultSet res = pes.executeQuery();
                    
                        if(res.next()) {
                            %>   
                                <div class = "title">Re:<%=rs.getString("idx") %></div>
                                <div class = "info-wrap">
                                    <div class = "info">
                                        <div class = "b">답변부서</div>
                                        <div><%=rs.getString("answerte")%></div>
                                    </div>
                                    <div class = "info">
                                        <div class = "b">답변날짜</div>
                                        <div><%=rs.getString("date") %></div>
                                    </div>
                                </div>
                                <textarea readonly class="te"><%=rs.getString("answer") %></textarea>  
                            <%     
                        }  
                    } catch (Exception e) { 
                        %><h1>실패 원인: <%=sqla %>a</h1><%
                    }
                %>
                <a class = "back-btn" href="itnotice.jsp">뒤로가기</a>  
            </div>
        </div>
        <div class = "kakao" OnClick="window.open('https://open.kakao.com/o/g2kr00ad')"></div>
	    <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>