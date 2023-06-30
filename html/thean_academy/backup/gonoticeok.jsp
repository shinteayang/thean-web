<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@page import="java.util.Date" %>

<%@page import="java.text.SimpleDateFormat" %>

<%
	request.setCharacterEncoding("UTF-8");
  	Connection conn = null;
  	PreparedStatement pstmt = null;
    conn = Util.getConnection();
	int nuno=0;
    
    if(session == null || session.getAttribute("name")==null) {
        %>
            <script>
            alert("로그인 후 이용해주십시요");
            history.go(-1);
            </script>
        <% 
    } else {
    	
    	Date now = new Date();
    	Object op = session.getAttribute("number");
    	Object un = session.getAttribute("name");
    	int opa=(int)op;
    	String unm = un.toString();
    	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

    	String today = sf.format(now);
    	
    
    	try{
    		
    		 PreparedStatement ps = conn.prepareStatement("select MAX(no) from cs where user_no="+opa+";");
             ResultSet rs = ps.executeQuery();
 	 
             if(rs.next()){ 
             nuno=rs.getInt("MAX(no)");
             nuno=nuno+1;
    		}else{
    			nuno=1;
    			
    			
    		}
             
    	
    	
    	}catch(Exception e) { 
        	%>
        	<h1><%=e %></h1>
        	
        	<% 
        	
        }
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    try{
    	
    	
    	
    	
    
	String nm = request.getParameter("nm");	
	String sp = request.getParameter("sp");	
	pstmt = conn.prepareStatement("INSERT INTO cs (user_no,idx,text,date,checkaa,username,no) VALUES (?,?,?,?,?,?,?)");

	pstmt.setInt(1, opa);
	pstmt.setString(2, nm);
	pstmt.setString(3, sp);
	pstmt.setString(4, today);
	pstmt.setString(5, "등록완료");
	pstmt.setString(6, unm);
	pstmt.setInt(7, nuno);

	
	pstmt.executeUpdate();
	conn.close();

     response.sendRedirect("notice.jsp");
    } catch(Exception e) { 
    	%>
    	<h1><%=e %></h1>
    	
    	<% 
    	
    }
     
   
    	
    }
%>
