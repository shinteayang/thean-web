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
    String sl="";



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
        sl="INSERT INTO iplog (ip,data,id,server,page,loga,logb,logc) VALUES (?,?,?,?,?,?,?,?)";
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
        %><h1>실패 원인:<%=e %></h1>
        <h1>실패 원인:<%=sl %></h1>
        
        <%
        
	}

	%>




<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>더안건축학원</title>
    <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/main.css" />
    </head>
    <script>
        let radios = document.getElementsByName("slide"); // 라디오 버튼 요소 가져오기
        let index = 0; // 첫 번째 라디오 버튼을 선택합니다.

        setInterval(function() {
            radios[index].checked = true; // 라디오 버튼 선택하기
            index++; // 다음 라디오 버튼 선택을 위해 인덱스를 증가시킵니다.
            if (index >= radios.length) {
                index = 0; // 마지막 라디오 버튼 다음에는 첫 번째 라디오 버튼부터 다시 시작합니다.
            }
        }, 4000); // 1초마다 라디오 버튼 선택하기
    </script>
<body>
	<div id="main">
		<jsp:include page="../header/header.jsp"></jsp:include>
        <div class="section">
            <input type="radio" name="slide" id="slide01" checked>
            <input type="radio" name="slide" id="slide02">
            <input type="radio" name="slide" id="slide03">
            <div class="slidewrap"> 
                <ul class="slidelist">
                    <li class="slideitem">
                        <a>
                            <div class = "slide-img" style = "background-image: url('../../../img/slide/1.jpg')"></div>
                        </a>
                    </li>
                    <li class="slideitem">
                        <a>
                            <div class = "slide-img" style = "background-image: url('../../../img/slide/2.jpg')"></div>
                        </a>
                    </li>
                    <li class="slideitem">
                        <a>  
                            <div class = "slide-img" style = "background-image: url('../../../img/slide/3.jpg')"></div>
                        </a>
                    </li class="slideitem">
                </ul>
                <ul class="slide-pagelist">
                    <li><label for="slide01"></label></li>
                    <li><label for="slide02"></label></li>
                    <li><label for="slide03"></label></li>
                </ul>
            </div>
        </div>
		<div id="body">
            <div class = "notice-container">
                <div class = "notice-board">
                    <div class = "n-con">
                        <div class = "n-title">공지사항</div>
                        <a href="../notice/itnotice.jsp?pg=0" class = "more">더보기</a>
                    </div>
                    <div class = "notice-elements">
                    <%
                        try {
                            conn = Util.getConnection();
        
                            PreparedStatement peds = conn.prepareStatement("select * from inotice ORDER BY no DESC LIMIT 5;");
                            ResultSet reds = peds.executeQuery();

                            String name = "";
                            
                            int number = 0;
                            int i = 1;

                            while(reds.next()) {
                                %>
                                <div class = "notice-content"><a href="../notice/itnoticeas.jsp?id=<%=reds.getString("no")%>"><%=reds.getString("index")%></a></div>
                                
                                
                                <%
                            }
                        } catch(Exception e) {
                            %><%=e%><%
                        }
                    %>                     
                    </div>
                </div>
                <div class = "notice-board">
                    <div class = "n-con">
                        <div class = "n-title">TA 크리에이터</div>
                        <a href="../notice/tacreate.jsp?pg=0" class = "more">더보기</a>
                    </div>
                    <div class = "notice-elements">
                    <%
                        try {
                            PreparedStatement pedsd = conn.prepareStatement("select * from inoticeed ORDER BY no DESC LIMIT 0,5;");
                            ResultSet rad= pedsd.executeQuery();

                            String name = "";
                            
                            int number = 0;
                            int i = 1;

                            while(rad.next()) {
                                %><div class = "notice-content"><a href="../notice/tacreatean.jsp?id=<%=rad.getString("no")%>"><%=rad.getString("index")%></a></div><%
                            }
                        } catch(Exception e){
                            %><%=e%><%
                        }
                    %>                  
                    </div>
                </div>
                <div class = "notice-board">
                    <iframe src="https://www.youtube.com/embed/Wt7HtNSHhwg" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                </div>
            </div>
            <div class = "n-con" style = "margin-bottom: 3vw;">
                <div class = "n-title">온라인 강의</div>
                <a href="../lecture/lectures.jsp" class = "more">더보기</a>
            </div>
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
                    PreparedStatement pes=conn.prepareStatement("select categorynum, img, format(price, 0) as price, day, th_cat, categoryname, te_name, th_cat, diffculty from CATE where th_cat=? limit 4;");
                    pes.setString(1,ctd);
                    ResultSet res=pes.executeQuery();
                    while(res.next()) {
                %>
                <a class="link" href="../lecture/lecture_info.jsp?id=<%=res.getInt("categorynum")%>">
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
                    <div class="thumb" style="background-image: url('../../../uploadimg/<%=res.getString("img") %>');"></div>
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
		<script>
		    alert("더안건축학원 홈페이지는 현재 구축중입니다\n참고 부탁드립니다");
		</script>
	</div>
	</div>
	<jsp:include page="../header/footer.jsp"></jsp:include>
</body>
</html>
