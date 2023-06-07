<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!doctype html>
	<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<title>더안건축학원 오픈안내</title>
	</head>
	<body>
		<h1>더안건축 온라인학원 오픈안내</h1>
		<p>더안건축 온라인학원 서비스는 23년4월29일 정식 오픈 예정입니다</p>
		<p>감사합니다</p>
		<p>더안건축 개발팀 드림</p>
		
		<form action="">
		<input type="text" id="pd"/>
		<button onclick="pwd()">인증</button>
		</form>
		
		<script>
		function pwd(){
			
			 var nm = document.getElementById("pd").value;
             var link = "index.jsp";
             if(nm=="thean1613"){
                 alert("성공");
                 
             }else{
                 alert("개발자코드가 올바르지 않습니다");           
             }             
		} 
		location.replace(link);
		
		
		</script>
	</body>
	</html>