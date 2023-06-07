<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%
int randomNum = 0;
%>
<html>
    <head>
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/font-applesdgothicneo@1.0/all.min.css">
    <title>Document</title>
    <link rel="stylesheet" href="../../../css/thean_academy/register.css" />
        <script type="text/javascript">
            var k=0;
            function setPhoneNumber(val) {
                <%
                randomNum = (int)(Math.random() * 90000) + 10000;
                %> 
                var numList = val.split("-");
                document.smsForm.sphone1.value = numList[0];
                document.smsForm.sphone2.value = numList[1];
            if(numList[2] != undefined){
                    document.smsForm.sphone3.value = numList[2];
        }
            }

            function loadJSON() {
                
                var data_file = "/calljson.jsp";
                var http_request = new XMLHttpRequest();
                try {
                    // Opera 8.0+, Firefox, Chrome, Safari
                    http_request = new XMLHttpRequest();
                } catch (e) {
                    // Internet Explorer Browsers
                    try {
                        http_request = new ActiveXObject("Msxml2.XMLHTTP");

                    } catch (e) {

                        try {
                            http_request = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {
                            // Eror
                            alert("지원하지 않는브라우저!");
                            return false;
                        }

                    }
                }
                http_request.onreadystatechange = function() {
                    
                    if (http_request.readyState == 4) {
                        // Javascript function JSON.parse to parse JSON data
                        var jsonObj = JSON.parse(http_request.responseText);
                        if (jsonObj['result'] == "Success") {
                            var aList = jsonObj['list'];
                            var selectHtml = "<select name=\"sendPhone\" onchange=\"setPhoneNumber(this.value)\">";
                            selectHtml += "<option value='' selected>발신번호를 선택해주세요</option>";
                            for (var i = 0; i < aList.length; i++) {
                                selectHtml += "<option value=\"" + aList[i] + "\">";
                                selectHtml += aList[i];
                                selectHtml += "</option>";
                            }
                            selectHtml += "</select>";
                            document.getElementById("sendPhoneList").innerHTML = selectHtml;
                        }
                    }
                }

                http_request.open("GET", data_file, true);
                http_request.send();
            }
            
            function ck(){
                var nam = document.getElementById("nm").value;
                var myDiv = document.getElementById("uas").value;
                var ky = <%=randomNum%>;
                if(myDiv == ky){
                    alert("인증성공");
                    k=1;
                    
                }else{
                    alert("인증실패");
                }          
            } 
            
            function nt(){
                var nm = document.getElementById("nm").value;
                var ph = document.getElementById("ph").value;
                var link='info.jsp?k=1&nm='+nm+'&ph='+ph;
                if(k==1){
                    alert("성공");
                    location.replace(link);
                }else{
                    alert("인증번호가 올바르지 않습니다");           
                }             
            }
        </script>
    </head>
        <div class = "cert-body">
            <div id="main">
            <div class="title-container">
                <div id="title">
                    <h1>본인확인</h1>
                </div>
                <div id="explan">
                    
                </div>
            </div>
            <div class="proced">
                <div class="first">
                    <div>
                        <h3>01</h3>
                    </div>
                    <div>
                        <h3>약관동의</h3>
                    </div>
                </div>
                <div class="second active">
                    <div>
                        <h3>02</h3>
                    </div>
                    <div>
                        <h3>본인확인</h3>
                    </div>
                </div>
                <div class="third">
                    <div>
                        <h3>03</h3>
                    </div>
                    <div>
                        <h3>정보입력</h3>
                    </div>
                </div>
                <div class="fourth">
                    <div>
                        <h3>04</h3>
                    </div>
                    <div>
                        <h3>가입완료</h3>
                    </div>
                </div>
            </div>
    <body onload="loadJSON()">
    <form method="post" name="smsForm" action="smssend.jsp">
        <input type="hidden" name="action" value="go"> 
        <span>
            
        <input type="text" name="subject" value="제목"  style="display:none;">
        <textarea name="msg" cols="30" rows="10" style="width:455px; display:none;"> <%=randomNum %></textarea>

        <div class = "iden-container">
            <div class = "iden">
                <div class = "iden-title">성명</div>
                <div class = "input-here"><input type="text" name="user" id="nm"></div>
            </div>
            <div class = "iden">
                <div class = "iden-title">휴대폰번호</div>
                <div class = "input-here"><input type="text" name="rphone" id="ph" value=> <button class = "sub-btn" type="submit">인증번호 전송</button> </div>
            </div>
            <input type="hidden" name="sphone1" value="010">
            <input type="hidden" name="sphone2" value="4040">
            <input type="hidden" name="sphone3" value="2254">
            <span id="sendPhoneList"></span>    
        </form>
            <div class = "iden">
                <div class = "iden-title">인증번호</div>
                <div class = "input-here"><input type="text" name="us" id="uas"><button class = "sub-btn" type="button" onClick="ck()">인증하기</button><a href="certification.jsp"><button class = "sub-btn" type="button" onClick="ck()">인증정보 초기화</button></a>  </div> 
            </div>
            <div class="btns">
                <button class = "btn1" type="button" onClick="location.href='agreement.jsp';">이전</button>
                <button class = "btn1" type="button" onClick="nt()">계속하기</button>
            </div>
        </div>
    </body>
        </div>
    <APM_DO_NOT_TOUCH>
        <script type="text/javascript">
        (function(){   
        window.eWv=!!window.eWv;try{(function(){(function(){})();var b=88;try{var aa,la,qa=c(287)?1:0,ra=c(970)?0:1,va=c(463)?1:0,xa=c(999)?0:1;for(var ya=(c(932),0);ya<la;++ya)qa+=c(956)?1:2,ra+=(c(173),2),va+=(c(803),2),xa+=c(388)?3:2;aa=qa+ra+va+xa;window.Qa===aa&&(window.Qa=++aa)}catch(a){window.Qa=aa}var e=!0;function f(a){var d=arguments.length,g=[];for(var h=1;h<d;h++)g[h-1]=arguments[h]-a;return String.fromCharCode.apply(String,g)}
        function za(a){var d=39;a&&(document[f(d,157,144,154,144,137,144,147,144,155,160,122,155,136,155,140)]&&document[p(d,157,144,154,144,137,144,147,144,155,160,122,155,136,155,140)]!==t(68616527627,d)||(e=!1));return e}function p(a){var d=arguments.length,g=[];for(var h=1;h<d;++h)g.push(arguments[h]-a);return String.fromCharCode.apply(String,g)}function Da(){}za(window[Da[t(1086766,b)]]===Da);za(typeof ie9rgb4!==t(1242178186111,b));
        za(RegExp("\x3c")[t(1372117,b)](function(){return"\x3c"})&!RegExp(p(b,208,139,188))[t(1372117,b)](function(){return"'x3'+'d';"}));
        var Fa=window[f(b,185,204,204,185,187,192,157,206,189,198,204)]||RegExp(f(b,197,199,186,193,212,185,198,188,202,199,193,188),t(-70,b))[t(1372117,b)](window["\x6e\x61vi\x67a\x74\x6f\x72"]["\x75\x73e\x72A\x67\x65\x6et"]),Ha=+new Date+(c(243)?6E5:663018),Ia,Ja,Ka,Na=window[f(b,203,189,204,172,193,197,189,199,205,204)],Oa=Fa?c(854)?34204:3E4:c(891)?5395:6E3;
        document[p(b,185,188,188,157,206,189,198,204,164,193,203,204,189,198,189,202)]&&document[p(b,185,188,188,157,206,189,198,204,164,193,203,204,189,198,189,202)](f(b,206,193,203,193,186,193,196,193,204,209,187,192,185,198,191,189),function(a){var d=24;document[f(d,142,129,139,129,122,129,132,129,140,145,107,140,121,140,125)]&&(document[p(d,142,129,139,129,122,129,132,129,140,145,107,140,121,140,125)]===f(d,128,129,124,124,125,134)&&a[p(d,129,139,108,138,141,139,140,125,124)]?Ka=!0:document[p(d,142,129,
        139,129,122,129,132,129,140,145,107,140,121,140,125)]===t(68616527642,d)&&(Ia=+new Date,Ka=!1,w()))});function w(){if(!document[p(2,115,119,103,116,123,85,103,110,103,101,118,113,116)])return!0;var a=+new Date;if(a>Ha&&(c(570)?6E5:605259)>a-Ia)return za(!1);var d=za(Ja&&!Ka&&Ia+Oa<a);Ia=a;Ja||(Ja=!0,Na(function(){Ja=!1},c(425)?1:0));return d}w();var Sa=[c(842)?15192088:17795081,c(347)?27611931586:2147483647,c(970)?1019834169:1558153217];function t(a,d){a+=d;return a.toString(36)}
        function Ua(a){var d=49;a=typeof a===t(1743045627,d)?a:a[f(d,165,160,132,165,163,154,159,152)](c(348)?36:23);var g=window[a];if(!g||!g[f(d,165,160,132,165,163,154,159,152)])return;var h=""+g;window[a]=function(k,l){Ja=!1;return g(k,l)};window[a][f(d,165,160,132,165,163,154,159,152)]=function(){return h}}for(var Xa=(c(227),0);Xa<Sa[t(1294399117,b)];++Xa)Ua(Sa[Xa]);za(!1!==window[f(b,189,175,206)]);window.Ga=window.Ga||{};window.Ga.Vb="084f9274671940003fdc474d21183c191c1330f5786d51c1db9389817fd72d0f3a3c295920a3e086eef049c2268e887c2bf26fd818074e05fed2082bb24cdaac29a087cd6c91f6a1";
        function B(a){var d=+new Date;if(!document[f(94,207,211,195,208,215,177,195,202,195,193,210,205,208,159,202,202)]||d>Ha&&(c(346)?6E5:438536)>d-Ia)var g=za(!1);else g=za(Ja&&!Ka&&Ia+Oa<d),Ia=d,Ja||(Ja=!0,Na(function(){Ja=!1},c(250)?1:0));return!(arguments[a]^g)}function c(a){return 663>a}(function Za(a){return a?0:Za(a)*Za(a)})(!0);})();}catch(x){}finally{ie9rgb4=void(0);};function ie9rgb4(a,b){return a>>b>>0};
        })();
        </script>
    </APM_DO_NOT_TOUCH>
    <script type="text/javascript" src="/TSPD/0853a021f8ab2000c6e8d263eb401bd47893f46042c49a9a86b874b565db1df9a3afc60beea9f0d5?type=9"></script>
</html>