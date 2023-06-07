<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*"%>
<%@ page session="true"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%@ page import="java.io.*"%>

<%
    String variablePath = "/opt/tomcat/webapps/ROOT/WEB-INF/keys/key.sh";
    String variableName = "KEY";
    String variableValue = "";

    BufferedReader br = new BufferedReader(new FileReader(variablePath));
    String line = "";

    while ((line = br.readLine()) != null) {
        if (line.startsWith(variableName)) {
        variableValue = line.substring(line.indexOf("=") + 1);
        }
    }

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

    int number = 0;
    int op_a = 0;
    int i = 1;
    int point=0;
    int scp=0;

    int id = Integer.parseInt(request.getParameter("id"));
    int cp = Integer.parseInt(request.getParameter("cp"));

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
            price=rs.getInt("price");
            ct_name=rs.getString("categoryname");
            day=rs.getString("day");
            te_name=rs.getString("te_name");
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
            if (cp>=price-1000) {
                mprice=price-(price-1000);
                scp=price-1000;
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
    <link rel="stylesheet" type="text/css" href="../../css/thean_academy/buy.css" />
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
                            <div class = "thumb" style="background-img:ulr()"></div>
                            <div class = "order-lecture">
                                <div class = ""><h3><%=ct_name %></h3></div>
                                <div><%=te_name %></div>
                                <div><%=price %></div>
                                <div><%=day %></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class = "info-container">
                    <div class = "info">
                        <div class = "info-title">주문자 정보</div>
                        <div class = "orderer-info">
                            <div>
                                <div class = "name"><%=user_name %></div>
                                <div class = "digit">0<%=user_phone %></div>
                                <div class = "email"><%=user_mail %></div>
                                
                            </div>
                            <button class = "edit-btn">수정</button>
                        </div>
                    </div>
                </div>
                <div class = "info-container">
                    <div class = "info">
                        <div class = "info-title">쿠폰 / 포인트</div>
                        <div class = "coupon-info">
                            <div>쿠폰</div>
                            <div class = "coupon">
                                <input class = "coupon-input" type = "text">
                                <button class = "coupon-btn" type = "button">쿠폰사용</button>
                            </div>
                        </div>
                        <div class = "coupon-info">
                            <div>포인트</div>
                            <div class = "coupon">
                                <input class = "coupon-input" type = "text" value="<%=point %>">
                                <button class = "coupon-btn" type = "button" ><a href="buy.jsp?id=<%=id %>&cp=<%=point%>" style="width:100%; height:100%">전액사용</a></button>
                            </div>
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
                                <div class = "price"><%=price %></div>
                            </div>
                           
                            <div class = "pay">
                                <div class = "category">포인트 사용</div>
                                <div class = "price">-<%=scp %>원</div>
                            </div>
                          
                            <hr class = "line">
                            <div class = "pay">
                                <div class = "main-category">총 결제금액</div>
                                <div class = "main-price"><%=mprice %></div>
                            </div>
                            <div class = "point">
                                <b class = "point-amount"><%=price*0.05 %></b> 포인트 적립 예정
                            </div>
                        </div>
                    </div>
                </div>
                <div class = "payment-btn" onclick="payappPay();">
                   결제하기
                </div>
            </div>
        </div>
    </div>
    
<script src="//lite.payapp.kr/public/api/payapp-lite.js"></script>
<script>
    PayApp.setDefault('userid',     'thean100');
    PayApp.setDefault('shopname',   '더안건축');
    function payappPay(){
    	
        PayApp.setParam('goodname', '<%=ct_name %>');
        PayApp.setParam('price', '<%=mprice%>');
        PayApp.setParam('recvphone', '0<%=user_phone%>');
        PayApp.setParam('var2', '<%=user_name%>');
        PayApp.setParam('smsuse', 'n');
<%  spw = spw+1606;  %>
        PayApp.setParam('returnurl', 'https://thean-ac.com:8081/source/html/thean_academy/buyok.jsp?id=<%=op_a%>&ct=<%=id%>&cp=<%=cp%>&spw=<%=spw%>');
        PayApp.setParam('redirectpay', '1');
        PayApp.setParam('buyerid', 'llzed707');
        PayApp.setParam('skip_cstpage', 'y');
        PayApp.call();
        location.replace("ok.jsp");
        
    }
   
    
</script>

    

</body>
</html>