<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Document</title>
        <style>
            * {
                margin: 0;
                padding: 0;
            }

            #body {
                width: 100%;
                height: 100vh;
            }

            .main {
                width: 600px;
                display: flex;
                gap: 100px;
                justify-content: center;
                left: 0;
                right: 0;
                top: 40%;
                position: absolute;
                margin: auto;
            }

            .icon {
                width: 160px;
                height: 160px;
                border-radius: 50px;
                transition: 0.2s ease-in-out;
                background-position: center center;
                background-size: 70%;
                background-repeat: no-repeat;
            }

            .contact {
                background-color: #244664;
                background-image: url('../../../img/chat.png');
                box-shadow: 0px 2px 30px 20px rgba(71, 140, 200, 0.3);
            }

            .kakao {
                background-color: #ffcf30;
                background-image: url('../../../img/kakao.png');
                box-shadow: 0px 2px 30px 20px rgba(245, 202, 85, 0.3);
            }

            .contact:hover {
                box-shadow: 0px 2px 40px 30px rgba(71, 140, 200, 0.5);
            }

            .kakao:hover {
                box-shadow: 0px 2px 40px 30px rgba(245, 202, 85, 0.5);
            }

            .title {
                margin-top: 50px;
                text-align: center;
                font-family: 'B';
                font-size: 1.8em;
            }

            .intro {
                text-align: center;
                padding-top: 170px;
                font-family: 'B';
                font-size: 2.4em;
            }
        </style>
    </head>
    <body>
        <jsp:include page="../header/header.jsp"></jsp:include>
        <div id = "body">
            <div class = "intro">
                더안건축학원에 대해 궁금한 사항이 있으신 분은<br> 문의나 오픈채팅을 이용해주시기 바랍니다.
            </div>
            <div class = "main">
                <div>
                    <div class = "icon contact" onClick = "location.href='../notice/notice.jsp?pg=0&se=all'"></div>
                    <div class = "title">문의하기</div>
                </div>
                <div>
                    <div class = "icon kakao" onClick = "location.href='https://open.kakao.com/o/g2kr00ad'"></div>
                    <div class = "title">카카오톡</div>
                </div>
            </div>
        </div>
        <jsp:include page="../header/footer.jsp"></jsp:include>
    </body>
</html>