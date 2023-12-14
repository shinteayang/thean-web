<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" href="../css/menubar.css">
</head>
<div class="menu-container">
    <div class="menu-elements">
        <div onClick = "location.href='index.jsp';" class="title">더안 관리자</div>
        <div class="menu">
            <a class = "m" onClick = "togle(aca);" style = "font-family: 'B';">더안건축학원</a>
            <div class = "board aca">
                <a class = "m"  onClick = "togle(b);">게시판 관리</a>
                <div class = "board b">
                    <a class = "m" href="a_edu.jsp">학습지원 관리</a>
                    <a class = "m" href="a_notice.jsp">공지사항 관리</a>
                    <a class = "m" href="a_contact.jsp">문의 관리</a>
                </div>
                <a class = "m" href="a_lecture.jsp">강의 관리</a>
                <a class = "m" href="a_video.jsp">영상 관리</a>
                <a class = "m" href="a_profit.jsp?year=2023&month=1&teacher=안용진">정산 관리</a>
                <a class = "m" href="a_teacher.jsp">강사 관리</a>
                <a class = "m" href="coupon.jsp">할인 쿠폰 관리</a>
            </div>
            <a class = "m"  onClick = "togle(arc);" style = "font-family: 'B';">더안건축</a>
            <div class = "board arc">
                <a class = "m" href="slide.jsp">슬라이드 관리</a>
                <a class = "m" href="arc.jsp?select=all&search=">건축 사진 관리</a>
                <a class = "m" href="about.jsp">About 'The-An' 편집</a>
                <a class = "m" href="history.jsp">History 편집</a>
                <a class = "m" href="organization.jsp">Organization 편집</a>
                <a class = "m" href="people.jsp">People 편집</a>
                <a class = "m" href="arc_contact.jsp">Contact 편집</a>
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