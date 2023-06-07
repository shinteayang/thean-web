<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>

<%
    String key = Key.getKey();
String sql="";
String variableValue = Key.getKey();
	request.setCharacterEncoding("UTF-8");
  	Connection conn = null;
  	PreparedStatement pstmt = null;
    conn = Util.getConnection();
	try{
	String nm = request.getParameter("nm");	
	String pw = request.getParameter("pw");
	String phn = request.getParameter("phn");
	int pha= Integer.parseInt(phn);
	
	
	pstmt = conn.prepareStatement("update USER set user_password=sha2('"+pw+"', 256) where '"+pha+"'=AES_DECRYPT(UNHEX(user_phone), '" + variableValue + "')"+"and '"+nm+"'=AES_DECRYPT(UNHEX(user_id), '" + variableValue + "')");
	
	
	sql="update USER set user_password=sha2('"+pw+"', 256) where'"+pha+"'=AES_DECRYPT(UNHEX(user_phone), '" + variableValue + "')"+"and '"+nm+"'=AES_DECRYPT(UNHEX(user_id), '" + variableValue + "')";

	
	pstmt.executeUpdate();
	

    response.sendRedirect("login.jsp?id=1");
	}catch(Exception e){
		%><%=e%><% 
				
	}
%>
