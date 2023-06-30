<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page session="true" %>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
	request.setCharacterEncoding("UTF-8");
    
	int id = Integer.parseInt(request.getParameter("id"));

    int buy = 1;
    int date = 0;
    int vsct = 0;
    String sqlad="";
	String te_no = "";
	String ct_name = "";
	String name = "";
	String ct_info = "";
	String niz = "";
	String te_if = "";
	String te_ifa = "";
	String free = "";
	String cover = "";
	String price = "";
	String day = "";
    
    int difficulty = 0;

    String sql = "select * from CATE where categorynum="+id;

	Connection conn = Util.getConnection();     
    ResultSet res = null;
	
	try {	 
    	PreparedStatement ps = Prepare.getPrepare(conn, sql);
		ResultSet rs = ps.executeQuery();
		
		int number = 0;
		int i=1;

        if (rs.next()) {
            name = rs.getString("te_name");
            ct_name = rs.getString("categoryname");
            ct_info = rs.getString("ct_info");
            niz = rs.getString("niz");
            te_no = rs.getString("te_no");
            difficulty = rs.getInt("diffculty");
            free = rs.getString("free");
            cover = rs.getString("cover");
            price = rs.getString("price");
            day = rs.getString("day");
        }
	} catch (Exception e) { 
		%><h1>실패 원인: <%=e %>a</h1><%
	}
    
	try {		 
        PreparedStatement ps = conn.prepareStatement("select * from teacher where teacher_no="+te_no);
        ResultSet rs = ps.executeQuery();

        PreparedStatement pes = conn.prepareStatement("select *, format(price, 0) as pricec from CATE where categorynum=?");
        pes.setInt(1, id);
        res = pes.executeQuery();
		
		int number = 0;
		int i = 1;

		if (rs.next()) {
            te_if = rs.getString("teacher_info");
            te_ifa = rs.getString("teacher_car");
		}

	} catch (Exception e) { 
		%><h1>실패a 원인: <%=e %>b</h1><%
	}

	if (session == null || session.getAttribute("name") == null) { buy = 2; }

    else {
        Object op = session.getAttribute("op");
        Object op2 = session.getAttribute("number");

        int op_a = 0;
        int op_b = 0;

        op_a = Integer.parseInt(op.toString());
        op_b = Integer.parseInt(op2.toString());
         
       
        if (op_a < 4) {    

            try {
                PreparedStatement ps = conn.prepareStatement("select * from buy where user_number="+op_b+" and ct_number="+id);
                sqlad="select * from buy where user_number="+op_b+"and ct_number="+id;
                ResultSet rs = ps.executeQuery();
                
     
     
                if (rs.next()) {
                    date = rs.getInt("date");
                    vsct = rs.getInt("ct_number");
                } else {
                    buy=0;  
                  
                }

                 
            } catch (Exception e) { e.printStackTrace(); 
             %>
                    <script>
                    alert("<%=sqlad%>");
                    </script>
                    <%
     
            }

            if (vsct == 0 || id != vsct) { buy = 0; } 
            else if (date < 1) { buy = 0; }
        } else { buy=1; }
    }
