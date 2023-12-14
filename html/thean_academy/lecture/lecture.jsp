<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>

<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    int cn = Integer.parseInt(request.getParameter("cn"));

    String free="";
    String ct_name = "";
    String name = "";
    String title_m = "";
    String link = "";
    String mid_title = "";
    String mvlk = "";
    String fl = "";
    String day="";

    int mvtol = 0;
    int date = 0;
    int vsct = 0;
    int op_a = 0;
    int op_b = 0;

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

   	    if(session == null || session.getAttribute("name")==null) { lid="비회원"; } 
        else {
       	    Object ido = session.getAttribute("number");
       	    lid = ido.toString();	
        }		
   	
     	PreparedStatement pstmt = null;
        conn = Util.getConnection();
   	
        try { 
            pstmt = conn.prepareStatement("INSERT INTO iplog (ip,data,id,server,page,loga,logb,logc) VALUES (?,?,?,?,?,?,?,?)");

            pstmt.setString(1, ip);
            pstmt.setString(2,today);
            pstmt.setString(3, lid);
            pstmt.setString(4, "심각");
            pstmt.setString(5, "lecture.jpg");
            pstmt.setString(6, "비정상접속시도");
            pstmt.setString(7, "강의페이지");
            pstmt.setString(8, "비정상");
            
            pstmt.executeUpdate();
            conn.close();

        } catch(Exception e) { 
            %><h1>실패 원인:<%=e %></h1><%   
        }

    } else {
        Object op = session.getAttribute("op");
        Object op2 = session.getAttribute("number");

        op_a = Integer.parseInt(op.toString());
        op_b = Integer.parseInt(op2.toString());


try {
                     
    
                        PreparedStatement is = conn.prepareStatement("select * from cert where ctnum="+id+" and usernum="+op_b+";");
                        ResultSet ls = is.executeQuery();

                        if(ls.next()){


                        }else{
                         PreparedStatement isa = conn.prepareStatement("select * from videotime where ctnum="+id+" and usernum="+op_b+" and ys='n';");
                        ResultSet lsa = isa.executeQuery();
                        if(lsa.next()){

                        }else{
                            Date setd = new Date();
   	                        SimpleDateFormat sfz = new SimpleDateFormat("yyyy");
                            SimpleDateFormat sfc = new SimpleDateFormat("MM");
                            SimpleDateFormat sfd = new SimpleDateFormat("dd");
                           
   	                        String yy = sfz.format(setd);
                            String mm = sfc.format(setd);
                            String dd = sfd.format(setd);
                            String upsq="Insert into cert(ctnum,usernum,ys,yy,mm,dd) values("+id+","+op_b+",'y','"+yy+"','"+mm+"','"+dd+"')";
                            PreparedStatement pstmta = Prepare.getPrepare(conn, upsq);
                            pstmta.executeUpdate();

                        }


                        }
                       
}catch(Exception e){
%><%=e%><%

}




























        
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
            PreparedStatement ps = conn.prepareStatement("select * from buy where user_number="+op_b+" and ct_number="+id+";");
            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                date = rs.getInt("date");
                vsct = rs.getInt("ct_number");
            } else {
                %>
                    <script>
                        alert("잘못된 접근경로입니다!!a");
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
                    alert("잘못된 접근경로입니다!!b");
                    var link = 'http://www.thean-ac.com:8081/source/html/thean_academy/main.jsp';
                    
                    location.href=link;
                    location.replace(link);
                    window.open(link);
                </script>
            <%
        } else if(date < 1) {
            %>
                <script>
                    alert("잘못된 접근경로입니다!!c");
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
        <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/lecture.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            var a = null;
            var b = null;
            var c = null;

            var option = 1;
        </script>
    </head>
    <body>
        <div id="main">
            <div id="body">
                <div class="menubar">
                    <div class="info-container">
                        <div class="title-container">
                            <div class="title"><%=ct_name %></div>
                            <div class="leftover-day">잔여 수강일:<%=date%>일</div>
                            <%
                                PreparedStatement pspr = conn.prepareStatement("SELECT COUNT(*) AS tot, SUM(CASE WHEN ys = 'y' THEN 1 ELSE 0 END) AS spe FROM videotime WHERE ctnum = ? and usernum = ?");
                                pspr.setInt(1, id);
                                pspr.setInt(2, op_b);

                                ResultSet rsr = pspr.executeQuery();

                                if (rsr.next()) {
                                    double spe = rsr.getInt("spe");
                                    double tot = rsr.getInt("tot");
                                    int per = (int)Math.round(spe / tot * 100);
                                
                                    %>
                                        <div class="lecture-progress">
                                            <%=per%> %
                                            <progress id="progress" value="<%=spe%>" max="<%=tot%>"></progress>
                                        </div>
                                    <%
                                }
                            %>
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
                                                        <label for = "radio-<%=rsb.getInt("mv_tol")%>" style="margin-left: 1vw;"><%=rsb.getString("mv_name") %></label>
                                                        <div style="margin-right: 1vw;">
                                                            <input class = "radio-input" name="title" value = "<%=rsb.getInt("mv_tol") %>" id = "radio-<%=rsb.getInt("mv_tol")%>" type="radio"/>
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
                       <a href="../../../upload_server/category/cover/<%=fl %>" class="menu-btn" style="height:5%;width:69%;" download>파일 다운로드</a>
                       <a href="../lecture/education.jsp?tec=all&pg=0" class="menu-btn" style="height:5%;width:69%;">강의 질문하기</a>
                    </div>
                </div>
                <div class="video-wrap"></div>
                <div class="video-container">
                    <a href="lecture_info.jsp?id=<%=id%>"><div class="back">&#8592;</div></a>
                    
                    <%
                        PreparedStatement psf = conn.prepareStatement("SELECT * FROM MV WHERE mv_tol = 1");
                        PreparedStatement pstmtct = conn.prepareStatement("select * from videotime where ctnum = " + id + " and videonum = 1 and usernum = " + op_a);

                        ResultSet rsf = psf.executeQuery();
                        ResultSet rsct = pstmtct.executeQuery();

                        int time = 0;
                        String ys = "";
                        
                        if (rsct.next()) {
                            time = rsct.getInt("time");
                            ys = rsct.getString("ys");
                        }

                        if(rsf.next()) {
                            String linkf = rsf.getString("mv_link");
                            String mid_titlef = rsf.getString("mid_title");
                            String mvlkf = mid_titlef+"/"+linkf;
                            %>
                                <div class="video">
                                    <div class="video-title"><%=rsf.getString("mv_name")%></div>
                                    <div class="video-frame">
                                        <video id = "video-1" class = "lecture-video<%if (ys == "n") {%> video-disabled<%}%>" controls controlsList="nodownload" oncontextmenu='return false'>
                                            <source src="../../../upload_server/category/video/cad/<%=mvlkf %>" type="video/mp4">
                                        </video>
                                    </div>
                                </div>
                            <%
                        }
                    %>
                    <div class="video-bottom">
                        <div class = "left" style="margin-left: 1vw;">
                            < 이전강의
                        </div>
                        <div class = "right" style="margin-right: 1vw;">
                            다음강의 >
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            const btns = document.querySelectorAll(".plus");
            const subs = document.querySelectorAll(".sub-title-container");
            const sub_btns = document.querySelectorAll(".sub-title");
            const items = document.querySelectorAll('.radio-input');
            const leftBtn = document.querySelector('.left');
            const rightBtn = document.querySelector('.right');
            const titles = document.querySelectorAll('input[type=radio][name=title]');
            const title_id = document.getElementById("radio-1");
            const videos = document.getElementsByClassName('lecture-video');
            
            title_id.checked = true;

            const isToggled = new Array(btns.length).fill(false);

            let currentIndex = 0;
            let prevCurrent = 0;
            let prevValue = 1;
            let currentValue = 1;

            window.onbeforeunload = (e) => {
                e.preventDefault();

                var answer = confirm('저장하고 나가시겠습니까?');
                if (!confirm) {
                    return false;
                } else {
                    ctime = parseInt(document.getElementById('video-' + option).currentTime);
                    $.ajax({
                        url: "lectureCurrent.jsp",
                        type: "POST",
                        data: {
                            option: prevValue,
                            id: id,
                            time: ctime
                        },
                        success: function(data) {

                        },
                        error: function(error) {
                            console.log(error);
                        }
                    });
                }
            }

            var id = <%=id%>;
            var ctime = 0;

            btns.forEach((btn, index) => {
                btn.addEventListener("click", () => {
                    isToggled[index] = !isToggled[index];
                    btn.textContent = isToggled[index] ? "▲" : "▼";
                    subs[index].classList.toggle("hidden");
                });
            });

            titles.forEach((radio, index) => {                
                radio.addEventListener('change', (e) => {
                    saveVideo(e, radio, index);
                    radio.focus();
                });
            });

            leftBtn.addEventListener("click", () => {
                currentIndex = Math.max(currentIndex - 1, 0);
                titles[currentIndex].checked = true;
                titles[currentIndex].dispatchEvent(new Event('change'));
            });

            rightBtn.addEventListener("click", () => {
                currentIndex = Math.min(currentIndex + 1, titles.length - 1);
                titles[currentIndex].checked = true;
                titles[currentIndex].dispatchEvent(new Event('change'));
            });
        </script>
        <script>
            function start (option) {   
                document.getElementById('video-' + option).addEventListener('ended', function () {
                    document.getElementById('video-' + option).classList.remove("video-disabled");
                    $.ajax({
                        url: "lectureTime.jsp",
                        type: "POST",
                        data: {
                            option: option,
                            id: id,
                        },
                        success: function(data) {
                            
                        },
                        error: function(e) {
                            console.log(e);
                        }
                    });
                });
            }

            start(option);
        </script>
        <script>
            function saveVideo(e, radio, index){
                currentValue = radio.value;
                if (currentValue !== null && prevValue !== currentValue) {
                    ctime = parseInt(document.getElementById('video-' + option).currentTime);
                    $.ajax({
                        url: "lectureCurrent.jsp",
                        type: "POST",
                        data: {
                            option: prevValue,
                            id: id,
                            time: ctime
                        },
                        success: function(data) {

                        },
                        error: function(error) {
                            console.log(error);
                        }
                    });
                }
                prevValue = currentValue;
                currentIndex = index;
                option = e.target.value;

                $.ajax({
                    url: "lectureList.jsp",
                    type: "POST",
                    data: {
                        option: option,
                        id: id,
                        index: currentIndex,
                        time: ctime
                    },
                    success: function(data) {
                        $(".video").html(data);
                        start (option);
                    },
                    error: function(e) {
                        console.log(e);
                    }
                });
            }
        </script>
    </body>
</html>