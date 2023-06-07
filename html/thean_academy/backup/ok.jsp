<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>결제진행중</title>
	<style>
	#maindv{
	width:40%;
	height:500px;
	border:solid 1px;
	margin-left:30%;
	margin-top: 3%;
	}
	
	#okv{
	width:300px;
	height:100px;

	background-color:#80ff00;
	margin-left:20%;
	border:none;
	}
	</style>
</head>
<body>
<div id="maindv">
<h1>결제완료 후 결제완료 버튼을 눌러주세요</h1>
	
	
<button type="button" id="okv" onclick="location.href='main.jsp' ">결제완료</button>




</div>
	
</body>
</html>