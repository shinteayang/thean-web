<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="DBPKG.Prepare"%>



<%

String variableValue = Key.getKey();
request.setCharacterEncoding("UTF-8");
String pw = request.getParameter("pw");	
String pwa = request.getParameter("pwa");
String lid ="";
String sql="";
PreparedStatement ps=null;
PreparedStatement pes=null;
int num=0;
if(session == null || session.getAttribute("name")==null) {
	   lid="비회원";
	   sql="none";
 } else {
 	Object ido = session.getAttribute("number");
 	lid = ido.toString();
 	 num= Integer.parseInt(lid);
    sql = "select * from USER where user_number="+num+" and user_password=sha2('"+pw+"', 256)";
    Connection conn = Util.getConnection();     
    ResultSet rs = null;
    
    try {	 
    	PreparedStatement pstmt = Prepare.getPrepare(conn, sql);;
       rs = pstmt.executeQuery();
       
		int inm=1;
      if(rs.next()){
    	  
    	  sql = "update USER set user_password=sha2('"+pwa+"', 256) where user_number="+num+";";
    	  pes =conn.prepareStatement(sql);
    	  pes.executeUpdate();
    	  %>
    	  <script>
    	  location.replace("infoUpdate.jsp");
    	  alert("비밀번호 변경완료");
    	  
	

	</script>
    	 
    	  
    	  
    	  
    	  <% 
    
    	  
      }else{
    	 %><script>
	alert("기존 비밀번호가 일치하지 않습니다");
	history.back();
	</script><%
    	  
      }
    } catch (Exception e) { 
        %><%=e%><%
    
 	
 	
 	
 	
 	
 }		






 }



















%>