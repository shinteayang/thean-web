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
            <form action="agreement.jsp">
            <div class="title-container">
                <div id="title">
                    <h1>제휴 코드 입력</h1>
                </div>
                <div id="explan">
                    제휴를 맺은 회원은 발급받은 코드를 입력해주세요.
                </div>
            </div>
            <div class = "choose">
                <input type="text" name="code">
            </div>
		    <div class="btns">
				<button class = "btn1" type="submit">확인</button>
				<button class = "btn1" type = "button" onClick = "history.go(-1);">취소</button>
		    </div>
        </form>
        </div>
    </div>
</body>
</html>