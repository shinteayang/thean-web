<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page session="true" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");
    String option=request.getParameter("option");
        
    String sql = "SELECT *, format(price, 0) as pricec FROM CATE";
    Connection conn = null;
    PreparedStatement pstmt = null;

    ResultSet res = null;
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/lectures.css"/>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            var option = "all";
            $(document).ready(function() {
                $('input[type=radio][name=menu]').change(function() {
                    option = $(this).val();
                    $.ajax({
                        url: "lectureSearch.jsp",
                        type: "GET",
                        data: {
                            option: option
                        },
                        success: function(data) {
                            $(".contents").html(data);
                        },
                        error: function(error) {
                            console.log(error);
                        }
                    });
                });
            });

            $(function() {
                $("#searchForm").submit(function(event) {
                    var text = $(".search-box").val().trim();
                    event.preventDefault(); // 기본 제출 동작을 중단합니다.
                    $.ajax({
                        url: "lectureInputSearch.jsp", // Ajax 요청을 보낼 URL
                        type: "GET", // HTTP 요청 메서드
                        data: {
                            text: text,
                            option: option
                        }, // 폼 데이터를 직렬화하여 전송
                        success: function(data) {
                            $(".contents").html(data);
                        },
                        error: function(error) {
                            console.log(error);
                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <jsp:include page="../header/header.jsp"></jsp:include>
        <div id = "main">
            <div id = "body">
                <div class = "menu-container">
                    <div class = "menu">
                        <form id="searchForm">
                            <div class = "search-container">
                                <div class = "search">
                                    <input name = "text" type = "text" class = "search-box">
                                    <button class = "search-btn">검색</button>
                                </div>
                            </div>
                            <ul id = "menu-group">
                                <label for = "all"><div>전체 </div> <input id = "all" type = "radio" name = "menu" value = "all" checked></label>
                                <div class = "line"></div>
                                <label for = "cad"><div>캐드 (2D)</div> <input id = "cad" type = "radio" name = "menu" value = "캐드"></label>
                                <div class = "line"></div>
                                <label for = "mo"><div>모델링 (3D)</div> <input id = "mo" type = "radio" name = "menu" value = "모델링(3D)"></label>
                                <div class = "line"></div>
                                <label for = "ar"><div>건축</div> <input id = "ar" type = "radio" name = "menu" value = "건축"></label>
                                <div class = "line"></div>
                                <label for = "in"><div>인테리어</div> <input id = "in" type = "radio" name = "menu" value = "인테리어"></label>
                                <div class = "line"></div>
                                <label for = "ce"><div>자격증</div> <input id = "ce" type = "radio" name = "menu" value = "자격증"></label>
                                <div class = "line"></div>
                                <label for = "el"><div>전기/설비/목공</div> <input id = "el" type = "radio" name = "menu" value = "전기/설비/목공"></label>
                                <div class = "line"></div>
                                <label for = "of"><div>건축사사무소</div> <input id = "of" type = "radio" name = "menu" value = "건축사사무소"></label>
                                <div class = "line"></div>
                                <label for = "pe"><div>개인시행, 창업</div> <input id = "pe" type = "radio" name = "menu" value = "개인시행,창업"></label>
                            </ul>
                        </form>
                    </div>
                </div>
                <div class = "content-container">
                    <div class= "contents">
                        <%
                            try {
                                conn = Util.getConnection();
                                pstmt = Prepare.getPrepare(conn, sql);

                                res = pstmt.executeQuery();

                                while (res.next()) {
                                    %>
                                        <a class="link" href="lecture_info.jsp?id=<%=res.getInt("categorynum")%>">
                                            <div class="video-content">
                                                <div class = "difficulty"></div>
                                                <div>
                                                    <div class="title"><%=res.getString("categoryname") %></div>
                                                    <div class="designer-info">
                                                        <div class="designer">
                                                            <%=res.getString("te_name")%>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class = "difficulty-price">
                                                    <div class = "difficulty-info">
                                                        <%
                                                            for (int j = 1 ; j <= res.getInt("diffculty") ; j++) { %>★<% }
                                                        %>
                                                    </div>
                                                    <div class="price-info">
                                                        <div class="price">₩<%=res.getString("pricec")%> / <%=res.getString("day")%>일</div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="thumb" style="background-image: url('../../../uploadimg/<%=res.getString("img") %>');"></div>
                                        </a>
                                    <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            } finally {
                                try {
                                    res.close();
                                    pstmt.close();
                                    conn.close();
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                        %>
                    </div>
                </div>    
            </div>
        </div>
    </body>
</html>