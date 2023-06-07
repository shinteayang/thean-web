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
            <div class="login-text">비밀번호 변경</div>
            <div class = "iden-container">
                <form name="form" id = "registerForm" action="pass_change.jsp" onsubmit="return nt();" method="post">
                    <div class = "iden">
                        <div class = "iden-title">기존비밀번호</div>
                        <div class = "input-here"><input id = "pw" type="password" name = "pw" value="" autocomplete="off"/></div>
                    </div>
                   <div class = "iden">
                        <div class = "iden-title">새 비밀번호</div>
                        <div class = "input-here"><input id = "pw1" type="password" name = "pwa" value="" autocomplete="off"/></div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title">비밀번호확인</div>
                        <div class = "input-here"><input id = "pw2" type="password" name = "pwb" value="" autocomplete="off"/></div>
                    </div>
                    <div class = "btns">
                        <button class = "btn1" type = "submit"  >확인</button>
                        
                        <button class = "btn1" type = "button" onClick = "location.href='../index/main.jsp'">취소</button>
                    </div>
                </form>
                
                <script>
                
                function nt(){
                	
                    var pw1 = document.getElementById("pw1").value;
                    var pw2 = document.getElementById("pw2").value;
           
                   
                     
                  if(pw1!=pw2){
                	  alert("비밀번호 확인오류 \n 새 비밀번호와 일치하지 않습니다")
                	  return false;
                	  
                	  
                  }else{
                	  alert("성공");
                	  
                	  
                  }
                }
                
                
                
                </script>
            </div>
        </div>
    </div>
</body>
</html>
