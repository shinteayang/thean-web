<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/font-applesdgothicneo@1.0/all.min.css">

<title>Document</title>
<link rel="stylesheet" href="../../../css/thean_academy/register.css" />
</head>
<body>
	<div class = "body">
        <div id="main">
		<div class="title-container">
			<div id="title">
				<h1>회원 선택</h1>
			</div>
			<div id="explan">
				회원 유형을 선택해주세요.
			</div>
		</div>
		<div class = "choose">
            <div class = "member" onClick = "location.href='agreement.jsp'">
                <img class = "mb-ico" src="../../../img/person.png" alt="">
                <div class = "who">일반회원</div>
            </div>
            <div class = "member" onClick = "location.href='coa_code.jsp'">
                <img class = "mb-ico" src="../../../img/people.png" alt="">
                <div class = "who">제휴회원</div>
                <div class = "">기업, 학교, 국비지원 등</div>
            </div>
        </div>
        <form action="agreement.jsp">
		    <div class="btns">
				<button class = "btn1" type = "button" onClick = "location.href='../index/main.jsp'">취소</button>
		    </div>
        </form>
	</div>
    </div>
</body>
</html>