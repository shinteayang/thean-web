   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
 <%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
 <%@ page import="DBPKG.Key"%>
 
 
 
 <%
 String variableValue = Key.getKey();
String kj="";
 String nm = request.getParameter("nm");
 String num = request.getParameter("ph");
 String idk = request.getParameter("id");
 int np = Integer.parseInt(num);
 String id="";

 String sql = "SELECT AES_DECRYPT(UNHEX(user_id), '" + variableValue + "') as user_id FROM USER where user_name='"+nm+"' and '"+np+"'=AES_DECRYPT(UNHEX(user_phone), '" + variableValue + "')"+"and '"+idk+"'=AES_DECRYPT(UNHEX(user_id), '" + variableValue + "')";
 Connection conn = Util.getConnection();
 ResultSet res = null;
 try{
 PreparedStatement pstmt = Prepare.getPrepare(conn, sql);
 res = pstmt.executeQuery();
 if(res.next()){
	 id="비밀번호변경";
	 res.getString("user_id");
 }else{
	 id="일치하는 정보가 없습니다";
	 
 }
 }catch(Exception e){
	 %>
	 <%=sql %>
	 <%=e %>
	 
	 <% 
	 
 }
 
 %>
  <!doctype html>
  <html lang="en">
  <head>
  	<meta charset="UTF-8" />
  	<title>Document</title>
  
  
  </head>
  <link rel="stylesheet" href="../../../css/thean_academy/register.css" />
        <div class = "cert-body">
            <div id="main">
            <div class="title-container">
                <div id="title">
                    <h1>ID찾기 결과</h1>
                </div>
                <div id="explan">
                    
                </div>
            </div>
            <div class="proced">
                <div class="first">
                    <div>
                        <h3></h3>
                    </div>
                    <div>
                        <h3></h3>
                    </div>
                </div>
                <div class="second active">
                    <div>
                        <h3></h3>
                    </div>
                    <div>
                        <h3></h3>
                    </div>
                </div>
                <div class="third">
                    <div>
                        <h3></h3>
                    </div>
                    <div>
                        <h3></h3>
                    </div>
                </div>
                <div class="fourth">
                    <div>
                        <h3></h3>
                    </div>
                    <div>
                        <h3></h3>
                    </div>
                </div>
            </div>
    <body onload="loadJSON()">
    <form method="post" name="smsForm" action="smssend.jsp">
        <input type="hidden" name="action" value="go"> 
        <span>
            
        <input type="text" name="subject" value="제목"  style="display:none;">
        <textarea name="msg" cols="30" rows="10" style="width:455px; display:none;"> </textarea>

        <div class = "iden-container">
            <div class = "iden">
                <div class = "iden-title">성명</div>
                <div class = "input-here"><input type="text" name="user" id="nm" value="<%=nm %>" readonly></div>
            </div>
            <div class = "iden">
                <div class = "iden-title">휴대폰번호</div>
                <div class = "input-here"><input type="text" name="rphone" id="ph" value="<%=num %>" readonly>  </div>
            </div>
            
            <span id="sendPhoneList"></span>    
        </form>
        <%
        if(id.equals("비밀번호변경")){
        	%>
        	<form method="post" action="pwupdate.jsp">
        <div class = "iden">
                <div class = "iden-title">변경할비밀번호</div>
                <div class = "input-here"><input type="text" name="pw" id="pa" value="" >
                <a href="certification.jsp" ></a>  </div> 
            </div> 
            <input type="text" name="nm" id="" value="<%=idk %>" hidden>
            <input type="text" name="phn" id="" value="<%=num %>" hidden>
            <div class = "iden">
                <div class = "iden-title">비밀번호확인</div>
                <div class = "input-here"><input type="text" name="us" id="pb" value="" >
                <a href="certification.jsp" ></a>  </div> 
            </div> 
                        <div class="btns">
                <button class = "btn1" type="submit" onClick="nta()">계속하기</button>
            </div>
            </form>
            
                   	<% 
        	
        }else{
        	%>
            <div class = "iden">
                    <div class = "iden-title">에러</div>
                    <div class = "input-here"><input type="text" name="us" id="uas" value="없는 아이디입니다" readonly>
                    <a href="certification.jsp" ></a> </div>
                     <div class="btns">
                <button class = "btn1" type="button" onClick="nt()">계속하기</button>
            </div> 
                </div>        	<% 
            	
        	
        }
        
        
        
        %>
       
            <script>
            
            function nta(){
            	 var pwa = document.getElementById("pa").value;
                 var pwb = document.getElementById("pb").value;
            	if(pwa==pwb){
            		alert("비밀번호가 변경되었습니다\n다시 로그인해주세요");
            		return true;
            	}else{
            		alert("비밀번호가 일치하지 않습니다");
            		location.reload();
            		return false;
            		
            	}
            	
            }
            
            
            
            
            
            </script>

        </div>
    </body>
        </div>
        </head>

  </html>
  