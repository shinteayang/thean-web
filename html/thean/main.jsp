
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.UtilArc"%>
<%@ page import="DBPKG.Prepare"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>더안건축</title>
	<link rel="stylesheet" type="text/css" href="../../css/thean/main.css" />
</head>
<body>
	<div id = "main">
		<div id = "header">
            <jsp:include page="header.jsp"></jsp:include>
            <a class = "feature" href = "#body">
                <img src="../../upload_server/thean_resource/arrow_bottom.png" alt="" class = "arrow">
                Featured Works
            </a>
            <%
             Connection conn = null;
            try{
              conn = UtilArc.getConnection();
    
                        PreparedStatement ps = conn.prepareStatement("select * from slide");
                       
                        ResultSet rs = ps.executeQuery();
    
                        while(rs.next()){
                            %>
                                <div class="slide" style = "background-image: url('../../upload_server/thean_resource/<%=rs.getString("img")%>');"></div>
                            <%
                        }
            }catch(Exception e){



            }
            
            %>
            
		</div>
		<div id = "body">
            <div class = "photo-container">
                <div class = "photo-element">
                    <div class = "photo-title">설계</div>
                    <div class = "photo-list">
                    <%
                   
                    try {
                        conn = UtilArc.getConnection();
    
                        PreparedStatement ps = conn.prepareStatement("select * from arc where cat='설계'");
                       
                        ResultSet rs = ps.executeQuery();
    
                        while(rs.next()){
                            %>
                                <div class = "photos">
                                    <a href = "arc_info.jsp?id=<%=rs.getString("id")%>" class = "thumb-info">
                                        <div class = "thumb-title"><%=rs.getString("nm")%></div>
                                        <div class = "thumb-year"><%=rs.getString("year")%></div>
                                    </a>
                                    <div class = "thumb" style = "background-image: url('../../upload_server/thean_resource/<%=rs.getString("phm")%>');"></div>
                                </div>      
                            <%
                        }
                        %>
                        <div class = "more">
                        <a href="design.jsp">더보기</a>
                    </div>
                </div>
                </div>
                <div class = "photo-element">
                    <div class = "photo-title">실측</div>
                    <div class = "photo-list">
                        
                        <%
                        ps = conn.prepareStatement("select * from arc where cat='실측'");
                       
                        rs = ps.executeQuery();
    
                        while(rs.next()){
                            %>
                      <div class = "photos">
                            <a href = "arc_info.jsp?id=<%=rs.getString("id")%>" class = "thumb-info">
                                <div class = "thumb-title"><%=rs.getString("nm")%></div>
                                <div class = "thumb-year"><%=rs.getString("year")%></div>
                            </a>
                             <div class = "thumb" style = "background-image: url('../../upload_server/thean_resource/<%=rs.getString("phm")%>');"></div>
                        </div>      
                            
                            
                            
                            <%


                        }




                        %>
                        
                          </div>
                    <div class = "more">
                        <a href="actual.jsp">더보기</a>
                    </div>
                </div>
                <div class = "photo-element">
                    <div class = "photo-title">준공</div>
                    <div class = "photo-list">
                        
                        <%
    
     ps = conn.prepareStatement("select * from arc where cat='준공'");
                       
                        rs = ps.executeQuery();
    
                        while(rs.next()){
                            %>
                      <div class = "photos">
                            <a href = "arc_info.jsp?id=<%=rs.getString("id")%>" class = "thumb-info">
                                <div class = "thumb-title"><%=rs.getString("nm")%></div>
                                <div class = "thumb-year"><%=rs.getString("year")%></div>
                            </a>
                             <div class = "thumb" style = "background-image: url('../../upload_server/thean_resource/<%=rs.getString("phm")%>');"></div>
                        </div>        
                            <%
                        }
                }catch(Exception e){
            %><%=e%><%
                }
                %>    
                    </div>
                    <div class = "more">
                        <a href="completion.jsp">더보기</a>
                    </div>
                </div>
            </div>
		</div>
	</div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            startSlideshow();
        });

        function startSlideshow() {
            let slides = document.querySelectorAll(".slide");
            slides[0].classList.add("active");

            // 슬라이드 전환 주기 설정 (5초마다)
            setInterval(function() {
                // 현재 활성화된 슬라이드 찾기
                let currentSlide = document.querySelector(".slide.active");

                // 다음 슬라이드로 전환
                currentSlide.classList.remove("active");
                if (currentSlide.nextElementSibling) {
                currentSlide.nextElementSibling.classList.add("active");
                } else {
                slides[0].classList.add("active");
                }
            }, 5000); // 5초마다 전환
        }
    </script>
</body>
</html>