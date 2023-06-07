<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    String name = "";
    String num=  "";
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="../../css/thean_academy/notice.css">   
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div id="body">
            <div>
                <div class="title">1대1 문의</div>
            </div>
            <div class = "table-container">
                <table id="table">
                    <th class="th">문의번호</th>
                    <th class="th">문의제목</th>
                    <th class="th">문의날짜</th>
                    <th class="th">처리상태</th>
                
                    <%   
                        if(session == null || session.getAttribute("name")==null) {
                            %>
                                <script>
                                alert("로그인 후 이용해주십시요");
                                history.go(-1);
                                </script>
                            <% 
                        } else {
                            
                        Object namea = session.getAttribute("name");
                        Object numa = session.getAttribute("number");
                        
                        name = namea.toString();
                        num = numa.toString();
                            
                        }

                        request.setCharacterEncoding("UTF-8");

                        String sql = "select * from cs where user_no="+num+ " ORDER BY no DESC;";

                        Connection conn = Util.getConnection();     
                        ResultSet res = null;
                        
                        try {	 
                            PreparedStatement ps = Prepare.getPrepare(conn, sql);
                            ResultSet rs = ps.executeQuery();
							int inm=1;
                            while(rs.next()) {
                                %>
                                    <tr>
                                        <td><%=rs.getInt("no")%></td>
                                        <td style = "text-align: left;"><a href="qaas.jsp?id=<%=rs.getInt("no")%>&us=<%=rs.getInt("user_no")%>"><%=rs.getString("idx") %></a></td>
                                        <td><%=rs.getString("date") %></td>
                                        <td><%=rs.getString("checkaa") %></td>  	
                                    </tr>
                                <%   
                                inm++;
                            }
                            %>
                            <h><a href="gonotice.jsp">문의 작성</a></h>
                            <%
                        } catch (Exception e) { 
                            %><h1>리다이렉션중</h1><%
                        }
                    %>
                </table>
            </div>
        </div>
        <div class = "kakao" OnClick="window.open('https://open.kakao.com/o/g2kr00ad')"></div>
	    <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>