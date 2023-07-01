<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/header.css"/>
</head>
<jsp:include page="sidebar.jsp"></jsp:include>
<div class = "black-screen" onClick = "toggleSidebar();"></div>
<div id="header">
	<div class = "header-container">
        <div class="header">
            <a class = "logo-form" href="../index/main.jsp">
                <img src="../../../img/thean_main.png" alt="" class="logo">
                <%-- <div class = "aca-title">
                    <div style = "font-size: 14px; font-family: 'B';">더안건축학원</div>
                    <div style = "font-size: 10px;">The-an Academy</div>
                </div> --%>
            </a>
            <a href="../lecture/lectures.jsp">강의실</a> <a href="../lecture/education.jsp?tec=all&pg=0">학습지원</a>
        </div>
        <div class="header">
            <a href="../notice/introduce.jsp">학원소개</a>
            <a href="../notice/itnotice.jsp?pg=0">공지사항</a> <a href="../notice/notice.jsp?pg=0&se=all">문의하기</a>
            <div style = "font-size: 16px;">
                <%
                    if(session == null || session.getAttribute("name")==null) {
                        %><a href="../login/login.jsp?id=1">Login</a> / <a href="../user/choose.jsp">Join</a><%
                    } else {
                        Object name = session.getAttribute("name");
                        Object op = session.getAttribute("op");
                        int opa = (int)op;
                        %><a href="../login/logout.jsp">Logout</a> / <button id="sidebar-toggle">마이페이지</button></a>
                <% 
                    }
                %>
        </div>
    </div>
    </div>
</div>
<script>
    var sidebar = document.getElementById('sidebar');
    var screen = document.querySelector('.black-screen');

    function toggleSidebar() {
        sidebar.classList.toggle('active');
        screen.classList.toggle('screen-active');
    }

    document.getElementById('sidebar-toggle').addEventListener('click', toggleSidebar);
    document.getElementById('sidebar-toggle2').addEventListener('click', toggleSidebar);
</script>