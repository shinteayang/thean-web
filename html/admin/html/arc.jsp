<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.UtilArc"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javax.servlet.*" %>
<!doctype html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>더안건축-관리자</title>
        <link rel="stylesheet" href="../css/arc.css" />
        <link rel="stylesheet" href="../css/co.css" />
    </head>
    <body>
        <div class = "body">
            <jsp:include page="menubar.jsp"></jsp:include>
            <div class="main-container">
                <div class = "main-elements">
                    <div class="main-title">건축 사진 관리</div>
                    <div class="main-element">
                        <div style = "display: flex; justify-content: space-between;">
                            <div>
                                <form action="">
                                    <input type="text" class = "search" placeholder = "검색어 입력" name="search">
                                    <button class = "search-btn" type = "submit">검색</button>
                                    <select name="select" id="">
                                        <option value="all">카테고리 선택</option>
                                        <option value="설계">설계</option>
                                        <option value="실측">실측</option>
                                        <option value="준공">준공</option>
                                    </select>
                                </form>
                            </div>
                            <div>
                                <button type = "button" class = "search-btn" onClick = "location.href='add_arc.jsp'">추가</button>
                            </div>
                        </div>
                        <table id = "table">
                            <tr>
                                <th>이름</th>
                                <th>용도</th>
                                <th>위치</th>
                                <th>대지면적</th>
                                <th>연면적</th>
                                <th>설계</th>
                                <th>촬영</th>
                                <th>기타</th>
                                <th>기능</th>
                            </tr>
                            <%
                                String select = request.getParameter("select");
                                String search = request.getParameter("search");
                                String sqla="";
                                String sqlb="";
                                String sql="";
                                if(search.equals("")){
                                        sqla="";

                                }else{
                                    sqla="and nm like'%"+search+"%'";

                                }

                                if(select.equals("all")){
                                    sqlb=" where (cat ='설계' or cat='실측' or cat='준공')";
                                }else{

                                    sqlb=" where cat='"+select+"'";
                                }

                                Connection conn = null;
                                conn = UtilArc.getConnection();

                                try {
                                    sql="select * from arc"+sqlb+sqla;
                                    PreparedStatement ps = conn.prepareStatement(sql);
                                    ResultSet rs = ps.executeQuery();

                                while(rs.next()) { 
                                        %><tr>
                                        <form action="arc_update.jsp">
                                <td><textarea type="text" name="nm"><%=rs.getString("nm")%></textarea></td>
                                <td><textarea type="text" name="work"><%=rs.getString("work")%></textarea></td>
                                <td><textarea type="text" name="gps"><%=rs.getString("gps")%></textarea></td>
                                <td><textarea type="text" name="ground"><%=rs.getString("ground")%></textarea></td>
                                <td><textarea type="text" name="grow"><%=rs.getString("grow")%></textarea></td>
                                <td><textarea type="text" name="design"><%=rs.getString("design")%></textarea></td>
                                <td><textarea type="text" name="photo"><%=rs.getString("photo")%></textarea></td>
                                <td><textarea type="text" name="etc"><%=rs.getString("etc")%></textarea></td>
                                <input type="text" name="id" value="<%=rs.getString("id")%>" hidden>
                                <td><b> <button type="submit">수정</button></b>/<b> <a href="arc_drop.jsp?id=<%=rs.getString("id")%>&nm=<%=rs.getString("nm")%>&gps=<%=rs.getString("gps")%>">삭제</a></b></td>
                                </form>
                            </tr><%
                                    }     
                                } catch(Exception e) { 
                                    %><h1><%=sql %></h1><% 
                                }                    
                            %>
                            
                            
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script>
    
    </script>
</html>