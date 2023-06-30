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
                <%
                    conn=null;
                    String sql="";
                    String k="";
                    Statement stmt = null;
                    try {
                        conn = Util.getConnection();
    
                        PreparedStatement ps = conn.prepareStatement("select * from buy where user_number="+lid+" and date>1;");
                        k=String.format("%d", lid);
                        sql="select * from buy where user_number="+k+";";
                        ResultSet rs = ps.executeQuery();

                        String name = "";
                        
                        int number = 0;
                        int i = 1;
                %>
                <div class = "content-container">
                    <div class="content-element">
                    
                        <div class="video-titlea">내 강의</div>
                    </div>
                    <div class="contents">
                <%
                    while(rs.next()) {         
                %>
                
                        <%
                            PreparedStatement pes=conn.prepareStatement("select categorynum, img, format(price, 0) as price, day, th_cat, categoryname, te_name, th_cat, diffculty from CATE where categorynum="+rs.getInt("ct_number")+";");

                            ResultSet res=pes.executeQuery();
                            while(res.next()) {
                            %>
                                <div class = "shadow">
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
                                                    <div class="price">남은수강일:<%=rs.getString("date")%>일</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="thumb" style="background-image: url('../../../uploadimg/<%=res.getString("img") %>');"></div>
                                    </a>
                                    <div class = "long">
                                        <form id = "long-element" action="../buy/buyud.jsp" method="get">
                                            <div class = "long-element">
                                                <select name="select" id="tec">
                                                    <option value="1">10일</option>
                                                     <option value="2">20일</option>
                                                      <option value="3">30일</option>
                                                </select>
                                                <input type="text" name="ct" value="<%=res.getString("categorynum")%>" hidden>
                                                <input type="text" name="cp" value="0" hidden>
                                                <div style = "display: flex; gap: 8px;">
                                                    <button class = "long-btn">연장</button>
                                                    <button class = "long-btn" onClick = "location.href='../notice/notice.jsp?pg=0&se=all'" type = "button">환불</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            <% 
                            }
                        %>
                    
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
        </div>
        </div>
    </body>
</html>