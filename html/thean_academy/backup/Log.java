<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
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

	out.print("현재시간:"+ip);		
	
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
		pstmt.setString(5, "testlog");
		pstmt.setString(6, "기록없음");
		pstmt.setString(7, "기록없음");
		pstmt.setString(8, "기록없음");
		
		pstmt.executeUpdate();
		conn.close();

	}catch(Exception e){ 
        %><h1>실패 원인:<%=e %></h1><%
        
	}

	%>
	
</body>
</html>