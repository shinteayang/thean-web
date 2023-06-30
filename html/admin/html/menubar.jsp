<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="../css/menubar.css">
</head>
<div class="menu-container">
    <div class="menu-elements">
        <div onClick = "location.href='index.jsp';" class="title">더안 관리자</div>
        <div class="menu">
            <a onClick = "togle(aca);" style = "font-family: 'B';">더안건축학원</a>
            <div class = "board aca">
                <a onClick = "togle(b);">게시판 관리</a>
                <div class = "board b">
                    <a href="a_edu.jsp">학습지원 관리</a>
                    <a href="a_notice.jsp">공지사항 관리</a>
                    <a href="a_contact.jsp">문의 관리</a>
                </div>
                <a href="a_lecture.jsp">강의 관리</a>
                <a href="a_profit.jsp">수익 관리</a>
                <a href="a_teacher.jsp">강사 관리</a>
            </div>
            <a onClick = "togle(arc);" style = "font-family: 'B';">더안건축</a>
            <div class = "board arc">
                <a href="slide.jsp">슬라이드 관리</a>
                <a href="arc.jsp?select=all&search=">건축 사진 관리</a>
            </div>
        </div>
    </div>
</div>
<script>
    var aca = document.querySelector('.aca');
    var b = document.querySelector('.b');
    var arc = document.querySelector('.arc');
    function togle(e) {
        e.classList.toggle('hidden');
    }
</script>