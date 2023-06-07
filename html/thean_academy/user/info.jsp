<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%
        String nm = request.getParameter("nm");
        int ph = Integer.parseInt(request.getParameter("ph"));
        int k = Integer.parseInt(request.getParameter("k"));
        if(k!=1){
            %>
            <script>
            alert("잘못된 접근입니다")
            history.go(-1) 
            </script>
            <% 
        }
    %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<link rel="stylesheet" href="../../../css/thean_academy/register.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		var check = null;
		
		function checkId() {
		    const id = $('#id').val().trim();
		    if (id.length == 0) { alert("아이디를 입력해주세요."); return false; }
		    
		    $.ajax({
		        url: "checkId.jsp",
		        type: "post",
		        data: { id: id },
		        success: function(result) {
		            if (result == "exist") {
		                alert("이미 사용중인 아이디입니다.");
		                check = "exist";
		                return false;
		            } else {
		                alert("사용 가능한 아이디입니다.");
		                check = "unexist";
		                return true;
		            }
		        },
		        error: function(error) {
                    console.log(error);
		            alert("오류가 발생했습니다.");
		        }
		    });
		}
		
		function register() {
		
			const id = $('#id').val().trim();
			const password = $('#password').val().trim();
			const confirmPassword = $('#confirm-password').val().trim();
			const name = $('#name').val().trim();
            const date = $('input[name=date]').val().trim();
            const gender = document.registerForm.gender.value;
			const digit1 = document.registerForm.digit1.value;
			const email = document.registerForm.email.value;
            const addr = document.registerForm.address1.value;

			if (id.length == 0) { alert("아이디를 입력해주세요."); return false; }
			if (password.length == 0) { alert("비밀번호를 입력해주세요."); return false; }
			if (confirmPassword.length == 0) { alert("비밀번호를 한번 더 입력해주세요."); return false; }
			if (password != confirmPassword) { alert("비밀번호가 일치하지 않습니다."); return false; }
			if (name.length == 0) { alert("이름을 입력해주세요."); return false; }
            if (date.length == 0) { alert("생년월일을 입력해주세요."); return false; }
            if (gender.length == 0) { alert("성별을 입력해주세요."); return false; }
			if (digit1.length == 0) { alert("휴대폰 번호를 입력해주세요."); return false; }
			if (email.length == 0) { alert("이메일을 입력해주세요."); return false; }
            if (addr.length == 0) { alert("주소를 입력해주세요."); return false; }
			if (check == "exist") { alert(check); return false; }
			if (check == null) { alert("아이디 중복확인을 해주세요."); return false; }
			
			alert("회원가입이 정상적으로 완료되었습니다.");
			
			return true;
		}
	</script>
    <script>
        function goPopup(){
            // 주소검색을 수행할 팝업 페이지를 호출합니다.
            // 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
            var pop = window.open("../../../api/adress/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
            
            // 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://business.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
            //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
        }

        function jusoCallBack(roadAddrPart1){
            document.registerForm.address1.value = roadAddrPart1;
                  
        }
    </script>
</head>
<body>
	<div class = "body">
        <div id = "main">
            <div class = "title-container">
                <div id = "title">
                    <h1>JOIN MEMBER</h1>
                </div>
                <div id = "explan">
                    더안건축학원 회원가입을 환영합니다.<br>
                    회원이 되시면 더안건축학원의 다양한 혜택과 컨텐츠를 이용하실 수 있습니다.
                </div>
            </div>
            <div class = "proced">
                <div class = "first">
                    <div><h3>01</h3></div>
                    <div><h3>약관동의</h3></div>
                </div>
                <div class = "second">
                    <div><h3>02</h3></div>
                    <div><h3>본인확인</h3></div>
                </div>
                <div class = "third active">
                    <div><h3>03</h3></div>
                    <div><h3>정보입력</h3></div>
                </div>
                <div class = "fourth">
                    <div><h3>04</h3></div>
                    <div><h3>가입완료</h3></div>
                </div>
            </div>
            <div class = "iden-container">
                <form name="registerForm"  onsubmit = "return register()" id = "registerForm" action="isRegister.jsp" method="post">
                    <div class = "iden">
                        <div class = "iden-title"><b style = "color: red;">*</b> 아이디</div>
                        <div class = "input-here"><input id = "id" type="text" name = "id" autocomplete="off"/><button class = "sub-btn" type = "button" id = "idCheckBtn" onclick = "checkId()">중복확인</button>
                        </div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title"><b style = "color: red;">*</b> 비밀번호</div>
                        <div class = "input-here"><input id = "password" type="password" name = "password"/></div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title"><b style = "color: red;">*</b> 비밀번호 확인</div>
                        <div class = "input-here"><input id = "confirm-password" type="password" name = "confirm-password"/></div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title"><b style = "color: red;">*</b> 이름</div>
                        <div class = "input-here"><input id = "name" type="text" name = "name" value="<%=nm %>" autocomplete="off"/></div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title"><b style = "color: red;">*</b> 생년월일</div>
                        <div class = "input-here">
                            <input type="date" name = "date"/>
                        </div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title"><b style = "color: red;">*</b> 성별</div>
                        <div class = "input-here">
                            <div class = "gender">
                                <input name = "gender" type="radio" value = "male" />남자 
                            </div>
                            <div class = "gender">
                                <input name = "gender" type="radio" value = "female" />여자
                            </div>
                        </div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title"><b style = "color: red;">*</b> 휴대폰</div>
                        <div class = "input-here">
                            <input id = "digit1" class = "digit" name = "digit1" type="text"  value="<%=ph %>" autocomplete="off" readonly/>  
                        </div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title"><b style = "color: red;">*</b> 이메일</div>
                        <div class = "input-here"><input id = "email" type="text" name = "email" autocomplete="off"/></div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title"><b style = "color: red;">*</b> 주소</div>
                        <div class = "input-here">
                            <input id = "addr1" class = "address" name = "address1" type="text" autocomplete="off" readonly/>
                            <button type = "button" class = "sub-btn" onClick="goPopup();">주소입력</button>
                        </div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title">직업</div>
                        <div class = "input-here">
                            <select name="job" id="job">
                                <option value="비전공">학생 (비전공)</option>
                                <option value="전공">학생 (전공)</option>
                                <option value="무직">무직</option>
                                <option value="직장인">직장인</option>
                                <option value="주부">주부</option>
                                <option value="기타">기타</option>
                            </select>
                        </div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title">학교</div>
                        <div class = "input-here"><input type="text" name = "school" autocomplete="off"/></div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title">전공</div>
                        <div class = "input-here"><input type="text" name = "major" autocomplete="off"/></div>
                    </div>
                    <div class = "iden">
                        <div class = "iden-title">유입경로</div>
                        <div class = "input-here">
                            <select id = "event" name = "event">
                                <option value = "">유입경로를 선택해주세요</option>
                                <option value = "지인소개">지인소개</option>
                                <option value = "학원방문">학원방문</option>
                                <option value = "활동참석">활동참석</option>
                                <option value = "협력업체, 공공기관">협력업체, 공공기관</option>
                                <option value = "지원사업">지원사업</option>
                                <option value = "기타">기타</option>
                            </select>
                        </div>
                    </div>
                    <div class = "btns">
                        <button class = "btn1" type = "button" onClick = "location.href='../user/certification.jsp'">이전</button>
                        <button class = "btn1" type = "submit" >확인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>