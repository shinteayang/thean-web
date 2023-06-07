<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>

<%
if(session == null || session.getAttribute("name")==null) {
    %>
        <script>
        alert("로그인 후 이용해주십시요");
        history.go(-1);
        </script>
    <% 
} else {
    

Object numa = session.getAttribute("number");


String num = numa.toString();
    int un= Integer.parseInt(num);

    String key = Key.getKey();
String sql="";
String variableValue = Key.getKey();
	request.setCharacterEncoding("UTF-8");
  	Connection conn = null;
  	PreparedStatement pstmt = null;
    conn = Util.getConnection();
	try{
	String nm = request.getParameter("nm");	
	String ph = request.getParameter("ph");
	String k = request.getParameter("k");
	int pha= Integer.parseInt(ph);
	
	
	pstmt = conn.prepareStatement("update USER set user_phone=  hex(AES_ENCRYPT("+pha+", '" + key + "'))"+" where user_number="+un+";");
	
	
	sql="update USER set user_phone=AES_DECRYPT(UNHEX("+pha+"), '" + variableValue + "')"+" where user_number="+un+";";
	
	pstmt.executeUpdate();
	
	%>
	<script>
	alert("변경되었습니다");
	</script>
	<%
	
	response.sendRedirect("infoUpdate.jsp");


	}catch(Exception e){
		%><%=e%><% 
				
	}
}
%>
