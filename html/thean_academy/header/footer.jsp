<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<style>  
    #footer {
        background-color: #fff;
        width: 100%;
        height: 180px;
        z-index: 10001;
        position: absolute;
        border-top: 1px solid #ddd;
    }

    .footer-wrap {
        width: 65vw;
        margin: 0 auto;
        margin-top: 30px;
        display: flex;
        gap: 60px;
    }

    .footer-logo {
        width: 80px;
    }

    .aca {
        font-size: 20px;
        font-weight: bold;
    }

    p {
        font-size: 16px;
    }

    .aca-f {
        display: flex;
        margin-top: 24px;
        gap: 80px;
    }

    .agr p {
        font-size: 16px;
        font-weight: bold;
    }

    .agr p a {
        color: #000;
    }

    .icon {
        width: 48px;
        height: 48px;
        border-radius: 16px;
        background-color: #244664;
        background-position: center center;
        background-size: 65%;
        background-repeat: no-repeat;
    }

    .icons {
        display: flex;
        gap: 20px;
        margin-left: 242px;
    }

    .youtube {
        background-image: url('../../../img/youtube.png');
    }

    .insta {
        background-image: url('../../../img/insta.png');
    }
</style>
<div id = "footer">
    <div class = "footer-wrap">
        <div class = "logo-form" href="../index/main.jsp">
            <img src="../../../mainlogo/thean-navy.png" alt="" class="logo">
            <div class = "aca-title">
                <div style = "font-size: 18px; font-family: 'B';">더안건축학원</div>
                <div style = "font-size: 13px;">The-an Academy</div>
            </div>
        </div>
        <div>
            <div class = "aca-f">
                <div>
                    <p>더안건축학원&nbsp;&nbsp;|&nbsp;&nbsp;대표 안용진&nbsp;&nbsp;|&nbsp;&nbsp;서울시 강북구 도봉로 100, 4층</p>
                    <p>사업자번호: 305-95-37596&nbsp;&nbsp;|&nbsp;개인정보책임자: 신태양</p>
                    <p>통신판매번호: 2023-서울강북-0562</p>
                </div>
                <div class = "agr">
                    <p><a href="../index/policy.jsp">이용약관</a></p>
                    <p><a href="../index/privacy.jsp">개인정보처리방침</a></p>
                </div>
                <div class = "icons">
                    <div class = "icon youtube" OnClick="window.open('www.google.com')"></div>
                    <div class = "icon insta" OnClick="window.open('www.google.com')"></div>
                </div>
            </div>
        </div>
    </div>
</div>