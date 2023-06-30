<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
 <%@ page import="DBPKG.Key"%>
<%

String variableValue = Key.getKey();
request.setCharacterEncoding("UTF-8");
String lid="";
String name="";
String mail="";
String adr="";
String phone="";
String id="";
String sql ="a";
int num=0;
if(session == null || session.getAttribute("name")==null) {
	   lid="비회원";
	   sql="none";
 } else {
 	Object ido = session.getAttribute("number");
 	lid = ido.toString();
 	 num= Integer.parseInt(lid);
 sql = "select user_name,user_mail,AES_DECRYPT(UNHEX(user_id), '" + variableValue + "') as user_id,AES_DECRYPT(UNHEX(user_adress), '" + variableValue + "') as user_adress,AES_DECRYPT(UNHEX(user_phone), '" + variableValue + "') as user_phone from USER where user_number="+num+ ";";

    Connection conn = Util.getConnection();     
    ResultSet res = null;
    
    try {	 
        PreparedStatement ps = Prepare.getPrepare(conn, sql);
        ResultSet rs = ps.executeQuery();
		int inm=1;
      if(rs.next()){
    	  name=rs.getString("user_name");
    	  mail=rs.getString("user_mail");
    	  adr=rs.getString("user_adress");
    	  phone=rs.getString("user_phone");
    	  id=rs.getString("user_id");
    	  
      }
    } catch (Exception e) { 
        %><%=e%><%
 }		
 }

%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="../../../css/thean_academy/infoUpdate.css" />
</head>
<body>
	<jsp:include page="../header/header.jsp"></jsp:include>
	<div class = "main">
        <div class = "title">정보변경</div>
        <div class = "iden-container">
            <form name="registerForm"  onsubmit = "return tst()" id = "registerForm" action="info_update_ok.jsp" method="post">
                <div class = "iden">
                    <div class = "iden-title">이름</div>
                    <div class = "input-here"><input id = "name" type="text"  value="<%=name %>" autocomplete="off" readonly/></div>
                </div>
                <div class = "iden">
                    <div class = "iden-title">아이디</div>
                    <div class = "input-here"><input id = "password" type="text" value="<%=id %>" readonly/></div>
                </div>
                <div class = "iden">
                    <div class = "iden-title">이메일</div>
                    <div class = "input-here"><input id = "email" type="text" name = "email" value="<%=mail %>" autocomplete="off"/></div>
                </div>
                <div class = "iden">
                    <div class = "iden-title">주소</div>
                    <div class = "input-here">
                        <input id = "addr1" class = "address" name = "address1" type="text" value="<%=adr %>"autocomplete="off" readonly/>
                         <input id = "num" class = "num" name = "num" type="text" value="<%=num %>"autocomplete="off" hidden/>
                         <button type = "button" class = "sub-btn" onClick="goPopup()">주소입력</button>
                    </div>
                </div>
                
               
                <div class = "iden">
                    <div class = "iden-title">휴대폰</div>
                    <div class = "input-here">
                        <input id = "digit1" class = "digit" name = "digit1" type="text"  value="0<%=phone %>" autocomplete="off" readonly/>
                        <a href="../login/phone_change.jsp?id=<%=name %>">번호변경</a>  
                    </div>
                </div>
                
                
                 <div class = "iden">
                    <div class = "iden-title">비밀번호</div>
                    <div class = "input-here"><a href="pass_update.jsp">비밀번호 변경</a></div>
                </div>
                
                
                
                
                <div class = "btns">
                    <button class = "btn1" type = "submit">확인</button>
                    <button class = "btn1" type = "button" onClick = "location.href='../index/main.jsp'">취소</button>
                </div>
            </form>
        </div>
        
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
        
        function tst(){
        
        	 var na= document.getElementById("email").value;
        	 
        	 if(na==null || na==""){
        		 alert("이메일을 입력해주세요");
        		 return false;
        	 }else{
        		return true;
        	 }
        	 
        	
        }
    </script>
        
        
        
        
        </script>
	</div>
	<jsp:include page="../header/footer.jsp"></jsp:include> 
</body>
</html>