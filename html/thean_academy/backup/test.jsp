<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
  	Connection conn = null;
  	PreparedStatement pstmt = null;

  try{
	 String jdbcUrl = "jdbc:mysql://localhost:3306/thean";
     String dbId = "root";
     String dbPass = "sine1506";
	
	 Class.forName("com.mysql.jdbc.Driver");
	 conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 %><h1>성공</h1><% 
  }catch(Exception e){ 
	%><h1>실패 원인: <%=e %></h1><%
  }
%>
