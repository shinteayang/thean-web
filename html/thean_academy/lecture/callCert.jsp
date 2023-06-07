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
                            <div class = "line"></div>
                            <li><a href="callCert.jsp">이수한 강의</a></li>
                            <div class = "line"></div>
                            <li><a href="dellecture.jsp">만료된 강의</a></li>
                        </ul>
                    </div>
                </div>
                  <div class = "content-container">
                    <div class="content-element">
                        <div class="video-titlea">이수한 강의</div>
                    </div>
                    <div class="contents">
                        <div class = "pay-header">
                            <div class = "pay-title">강의명</div>
                            <div style = "width: 20%;">강사명</div>
                            <div style = "width: 10%;">강의분류</div>
                            <div style = "width: 15%;">난이도</div>
                            <div style = "width: 15%;">이수증</div>
                        </div>
                <%
                    conn=null;

                    try {
                        conn = Util.getConnection();
    
                        PreparedStatement ps = conn.prepareStatement("select * from cert where usernum="+lid+";");
                        ResultSet rs = ps.executeQuery();

                        String name = "";
                        
                        int number = 0;
                        int i = 1;

                        while(rs.next()) {       

                    
                      
                            PreparedStatement peds = conn.prepareStatement("select * from CATE where categorynum="+rs.getInt("ctnum")+";");
                        ResultSet reds = peds.executeQuery();

                        if(reds.next()){
                            %>
                            <div class = "pay-element">
                            <div class = "pay-title"><%=reds.getString("categoryname")%></div>
                            <div style = "width: 20%;"><%=reds.getString("te_name")%></div>
                            <div style = "width: 10%;"><%=reds.getString("th_cat")%></div>
                            <div style = "width: 15%;"><%=reds.getString("diffculty")%></div>
                            <div style = "width: 15%;"><a href="certification.jsp?ct=<%=reds.getString("categoryname")%>&name=<%=session.getAttribute("name")%>&ho=<%=rs.getString("id")%>">다운로드</a></div>
                        </div>
                           
                            
                            <%


                        


                        }

                
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
        </div>
        </div>
    </body>
</html>