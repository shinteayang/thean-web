<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!doctype html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>더안건축-관리자</title>
        <link rel="stylesheet" href="../css/index.css" />
    </head>
    <body>
        <div class = "body">
            <jsp:include page="menubar.jsp"></jsp:include>
            <div class="main-container">
                <div class="main-elements">
                    <div class="box">
                        <div class = "box-elements">
                            <div class="box-title">서버 상태</div>
                        </div>
                    </div>
                    <div class="box">
                        <div class = "box-elements">
                            <div class="box-title">총 수익</div>
                            <%
                                Connection conn = null;
                                conn = Util.getConnection();

                                try {
                                    PreparedStatement ps = conn.prepareStatement("select sum(price) as Pic from buy where buy_info='정상결제'");
                                    ResultSet rs = ps.executeQuery();

                                    if(rs.next()) { 
                                        %><h4><%=rs.getInt("Pic")%>원</h4><%
                                    } else {
                                        %><h4>0원</h4><% 
                                    }          
                                } catch(Exception e) { 
                                    %><h1><%=e %></h1><% 
                                }                    
                            %>
                        </div>
                    </div>
                    <div class="box">
                        <div class = "box-elements">
                            <div class="box-title">더안건축학원 조회수</div>
                        </div>
                    </div>
                    <div class="box">
                        <div class = "box-elements">
                            <div class="box-title">더안건축 조회수</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>