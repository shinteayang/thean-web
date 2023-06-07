<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
   <%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Calendar" %>

<%
    String variableValue = Key.getKey();
    String sqd="";

    Connection conn = null;

    try {
        conn = Util.getConnection();
        
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        String name = "";
        String user_id = "";
        String point = "";

        int number = 0;
        int op = 0;

        PreparedStatement ps = conn.prepareStatement("select AES_DECRYPT(UNHEX(user_id), '" + variableValue + "') as user_id, user_number, user_name, op, format(point, 0) as point from USER where ?=AES_DECRYPT(UNHEX(user_id), '" + variableValue + "') and user_password=sha2(?, 256)");

        ps.setString(1, id);
        ps.setString(2, pw);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            name = rs.getString("user_name");
            number = rs.getInt("user_number");
            op = rs.getInt("op");
            user_id = rs.getString("user_id");
            point = rs.getString("point");

            session.setAttribute("name", name);
            session.setAttribute("number", number);
            session.setAttribute("op", op);
            session.setAttribute("id", user_id);
            session.setAttribute("point", point);

              PreparedStatement ck = conn.prepareStatement("select * from buy where user_number="+number+";");
              ResultSet cks = ck.executeQuery();
              sqd="select * from buy where user_number="+number+";";

              while(cks.next()){

//db에서 구매한시간 불러와서 정수로 변환하는 코드
               int timesqd=cks.getInt("dbc");
               Timestamp datetime = cks.getTimestamp("price-date");
                 
//로그인기준 현재시간 불러와서 변환하는코드

   Calendar calendar = Calendar.getInstance();

   // 현재 시간을 java.util.Date로 변환합니다.
   java.util.Date currentDate = calendar.getTime();

   // java.util.Date를 java.sql.Timestamp로 변환합니다.
   Timestamp timestamp2 = new Timestamp(currentDate.getTime());

     long diffInMillis = timestamp2.getTime() - datetime.getTime();

         // 차이를 일자(일수)로 변환
         long diffInDays = diffInMillis / (1000 * 60 * 60 * 24);

         int stdy= timesqd-(int)diffInDays;




         String sqld = "UPDATE buy SET date="+stdy+" WHERE user_number="+number+" and ct_number="+cks.getInt("ct_number")+";"; // table_name, column1, column2, id는 사용자의 테이블 및 열 이름으로 대체되어야 합니다.

        PreparedStatement pstmta = null;
        pstmta = conn.prepareStatement(sqld);

        int rowsUpdated = pstmta.executeUpdate();




              }
            Object d = session.getAttribute("name");

            name = d.toString();

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
            
            conn = null;
            PreparedStatement pstmt = null;
            conn = Util.getConnection();
            
            try {
                pstmt = conn.prepareStatement("INSERT INTO iplog (ip,data,id,server,page,loga,logb,logc) VALUES (?,?,?,?,?,?,?,?)");

                pstmt.setString(1, ip);
                pstmt.setString(2,today);
                pstmt.setString(3, lid);
                pstmt.setString(4, "정상");
                pstmt.setString(5, "login.jpg");
                pstmt.setString(6, "로그인성공");
                pstmt.setString(7, "시도id:"+id);
                pstmt.setString(8, "성공로그");
                
                pstmt.executeUpdate();
                conn.close();   
            } catch(Exception e) { 
                %><h1>실패 원인:<%=sqd %></h1><%  
            }
                response.sendRedirect("../../html/thean_academy/index/main.jsp");
            } else {
        %>
<%
//log패키지(로그인실패)


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
	
	conn = null;
  	PreparedStatement pstmt = null;
    conn = Util.getConnection();
	
	try{
	
		pstmt = conn.prepareStatement("INSERT INTO iplog (ip,data,id,server,page,loga,logb,logc) VALUES (?,?,?,?,?,?,?,?)");

		pstmt.setString(1, ip);
		pstmt.setString(2,today);
		pstmt.setString(3, lid);
		pstmt.setString(4, "경고");
		pstmt.setString(5, "main.jpg");
		pstmt.setString(6, "로그인시도 실패");
		pstmt.setString(7, "시도id:"+id);
		pstmt.setString(8, "실패로그");
		
		pstmt.executeUpdate();
		conn.close();

	}catch(Exception e){ 
        %><h1>실패 원인:<%=e %></h1><%
        
	}

	%>
            

            
            <script>alert("id 또는 비밀번호가 맞지 않습니다");</script><%

            response.sendRedirect("../../html/thean_academy/login/login.jsp?id=2");
        }
        
        %><h1>성공</h1>
        
        <%=request.getParameter("id") %>
        <%=request.getParameter("pw") %>
        <%=name %>
        <%=number %>
        <% 
    } catch(Exception e) { 
        %><h1>실패 원인: <%=sqd %></h1>
        <h1><%=e%></h1>
        <%
    }   
%>