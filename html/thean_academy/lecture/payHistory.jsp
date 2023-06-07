<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Util"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss");
    int lid = 0;
	String today = sf.format(now);	
    String sl="";

	Connection conn = null;
  	PreparedStatement pstmt = null;
    conn = Util.getConnection();

    if(session == null || session.getAttribute("name")==null) {
	   %><script>alert("로그인 후 이용해주세요");</script><%
    } else {
    	Object ido = session.getAttribute("number");
    	lid = Integer.parseInt(ido.toString());
    }		
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>더안건축학원</title>
        <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/my.css" />
    </head>
    <body>
        <jsp:include page="../header/header.jsp"></jsp:include>
        <div id="main">
            <div id="body">
                <div class = "menu-container">
                    <div class = "menu">
                        <ul id = "menu-group">
                            <li><a href="mylecture.jsp">전체강의</a></li>
                            <li><a href="payHistory.jsp">결제내역</a></li>
                            <li><a href="dellecture.jsp">만료된 강의</a></li>
                        </ul>
                    </div>
                </div>
                <%
                    conn=null;
                    String sql="";
                    String k="";
                    Statement stmt = null;
                    try {
                        conn = Util.getConnection();
    
                        PreparedStatement ps = conn.prepareStatement("select * from buy where user_number="+lid+";");
                        k=String.format("%d", lid);
                        sql="select * from buy where user_number="+k+";";
                        ResultSet rs = ps.executeQuery();

                        String name = "";
                        
                        int number = 0;
                        int i = 1;
                %>
                <script>alert("<%=sql%>");</script>
                <%
                    while(rs.next()) {         
                %>
                <div class = "content-container">
                    <div class="content-element">
                        <div class="video-titlea">결제내역</div>
                    </div>
                    <div class="contents">
                        <div class = "pay-header">
                            <div class = "pay-title">제목</div>
                            <div style = "width: 20%;">가격</div>
                            <div style = "width: 10%;">결제 상태</div>
                            <div style = "width: 15%;">결제 방법</div>
                            <div style = "width: 15%;">결제일</div>
                        </div>
                        <div class = "pay-element">
                            <div class = "pay-title">캐드 실사도면 그리기</div>
                            <div style = "width: 20%;">300,000원</div>
                            <div style = "width: 10%;">성공</div>
                            <div style = "width: 15%;">신용카드</div>
                            <div style = "width: 15%;">2023/04/23</div>
                        </div>
                        <div class = "pay-element">
                            <div class = "pay-title">캐드 실사도면 그리기</div>
                            <div style = "width: 20%;">300,000원</div>
                            <div style = "width: 10%;">성공</div>
                            <div style = "width: 15%;">신용카드</div>
                            <div style = "width: 15%;">2023/04/23</div>
                        </div>
                        <div class = "pay-element">
                            <div class = "pay-title">캐드 실사도면 그리기</div>
                            <div style = "width: 20%;">300,000원</div>
                            <div style = "width: 10%;">성공</div>
                            <div style = "width: 15%;">신용카드</div>
                            <div style = "width: 15%;">2023/04/23</div>
                        </div>

                    </div>
                </div>
                    <%
                        }
                    } catch(Exception e) { 
                        %><h1>
                        실패 원인:
                        <%=e %></h1>
                    <%
                    }
                %>
            </div>
        </div>
        </div>
    </body>
</html>