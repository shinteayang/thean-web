<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<link rel="stylesheet" type="text/css" href="../../../css/thean_academy/find.css" />
	<title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class = "main">
        <div class="login-wrapper">
            <div class="login-text">아이디 찾기</div>
            <div class = "iden-container">
                <form name="form" id = "registerForm" action="" method="post">
                    <div class = "iden">
                        <div class = "iden-title">이름</div>
                        <div class = "input-here"><input id = "name" type="text" name = "name" value="" autocomplete="off"/></div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title">휴대폰</div>
                        <div class = "input-here">
                            <input id = "digit1" class = "digit" name = "digit1" type="text"  value="" autocomplete="off"/>  
                        </div>
                    </div>
                    <div class = "btns">
                        <button class = "btn1" type = "submit" >확인</button>
                        <button class = "btn1" type = "button" onClick = "location.href='../index/main.jsp'">취소</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
