<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>upload</title>
</head>
<body>
	
	<% 
		request.setCharacterEncoding("utf-8");
	
		String location = "/var/lib/tomcat9/webapps/ROOT/source/upload_server";
		
		int maxSize = 1024 * 1024 * 1024; // 키로바이트 * 메가바이트 * 기가바이트   
		try{
	MultipartRequest multi = new MultipartRequest(request, location,maxSize, "utf-8",new DefaultFileRenamePolicy());

		String userName = multi.getParameter("userName");
		
		Enumeration<?> files = multi.getFileNames(); // <input type="file">인 모든 파라메타를 반환
				
		String element = "";
		String filesystemName = "";
		String originalFileName = "";
		String contentType = "";
		long length = 0;		
				
		if (files.hasMoreElements()) { 
			
			element = (String)files.nextElement(); 
			
			filesystemName 			= multi.getFilesystemName(element); 
			originalFileName 		= multi.getOriginalFileName(element); 
			contentType 			= multi.getContentType(element);	
			length 					= multi.getFile(element).length(); 
			
		}

		
		%>
		<p>전송성공</p>
<p><%=filesystemName%></p>
		
		
		<%
		
		
		}catch(Exception e){
			%>
			<h1><%=e%></h1>
			<%

		}
		 
	
	
	%>
	
	


</body>
</html>