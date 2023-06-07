<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
<script src="//lite.payapp.kr/public/api/payapp-lite.js"></script>
<script>
    PayApp.setDefault('userid',     'thean100');
    PayApp.setDefault('shopname',   '더안건축');
    function payappPay(){
        PayApp.setParam('goodname', '강의테스트');
        PayApp.setParam('price', '10000000');
        PayApp.setParam('recvphone', '01048331613');
        PayApp.setParam('smsuse', 'y');
        PayApp.setParam('returnurl', 'buyok.jsp');
        PayApp.setParam('redirectpay', '1');
        PayApp.setParam('buyerid', 'llzed707');
        PayApp.setParam('skip_cstpage', 'y');
        PayApp.call();
    }
</script>
<a href="#" onclick="payappPay();">결제하기</a>
</body>
</html>
