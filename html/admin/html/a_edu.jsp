<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="DBPKG.Prepare"%>
<%

    String sql = "select * from tenoice";
    Connection conn = Util.getConnection();
   

    
%>
<!doctype html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>더안건축-관리자</title>
        <link rel="stylesheet" href="../css/notice.css" />
        <link rel="stylesheet" href="../css/co.css" />
    </head>
    <body>
        <div class = "body">
            <jsp:include page="menubar.jsp"></jsp:include>
            <div class="main-container">
                <div class = "main-elements">
                    <div class="main-title"></div>
                    <table id = "table">

   
                        <tr>
                            <th style = "width: 10%;">번호</th>
                            <th style = "width: 55%;">제목</th>
                            <th style = "width: 10%;">강사</th>
                            <th style = "width: 10%;">날짜</th>
                            <th style = "width: 15%;">기능</th>
                        </tr>
                                         <%
                     try {
              
                         PreparedStatement ps = Prepare.getPrepare(conn, sql);
                        ResultSet rs = ps.executeQuery();
                    
                        while(rs.next()) {
                            %>  
                               <form action="">
                            <tr>
                                <td><%=rs.getString("no")%></td>
                              
                                <td style = "text-align: left;"><a href = "edu.jsp?id=<%=rs.getString("non")%>"><%=rs.getString("idx")%></a></td>
                                <td><%=rs.getString("answerte")%></td>
                                <td><%=rs.getString("date")%></td>
                                <td>삭제 / <a href="edu_answer.jsp?id=<%=rs.getString("non")%>">답변</a></td>
                            </tr>
                            </form>



                            <%   
                        } 
                    }catch(Exception e){




                    }
                    
                    %>
                        <form action="">
                            <tr>
                                <td>1</td>
                                <td style = "text-align: left;">강의에 대한 질문</td>
                                <td>안용진</td>
                                <td>20230630</td>
                                <td>삭제 / 답변</td>
                            </tr>
                        </form>
                        <form action="">
                            <tr>
                                <td>1</td>
                                <td style = "text-align: left;">강의에 대한 질문</td>
                                <td>안용진</td>
                                <td>20230630</td>
                                <td>삭제 / 답변</td>
                            </tr>
                        </form>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>