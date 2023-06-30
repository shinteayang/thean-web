<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	request.setCharacterEncoding("UTF-8");
  	Connection conn = null;
  	PreparedStatement pstmt = null;
     conn = Util.getConnection();

    String idx="";
    String txt="";
     String pb="";
     String id="";
     
    
         idx=request.getParameter("idx");
       txt=request.getParameter("txt");
        pb=request.getParameter("pb");
         id=request.getParameter("id");

    String sqla="update cs set idx='"+idx+"', text='"+txt+"', pb='"+pb+"' where no="+id+";";

  
        try {
       
        pstmt = conn.prepareStatement(sqla);
        
       
        pstmt.executeUpdate();
        conn.close();

           %>
        <script>
        alert("등록완료");
        location.href='notice.jsp?pg=0&se=all';
        
        </script>
        <%

        } catch(Exception e) { 
            %><h1><%=sqla %></h1><% 
             %><h1><%=e %></h1><% 	
        }
    





   
    	
    	
    	
    	
	
    
        	
%>
