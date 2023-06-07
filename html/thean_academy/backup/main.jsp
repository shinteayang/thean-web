<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Util"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<%
//log패키지


	String ip = request.getHeader("x-forwarded-for");
	 if (ip == null || ip.length() == 0) {
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	 
	    if (ip == null || ip.length() == 0) {
	        ip = request.getHeader("WL-Proxy-Client-IP");  // 웹로직
	    }
	 
	    if (ip == null || ip.length() == 0) {
	        ip = request.getRemoteAddr() ;
	    }
	Date now = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss");
    String lid = "";
	String today = sf.format(now);	
	if(session == null || session.getAttribute("name")==null) {
	   lid="비회원";
    } else {
    	Object ido = session.getAttribute("number");
    	lid = ido.toString();
    	
    }		
	
	Connection conn = null;
  	PreparedStatement pstmt = null;
    conn = Util.getConnection();
	
	try{
	
		pstmt = conn.prepareStatement("INSERT INTO iplog (ip,data,id,server,page,loga,logb,logc) VALUES (?,?,?,?,?,?,?,?)");

		pstmt.setString(1, ip);
		pstmt.setString(2,today);
		pstmt.setString(3, lid);
		pstmt.setString(4, "정상");
		pstmt.setString(5, "main.jpg");
		pstmt.setString(6, "단순접속");
		pstmt.setString(7, "기록없음");
		pstmt.setString(8, "기록없음");
		
		pstmt.executeUpdate();
		conn.close();

	}catch(Exception e){ 
        %><h1>실패 원인:<%=e %></h1><%
        
	}

	%>




<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>더안학원</title>
    <link rel="stylesheet" type="text/css" href="../../css/thean_academy/main.css" />
    </head>
<body>
	<div id="main">
		<jsp:include page="header.jsp"></jsp:include>
		<div id="slide">
			<img src="background.jpeg" alt="1"  style=""/>
		
		</div>
		<div id="body">
			<%
                conn=null;
            
                Statement stmt = null;
                try {
                    conn = Util.getConnection();
 
                    PreparedStatement ps = conn.prepareStatement("select DISTINCT th_cat from CATE;");
                    ResultSet rs = ps.executeQuery();

                    String name = "";
                    
                    int number = 0;
                    int i = 1;

                    while(rs.next()) {
                        String ctd = rs.getString("th_cat");
                        String fileSize = "";
                        String fileType = "";
            %>
            <div id="video-list">
                <div class="video-titlea"><%=ctd %></div>
                <%
                    PreparedStatement pes=conn.prepareStatement("select categorynum, img, format(price, 0) as price, day, th_cat, categoryname, te_name, th_cat, diffculty from CATE where th_cat=?;");
                    pes.setString(1,ctd);
                    ResultSet res=pes.executeQuery();
                    while(res.next()) {
                %>
                <a class="link" href="lecture_info.jsp?id=<%=res.getInt("categorynum")%>">
                    <div class="video-content">
                        <div class = "difficulty"></div>
                        <div>
                            <div class="title"><%=res.getString("categoryname") %></div>
                            <div class="designer-info">
                                <div class="designer">
                                    <%=res.getString("te_name")%>
                                </div>
                            </div>
                        </div>
                        <div class = "difficulty-price">
                            <div class = "difficulty-info">
                                <%
                                    for (int j = 1 ; j <= res.getInt("diffculty") ; j++) {
                                        %>★<%
                                    }
                                %>
                            </div>
                            <div class="price-info">
                                <div class="price">₩<%=res.getString("price")%> / <%=res.getString("day")%>일</div>
                            </div>
                        </div>
                    </div>
                    <div class="thumb" style="background-image: url('../../uploadimg/<%=res.getString("img") %>');"></div>
                </a>
                <% 
                    }
                %>
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
    <div class = "kakao" OnClick="window.open('https://open.kakao.com/o/g2kr00ad')">
        
    </div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>