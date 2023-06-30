<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*"%>
<%@ page session="true"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.text.DecimalFormat"%>

<%
    String variableValue = Key.getKey();
    DecimalFormat dec = new DecimalFormat("###,###");

    int price=0;
    int mprice=0;

    String ct_name="";
    String day="";
    String te_name="";
    String cover="";
    String user_name="";
    String user_adress="";
    String user_phone="";
    String user_mail="";
    String img="";

    int number = 0;
    int op_a = 0;
    int i = 1;
    int point=0;
    int scp=0;

    int id = Integer.parseInt(request.getParameter("ct"));
    int cp = Integer.parseInt(request.getParameter("cp"));
     int cld = Integer.parseInt(request.getParameter("select"));

    scp=cp;

    int spw=id+1;

    Connection conn = Util.getConnection();     
    ResultSet res = null;

    if(session.getAttribute("name") == null) {
        %><script> alert("로그인 후 이용해주십시요");</script><% 
    } else {
        Object op2 = session.getAttribute("number");
        op_a = Integer.parseInt(op2.toString());
    }

    try {           
        PreparedStatement ps = conn.prepareStatement("select * from CATE where categorynum="+id);
        ResultSet rs = ps.executeQuery();

        if(rs.next()) {
            price=rs.getInt("price")/3*cld;
            ct_name=rs.getString("categoryname");
            day=rs.getString("day");
            te_name=rs.getString("te_name");
            img = rs.getString("img");
            cover=rs.getString("cover");
        }

        PreparedStatement psa = conn.prepareStatement("select user_name, user_adress, AES_DECRYPT(UNHEX(user_phone), '" + variableValue + "') as user_phone, user_mail, point from USER where user_number="+op_a);
        ResultSet rsa = psa.executeQuery();

        if(rsa.next()) {
            user_name=rsa.getString("user_name");
            user_adress=rsa.getString("user_adress");
            user_phone=rsa.getString("user_phone");
            user_mail=rsa.getString("user_mail");
            point=rsa.getInt("point");
            if (cp>=price) {
            	cp=price;
                mprice=0;
               
            } else {
                mprice=price-cp;
            } 
        }
    } catch (Exception e) { 
        %><h1>실패a 원인: <%=e %></h1><%
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/buy.css" />
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/font-applesdgothicneo@1.0/all.min.css">
    <title>결제하기</title>
    
</head>
<body>
    <div id = "main">
        <div class = "main-title">결제하기</div>
        <div id = "body">
            <div class = "left">
                <div class = "info-container">
                    <div class = "info">
                        <div class = "info-title">주문 강의 정보</div>
                        <div class = "order-info">
                            <div class = "lec-thumb">
                                <div class="video-content">
                                    <div class = "video-info">
                                        <div class="title"><%=ct_name %></div>
                                        <div class="designer-info">
                                            <div class="designer">
                                                <%=te_name%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="thumb" style="background-image: url('../../../uploadimg/<%=img %>');"></div>
                            </div>
                            <div class = "order-lecture">
                                <div class = "ct-title"><%=ct_name %>&nbsp;(<%=cld*10%>일 연장)</div>
                                <div class = "teacher"><%=te_name %></div>
                                <div class = "price"><%=dec.format(price) %>원</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class = "info-container">
                    <div class = "info">
                        <div class = "info-title">주문자 정보</div>
                        <div class = "orderer-info">
                            <div class = "name-con">
                                <div>이름</div>
                                <div>전화번호</div> 
                                <div>이메일</div>
                            </div>
                            <div class = "name">
                                <div><%=user_name %></div>
                                <div>0<%=user_phone %></div>
                                <div><%=user_mail %></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class = "info-container">
                    <div class = "info">
                        <div class = "info-title">포인트</div>
                       
                        <div class = "coupon-info">
                                <%
                                if(cp>999){
									%>
									<div>남은포인트</div>
									<form method="post" action="buyud.jsp" class="coupon">
									<input type="text" name="ct" value="<%=id%>" hidden/>
                                    
                                    <input type="text" name="select" value="<%=cld%>" hidden/>
                                    <input class = "coupon-input" type = "text" value="<%=dec.format(point-cp) %>" readonly>
                                	<input class = "coupon-input" type = "text" name="cd" value="<%=point-cp %>" hidden>
                                	<input class = "coupon-input" type = "text" name="cp" value="0" hidden>
                                	<button class = "coupon-btn" type = "submit">사용취소</button>
                                	<%
                                }else{
                                	%>
                                	<div>포인트</div>
                                	<form method="post" action="buyud.jsp" class="coupon">
                                	<input type="text" name="ct" value="<%=id%>" hidden/>
                                    
                                    <input type="text" name="select" value="<%=cld%>" hidden/>
                                    <input class = "coupon-input" type = "text" value="<%=dec.format(point) %>" readonly>
                                	<input class = "coupon-input" type = "text" name="cp" value="<%=point %>" hidden>
                                	<button class = "coupon-btn" type = "submit">전액사용</button>
                                	<%
                                }
                                
                                
                                %>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class = "right">
                <div class = "pay-container">
                    <div class = "info">
                        <div class = "info-title">최종 결제금액</div>
                        <div class = "pay-info">
                            <div class = "pay">
                                <div class = "category">상품가격</div>
                                <div class = "cur-price"><%=dec.format(price) %>원</div>
                            </div>
                           
                            <div class = "pay">
                                <div class = "category">포인트 사용</div>
                                <div class = "cur-price">-<%=dec.format(cp) %>원</div>
                            </div>
                          
                            <hr class = "line">
                            <div class = "pay">
                                <div class = "main-category">총 결제금액</div>
                                <div class = "main-price"><%=dec.format(mprice) %>원</div>
                            </div>
                            <div class = "point">
                                <b class = "point-amount"><%=dec.format(price*0.05) %></b> 포인트 적립 예정
                            </div>
                        </div>
                    </div>
                </div>
                <% 
                if(mprice==0){
                	%><form name = "frm" method="post" class = "payment-btn">
                   <%  spw = spw+1606;  %>
                    <input class = "coupon-input" type = "text" name="cp" value="<%=cp %>" hidden>
                    <input class = "coupon-input" type = "text" name="id" value="<%=op_a %>" hidden>
                    <input class = "coupon-input" type = "text" name="ct" value="<%=id %>" hidden>
                    <input class = "coupon-input" type = "text" name="spw" value="<%=spw %>" hidden>
                    <input class = "coupon-input" type = "text" name="cod" value="<%=cld*10 %>" hidden>
                    <button class = "payment-btn" type = "button" onClick = "popup();">포인트로 결제하기</button>
                 
                 </form><% 
                }else{
                	%><div class = "payment-btn" onclick="serverAuth();">
                    결제하기
                 </div><%
                	
                }
                
                
                
                
                %>
                
            </div>
        </div>
    </div>
    
<script src="https://pay.nicepay.co.kr/v1/js/"></script> <!-- Server 승인 운영계 -->
<script>
function serverAuth() {
<%  spw = spw+1606;  %>
  AUTHNICE.requestPay({
    clientId: 'R2_b24dc94e10a441deb5a944baf8e17d04',
    method: 'card',
    vbankHolder: '더안건축학원',
    orderId: 'cb90cba1-e566-465d-817e-d66ee44119d4',
    amount: <%=mprice%>,
    goodsName: '나이스페이-상품',
    mailUserid: '<%=id%>',
    a: 'az',
    returnUrl: 'https://thean-ac.com:8081/source/html/thean_academy/buy/buyokud.jsp?id=<%=op_a%>&ct=<%=id%>&cp=<%=cp%>&spw=<%=spw%>&cod=<%=cld*10%>', //API를 호출할 Endpoint 입력
    fnError: function (result) {
      alert('응답: ' + result.errorMsg + '')
    }
 });
}
</script>
<script>
    function popup() {
       
        var title = "결제";
        var option = "width = 600, height = 500";
        window.open("", title, option);
        var frm = document.frm;
        frm.target = title;
        frm.action = "buyok.jsp";
        frm.submit();
        location.href = "ok.jsp"
        
        
    }
</script>
    

</body>
</html>