%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>더안학원</title>
        <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/lecture_info.css"/>
    </head>
    <body>
        <jsp:include page="../header/header.jsp"></jsp:include>
        <div id = "main">
            <div id = "body">
                <div class = "title-container">
                    <div class = "video-title">
                        <div class = "title" style="color:white;"><%=ct_name %></div>
                        <div class = "teacher-name" style="color:white;"><%=name %></div>
                    </div>
                </div>
                <div class = "bg-container" style = "background-image: url('../../../upload_server/category/cover/<%=cover%>')"></div>
                <div class = "lecture-video-container">
                    <div class = "lecture">
                        <div class = "video-frame">
                            <video class = "lecture-intro-video" controls controlsList="nodownload" oncontextmenu='return false'>
                                <source src="../../../upload_server/category/video/<%=free %>" type="video/mp4">
                            </video>
                        </div>
                    </div>
                </div>
                <div class = "info-container">
                    <div class = "video-info-container">
                        <div class = "info-title">강의소개</div>
                        <div class = "video-info">
                            <div class = "info-area"><%=ct_info %></div>
                        </div>
                        <div class = "difficulty">
                            난이도: &nbsp;
                            <div><% for (int k = 1 ; k <= difficulty ; k++) { %>★<% } %></div>
                        </div>
                    </div>
                    <div class = "video-content">
                        <% if (res.next()) { %>
                            <div class = "content-title"><%=res.getString("categoryname") %></div>
                            <div class = "category-container">
                                <div class = "category">
                                    <div class = "category-info">강사</div>
                                    <div class = "category-content"><%=res.getString("te_name")%></div>
                                </div>
                                <div class = "category">
                                    <div class = "category-info">카테고리</div>
                                    <div class = "category-content"><%=res.getString("th_cat")%></div>
                                </div>
                                <div class = "category">
                                    <div class = "category-info">가격</div>
                                    <div class = "category-content"><%=res.getString("pricec")%>원</div>
                                </div>
                                <div class = "category">
                                    <div class = "category-info">수강일수</div>
                                    <div class = "category-content"><%=res.getString("day")%></div>
                                </div>
                                <div class = "category">
                                    <div class = "category-info">난이도</div>
                                    <div class = "category-content">
                                        <% for (int i = 1 ; i <= res.getInt("diffculty") ; i++) { %>★<% } %>
                                    </div>
                                </div>
                            </div>
                            <% if (buy == 1) { %>	
                                    <a class = "link" href="../lecture/lecture.jsp?id=<%=id%>&cn=1" style = "color: white;" ><button type="button" class = "btn">강의시청</button></a>
                                <% } else if (buy == 2) { %>
                                    <a class = "link"href="../login/login.jsp?id=1" style = "color: white;" ><button type="button" class = "btn">로그인 후 구매하기</button></a>
                                <% } else { %>
                                    <a class = "link"href="../buy/buy.jsp?id=<%=id%>&cp=0" style = "color: white;"><button type="button" class = "btn">구매하기</button></a>
                                <% } %> 
                        <% } %>
                    </div>	
                </div>
                <div class = "recommend-container">
                    <div class = "recommend">
                        <div class = "info-title">이런 분들께 강의를 추천드립니다</div>
                        <div class = "who-recommend">
                            <div class = "info-area"><%=niz %></div>
                        </div>
                    </div>
                </div>
                <div class = "teacher-container">
                    <div class = "teacher">
                        <div class = "info-title">강사소개</div>
                        <div class = "teacher-info">
                            <div class = "info-area"><%=te_if %></div>
                            <div class = "info-area"><%=te_ifa %></div>
                        </div>
                    </div>
                </div>
                <div class = "portfolio-container">
                    <div class = "portfolio">
                        <div class = "info-title">강사 포트폴리오</div>  
                        <div class = "portfolio-list">
                            <% 
                                try {           
                                    PreparedStatement ps = conn.prepareStatement("select * from portfolio where teacher_no="+te_no);
                                    ResultSet rs = ps.executeQuery();

                                    int number = 0;
                                    int i = 1;

                                    while (rs.next()) {
                                        %>
                                            <img class = "pf-img" src="../../../upload_server/teacher/<%=rs.getString("pf_img")%>">
                                        <%
                                    }
                                } catch (Exception e) { 
                                    %><h1>실패a 원인: <%=e %></h1><%
                                }
                            %>
                        </div>
                    </div>
                </div>
                <div class = "index-container">
                    <div class = "index">
                        <div class = "info-title">강의 목차</div>
                        <div class = "lecture-index">
                             <div class="menu-container">  
                                <%
                                    try{       
                                        PreparedStatement ps = conn.prepareStatement("select DISTINCT mid_title from MV where categorynum="+id);
                                        ResultSet rs = ps.executeQuery();
                                        
                                        int number = 0;
                                        int i = 1;
                                        int mvtol;
                        
                                        while(rs.next()) {
                                            %>
                                                <div class="headline">
                                                    <div style="margin-left: 1vw;"><%=rs.getString("mid_title")%></div>
                                                    <button type = "button" class = "plus" style="margin-right: 1vw;">▼</button>
                                                </div>
                                                <div class = "sub-title-container hidden">
                                                <%                                
                                                    PreparedStatement psb=conn.prepareStatement("select * from MV where mid_title='"+rs.getString("mid_title")+"';");
                                                    ResultSet rsb=psb.executeQuery();

                                                    while(rsb.next()) {
                                                        mvtol=rsb.getInt("mv_tol");

                                                        %>
                                                            <div class="sub-title">
                                                                <div style="margin-left: 1vw;"><%=rsb.getString("mv_name") %></div>
                                                            </div>
                                                        <% 
                                                    }
                                            %></div><%
                                        }
                                    } catch(Exception e) { 
                                        %><h1>실패 원인:<%=e %></h1><%
                                    }    
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>       
        <script>
            const btns = document.querySelectorAll(".plus");
            const subs = document.querySelectorAll(".sub-title-container");
            const sub_btns = document.querySelectorAll(".sub-title");

            const isToggled = new Array(btns.length).fill(false);

            btns.forEach((btn, index) => {
                btn.addEventListener("click", () => {
                    isToggled[index] = !isToggled[index];
                    btn.textContent = isToggled[index] ? "▲" : "▼";
                    subs[index].classList.toggle("hidden");
                });
            });
        </script>
    </body>
</html>