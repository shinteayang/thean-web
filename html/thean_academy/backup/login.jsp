<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<link rel="stylesheet" type="text/css" href="../../css/thean_academy/login.css" />
	<title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        function isLogin() {
			const id = $('#userid').val().trim();
			const password = $('#userpw').val().trim();
			
			if (id.length == 0) { alert("아이디를 입력해주세요."); return false; }
			if (password.length == 0) { alert("비밀번호를 입력해주세요."); return false; }
			
			return true;
		}
    </script>
</head>
<body>
	<div class="login-wrapper">
        <h2 id="login-text">로그인</h2>
         
        <form onsubmit="return isLogin()" method="get" action="../../jsp/thean_academy/login.jsp"  name="joinform" id="login-form">
            <input type="ID"  Name="id" id="userid">
            <input type="PASSWORD"  Name="pw" id="userpw">
           
            <input type="submit" value="로그인" id="sign_up" >
          <a href="agreement.jsp" class="adu">회원가입</a> <a href="" class="adu">ID찾기</a><a href="" class="adu">/</a><a href="" class="adu">PW찾기</a>
            <%
            int id = Integer.parseInt(request.getParameter("id"));
            if(id==2){
            	%>
            	<h4 style="color:red; background-color:#232b2b; margin-top:10%;">id 또는 비밀번호가 올바르지 않습니다</h4>
            	<% 
            	
            }
            
            
            %>
        </form>
        
    </div>
</body>
</html>
