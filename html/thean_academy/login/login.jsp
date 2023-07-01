<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<link rel="stylesheet" type="text/css" href="../../../css/thean_academy/login.css" />
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
	<div class = "main">
        <div class="login-wrapper">
            <div class="login-text">로그인</div>
            <form onsubmit="return isLogin()" method="get" action="../../../jsp/thean_academy/login.jsp"  name="joinform" id="login-form">
                <div class = "login-container">
                    <input type="id" name="id" placeholder = "아이디를 입력해주세요">
                    <input type="password" name="pw" placeholder = "비밀번호를 입력해주세요">
                    <button type="submit" id="sign_up" >로그인</button>
                    <a href="idsend.jsp" class="adu">ID찾기</a><a href="" class="adu">/</a><a href="pwsend.jsp" class="adu">PW찾기</a>
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        if(id == 2) {
                            %>
                                <div class="error">id 또는 비밀번호가 올바르지 않습니다</div>
                            <%        	
                        }
                    %>
                    <div class="register">
                        계정이 아직 없으십니까? <br><a href="../user/choose.jsp">회원가입</a>하기
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
