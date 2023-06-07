<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    int cn = Integer.parseInt(request.getParameter("cn"));
String free="";
    String ct_name = "";
    String name = "";
    String ct_info = "";
    String title_m = "";
    String link = "";
    String mid_title = "";
    String mvlk = "";
    String fl = "";

    int mvtol = 0;
    int date = 0;
    int vsct = 0;

    Connection conn = null;
    conn = Util.getConnection();

    if(session == null || session.getAttribute("name")==null) {
        %>
            <script>
                alert("잘못된 접근 경로입니다!!");
                var link = 'https://www.thean-ac.com:8081/source/html/thean_academy/main.jsp';
                
                location.href=link;
                location.replace(link);
                window.open(link);
            </script>
        <%
    } else {
        Object op = session.getAttribute("op");
        Object op2 = session.getAttribute("number");
        int op_a = 0;
        int op_b = 0;
        op_a = Integer.parseInt(op.toString());
        op_b = Integer.parseInt(op2.toString());
        
        try{  
            PreparedStatement ps = conn.prepareStatement("select * from CATE where categorynum="+id+";");
            ResultSet rs = ps.executeQuery();
	 
            if(rs.next()){ fl=rs.getString("file");
            free=rs.getString("free");
            }

        } catch(Exception e) { 
            %><h1>실패 원인:<%=e %></h1><%
        }

    if(op_a < 4) {
    	try{ 
 			PreparedStatement ps = conn.prepareStatement("select * from buy where user_number="+op_b);
 			ResultSet rs = ps.executeQuery();
 
            if(rs.next()) {
                date = rs.getInt("date");
                vsct = rs.getInt("ct_number");
            } else {
                %>
                    <script>
                        alert("잘못된 접근경로입니다!!");
                        var link = 'http://www.thean-ac.com:8081/source/html/thean_academy/main.jsp';
                        
                        location.href=link;
                        location.replace(link);
                        window.open(link);
                    </script>
 			    <%	
 		    }
 		} catch(Exception e) { 
 			%><h1>실패 원인:<%=e %></h1><%
 		}

    	if(vsct == 0 || id != vsct) {
            %>
                <script>
                    alert("잘못된 접근경로입니다!!");
                    var link = 'http://www.thean-ac.com:8081/source/html/thean_academy/main.jsp';
                    
                    location.href=link;
                    location.replace(link);
                    window.open(link);
                </script>
            <%
    	} else if(date < 1) {
    		%>
                <script>
                    alert("잘못된 접근경로입니다!!");
                    var link = 'http://www.thean-ac.com:8081/source/html/thean_academy/main.jsp';
                    
                    location.href=link;
                    location.replace(link);
                    window.open(link);
                </script>
    		<% 
    	}
    }
}

    try {
        PreparedStatement ps = conn.prepareStatement("select * from MV where categorynum="+id+" and mv_tol="+cn+";");
        ResultSet rs = ps.executeQuery();
         
        int number = 0;
        int i = 1;

        if(rs.next()) {
            name = rs.getString("mv_name");
            ct_name = rs.getString("categoryname");
            ct_info = rs.getString("mv_info");
            title_m = rs.getString("mid_title");
            link = rs.getString("mv_link");
            mid_title = rs.getString("mid_title");
            mvlk = mid_title+"/"+link;
        }
		
	} catch(Exception e){ 
        %><h1>실패 원인:<%=e %></h1><%
	}
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>더안학원</title>
        <link rel="stylesheet" type="text/css" href="../../css/thean_academy/lecture.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function() {
                $('input[type=radio][name=title]').change(function() {
                    var option = $(this).val();
                    var id = <%=id%>;
                    $.ajax({
                        url: "lectureList.jsp",
                        type: "POST",
                        data: {
                            option: option,
                            id: id
                        },
                        success: function(data) {
                            $(".video").html(data);
                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <div id="main">
            <div id="body">
                <div class="menubar">
                    <div class="info-container">
                        <div class="title-container">
                            <div class="title"><%=ct_name %></div>
                            <div class="leftover-day">잔여 수강일: 일</div>
                            <div class="lecture-progress">
                                0%
                                <progress id="progress" value="0" max="100"></progress>
                            </div>
                        </div>
                    </div>
                    <div class="menu-container">
                        <%
                            try{       
                                PreparedStatement ps = conn.prepareStatement("select DISTINCT mid_title from MV where categorynum="+id+";");
                                ResultSet rs = ps.executeQuery();
                                
                                int number = 0;
                                int i = 1;

                                while(rs.next()) {
                                    %>
                                        <div class="headline">
                                            <div style="margin-left: 1vw;"><%=rs.getString("mid_title")%></div>
                                            <button type = "button" class = "plus" style="margin-right: 1vw;">+</button>
                                        </div>
                                        <div class = "sub-title-container hidden">
                                        <%                                
                                            PreparedStatement psb=conn.prepareStatement("select * from MV where mid_title='"+rs.getString("mid_title")+"';");
                                            ResultSet rsb=psb.executeQuery();

                                            while(rsb.next()) {
                                                mvtol=rsb.getInt("mv_tol");

                                                %>
                                                    <div class="sub-title">
                                                        <label for = "<%=rsb.getInt("mv_tol") %>" style="margin-left: 1vw;"><%=rsb.getString("mv_name") %></label>
                                                        <div style="margin-right: 1vw;">
                                                            <input name="title" value = "<%=rsb.getInt("mv_tol") %>" id = "<%=rsb.getInt("mv_tol") %>" type="radio"/>
                                                        </div>
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
                    <div class="menu-btn-container">
                       <a href="../../upload_server/category/cover/<%=fl %>" class="menu-btn" style="height:5%;width:69%;" download>파일 다운로드</a>
                        <button class="menu-btn" type="button">수강 후기 작성</button>
                        <button class="menu-btn" type="button">전체 강의 수강 완료</button>
                    </div>
                </div>
                <div class="video-wrap"></div>
                <div class="video-container">
                    <a href="lecture_info.jsp?id=<%=id%>"><div class="back">&#8592;</div></a>
                    <div class="video">
                        <div class="video-title">강의소개</div>
                        <div class="video-frame">
                            <iframe src="../../upload_server/category/video/<%=free %>" frameborder="0" width="100%" height="100%"></iframe>
                        </div>
                    </div>
                    <div class="video-bottom">
                        <div style="margin-left: 1vw;">
                        <%
                        if(cn==1){
                            %><a href="">< 이전강의가 없습니다</a><% 
                        }else{
                            %><a href="lecture.jsp?id=<%=id %>&cn=<%=cn-1%>">< 이전강의</a><% 
                            
                        }
                        
                        %>
                        
                        </div>
                        <div>현재 강의 수강 완료하기</div>
                        <div style="margin-right: 1vw;">
                        <%
                        if(mvtol==cn){
                            %><a href="">다음강의가 없습니다></a><% 
                        }else{
                            %><a href="lecture.jsp?id=<%=id %>&cn=<%=cn+1%>"> 다음강의></a><% 
                            
                        }
                        
                        %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const btns = document.querySelectorAll(".plus");
            const subs = document.querySelectorAll(".sub-title-container");
            const sub_btns = document.querySelectorAll(".sub-title");

            btns.forEach((btn, index) => {
                btn.addEventListener("click", () => {
                    subs[index].classList.toggle("hidden");
                });
            });

            sub_btns.forEach((btn) => {
                btn.addEventListener("click", () => {
                    
                });
            });
        </script>
    </body>
</html>