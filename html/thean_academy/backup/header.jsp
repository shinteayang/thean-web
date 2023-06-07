<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<link rel="stylesheet" type="text/css"
	href="../../css/thean_academy/header.css" />
</head>
<div id="header">
    <div class = "logo-container"><a href="main.jsp"><img src="../../mainlogo/thean academy logo.jpg" alt="" class="logo" /></a></div>
	<div class = "header-container">
        <div class="header-left">
            <a href="lectures.jsp">강의실</a> <a href="education.jsp">학습지원</a>
        </div>
        <div class="header-right">
            <a href="itnotice.jsp">공지사항</a> <a href="notice.jsp">문의하기</a>
            <div>
                <%
                    if(session == null || session.getAttribute("name")==null) {
                        %><a href="login.jsp?id=1">login</a> / <a href="agreement.jsp">Join</a><%
                    } else {
                        Object name = session.getAttribute("name");
                        Object op = session.getAttribute("op");
                        int opa = (int)op;
                        %><a href="logout.jsp">Logout</a>/<button id="sidebar-toggle"><%=name %></button>님</a>
                <div id="sidebar">
                    <div id="main_a">
                        <div id="a_a">
                            <div id="a_c">
                                <h1 style="margin-left: 2%;"><%=name%>님</h1>
                                <%
                                if(opa >= 5){
                                	
                                %>
                                <a href="../admin/index.jsp">관리자페이지</a>
                                <%	
                                }
                                %>
                            </div>
                            <button id="sidebar-toggle2">x</button>
                        </div>
                        <div id="a_b"></div>
                    </div>
                    <div id="main_b">
                        <div class="ic_a">
                            <div class="ic"></div>
                            <div class="ic"></div>
                            <div class="ic"></div>
                        </div>
                        <div class="ic_a">
                            <div class="ic"></div>
                            <div class="ic"></div>
                            <div class="ic"></div>
                        </div>
                    </div>
                    <div id="main_c"></div>
                </div>
            </div>
            <script>
                var sidebar = document.getElementById('sidebar');

                function toggleSidebar() {
                    sidebar.classList.toggle('active');
                }

                document.getElementById('sidebar-toggle').addEventListener('click',
                        toggleSidebar);
                document.getElementById('sidebar-toggle2').addEventListener(
                        'click', toggleSidebar);
            </script>
                <% 
                    }
                %>
        </div>
    </div>
    </div>
</div>