<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
request.setCharacterEncoding("UTF-8");
String sql ="";

	String te = request.getParameter("te");
	String nm = request.getParameter("nm");
	String ct = request.getParameter("content");


if(session == null || session.getAttribute("name") == null) {
    %>
        <script>
            alert("잘못된 접근 경로입니다");
            history.go(-1);
        </script>
    <%
} else {   
	
	  Object name = session.getAttribute("name");
      Object no = session.getAttribute("number");
      int num = (int)no;
      String un=name.toString();
	
      try{
      sql = "INSERT INTO tenoice(user_no,idx,text,date,username,te_no,answerte,checkaa) VALUES("+num+",'"+nm+"','"+ct+"','date','"+name+"',"+te+",(select teacher_name from teacher where teacher_no="+te+"),'등록완료')";
      Connection conn = Util.getConnection();
      ResultSet res = null;
      PreparedStatement pstmt = Prepare.getPrepare(conn, sql);
     

      pstmt.executeUpdate();
      response.sendRedirect("education.jsp?tec="+te);
      }catch (Exception e) {
    	  %><%=e%>
    	  <%=sql%>
    	  <%
      }
      
      
      
      
      
}

    
%>