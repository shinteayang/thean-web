<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<style>
    #footer {
        background-color: #fff;
        width: 100%;
        height: 140px;
        z-index: 10001;
        position: absolute;
        border-top: 1px solid #ddd;
    }

    .footer-wrap {
        width: 65vw;
        margin: 0 auto;
        margin-top: 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
    }

    .footer-logo {
        width: 80px;
    }

    .aca {
        font-size: 20px;
        font-weight: bold;
    }

    p {
        font-size: 12px;
    }

    .aca-f {
        display: flex;
        margin-top: 20px;
        gap: 40px;
    }

    .agr p {
        font-size: 12px;
        font-weight: bold;
    }

    .agr p a {
        color: #000;
    }

    .icon {
        background-position: center center;
        background-repeat: no-repeat;
        background-size: cover;
    }

    .icons {
        display: flex;
        gap: 20px;
        align-items: center;
    }

    .youtube {
        width: 36px;
        height: 36px;
        background-image: url('../../../img/youtube.png');
    }

    .insta {
        width: 30px;
        height: 30px;
        background-image: url('../../../img/insta.png');
    }

    .footer-img {
        width: 26%;
    }
</style>
<div id = "footer">
    <div class = "footer-wrap">
    <div class = "aca-f">
        <div class = "logo-form" href="../index/main.jsp">
            <img src="../../../img/thean_main.png" alt="" class="logo">
            <%-- <div class = "aca-title">
                <div style = "font-size: 14px; font-family: 'B';">더안건축학원</div>
                <div style = "font-size: 10px;">The-an Academy</div>
            </div> --%>
        </div>
            <img src="../../../img/footer.jpg" alt="" class = "footer-img">
         
            <div class = "agr">
                <p><a href="../index/policy.jsp">이용약관</a></p>
                <p><a href="../index/privacy.jsp">개인정보처리방침</a></p>
            </div>
        </div>
            <%-- <div>
                <p>더안건축학원&nbsp;&nbsp;|&nbsp;&nbsp;대표 안용진&nbsp;&nbsp;|&nbsp;&nbsp;서울시 강북구 도봉로 100, 4층</p>
                <p>사업자번호: 305-95-37596&nbsp;&nbsp;|&nbsp;개인정보책임자: 신태양</p>
                <p>통신판매번호: 2023-서울강북-0562</p>
            </div> --%>
            <div class = "icons">
                <div class = "icon youtube" OnClick="window.open('https://www.youtube.com/@user-gx3iy2uv5x')"></div>
                <div class = "icon insta" OnClick="window.open('https://instagram.com/architecture_the_an?igshid=MzRlODBiNWFlZA==')"></div>
            </div>
    </div>
</div>