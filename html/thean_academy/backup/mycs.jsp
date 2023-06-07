<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
	
                    <%   
                        if(session == null || session.getAttribute("name")==null) {
                            %>
                                <script>
                                alert("로그인 후 이용해주십시요");
                                history.go(-1);
                                </script>
                            <% 
                        } else {
                        	
                        	
                        	
                        	
                        	
                        	
                        	
                        }%>
	
</body>
</html>