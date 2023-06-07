<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>

<%
    String key = Key.getKey();
    String variableValue = Key.getKey();
	request.setCharacterEncoding("UTF-8");
  	Connection conn = null;
  	PreparedStatement pstmt = null;
    conn = Util.getConnection();
	
	String id = request.getParameter("id");	
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String date = request.getParameter("date");
	int digit = Integer.parseInt(request.getParameter("digit1"));
	String email = request.getParameter("email");
	String address = request.getParameter("address1");
	String school = request.getParameter("school");
	String major = request.getParameter("major");
	String gender = request.getParameter("gender");
	String event = request.getParameter("event");
	String job = request.getParameter("job");
	
	pstmt = conn.prepareStatement("INSERT INTO USER (user_name, user_phone, user_adress, user_job, user_mail, user_event, op, user_birth, user_id, user_password, user_school, user_major, user_gender) VALUES (?, hex(AES_ENCRYPT(?, '" + key + "')), hex(AES_ENCRYPT(?, '" + key + "')), ?, ?, ?, ?, ?, hex(AES_ENCRYPT(?, '" + key + "')), sha2(?, 256), ?, ?, ?)");

	pstmt.setString(1, name);
	pstmt.setInt(2, digit);
	pstmt.setString(3, address);
	pstmt.setString(4, job);
	pstmt.setString(5, email);
	pstmt.setString(6, event);
	pstmt.setInt(7, 3);
	pstmt.setString(8, date);
	pstmt.setString(9, id);
	pstmt.setString(10, password);
	pstmt.setString(11, school);
	pstmt.setString(12, major);
	pstmt.setString(13, gender);
	

	
	pstmt.executeUpdate();
	

     response.sendRedirect("../index/main.jsp");
%>
