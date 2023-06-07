<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
	request.setCharacterEncoding("UTF-8");

	int id = Integer.parseInt(request.getParameter("id"));
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="../../../css/thean_academy/itnoticeas.css" />
</head>
<body>
	<jsp:include page="../header/header.jsp"></jsp:include>
	<div class = "main">
		<div class = "content">
			<%
				String sql = "select * from inoticeed where no="+id;
				
				try {
					Connection conn = Util.getConnection();
					PreparedStatement ps = Prepare.getPrepare(conn, sql);
					ResultSet rs = ps.executeQuery();
                    
					if(rs.next()) {
						%>
							<div class = "title"><%=rs.getString("index") %></div>
							<div class = "info-wrap">
								<div class = "info">
									<div class = "b">작성자</div>
									<div class = "w"><%=rs.getString("user")%></div>
								</div>
								<div class = "info">
									<div class = "b">작성날짜</div>
									<div class = "w"><%=rs.getString("date") %></div>
								</div>
							</div>
							<div class="te"><%=rs.getString("write") %></div>
							<a class = "back-btn" href="tacreate.jsp?pg=0">뒤로가기</a>
						<%
					}
				} catch (Exception e) { 
					%><h1>실패 원인: <%=e %>a</h1><%
				}
			%>
		</div>
	</div>
	<div class = "kakao" OnClick="window.open('https://open.kakao.com/o/g2kr00ad')"></div>
	<jsp:include page="../header/footer.jsp"></jsp:include>
</body>
</html>