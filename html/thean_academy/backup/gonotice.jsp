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
                        	
                        	%>
                        	
                        	<form action="gonoticeok.jsp">
                        	<br />문의제목
                        	<input id = "nm" type="text" name = "nm" autocomplete="off"/>
                        	<br />
                        	<br />문의내용
                        	<br />
                        	<textarea name="sp" id="sp" cols="30" rows="10"></textarea>
                        	<p>한번 등록한 문의는 수정이나 삭제할 수 없습니다</p>
                        	<button class = "btn1" type = "submit">등록</button>
                        	</form>
                        	
                        	
                        	<% 
                        	
                        	
                        	
                        	
                        	
                        }%>
	
</body>
</html>