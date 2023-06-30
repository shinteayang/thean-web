<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/notice.css">  
    </head>
    <body>
        <jsp:include page="../header/header.jsp"></jsp:include>
        <div id="body">
            <div>
                <div class="title">공지사항</div>
            </div>
            <div class = "table-container">
                <table id="table">
                    <th class="th">게시번호</th>
                    <th class="th">공지사항</th>
                    <th class="th">게시날짜</th>
                    <th class="th">작성자</th>
                    <th class="th">분류</th>
                    <%
                        String pg="";
                        pg=request.getParameter("pg");

                        int pag=Integer.parseInt(pg);
                        int pagst=pag*10;
                    
                        Connection conn = Util.getConnection();     
                        request.setCharacterEncoding("UTF-8");

                        int nuno=1;

                        try {
                            PreparedStatement ps = conn.prepareStatement("select MAX(no) from inotice;");
                            ResultSet rts = ps.executeQuery();
                    
                            if(rts.next()) { 
                                nuno = rts.getInt("MAX(no)");
                                nuno += 1;
                            } else {
                                nuno = 1;			
                            }
                        } catch(Exception e) { 
                            %><h1><%=e %></h1><% 	
                        }

                        String sql = "select * from inotice ORDER BY no DESC LIMIT "+pagst+",10;";
                        ResultSet res = null;
                        
                        try {	 
                            PreparedStatement ps = Prepare.getPrepare(conn, sql);
                            ResultSet rs = ps.executeQuery();
                        
                            while(rs.next()) {
                                %>
                                    <tr>
                                        <td><%=rs.getString("no") %></td>
                                        <td style = "text-align: left;"><a href="itnoticeas.jsp?id=<%=rs.getInt("no")%>"><%=rs.getString("index") %></a></td>
                                        <td><%=rs.getString("date") %></td>
                                        <td><%=rs.getString("user") %></td>
                                        <td><%=rs.getString("cat") %></td>
                                    </tr>         
                                <%     
                            }

                            %></table><%

                            String sqlad ="select count(*) from inotice;";

                            PreparedStatement peds = Prepare.getPrepare(conn, sqlad);
                            ResultSet reds = peds.executeQuery();

                            int pkn = 0;

                            if(reds.next()) {
                                int i = 1;
                                int pkd = pag;
                                int kz = 1;
                                pkn=reds.getInt("count(*)")/10+1;

                                if(pag > 10) {
                                pkd = pag / 10;    

                                }
                                if(pag >= 10) {
                                    if(pag % 10 == 0){
                                        i = pag / pkd * 10;
                                    } else {
                                    i = pag / pkd;
                                    i = i / 10;
                                    i = i * 10;

                                    }
                                }
                            
                                %><div class = "page-num"><%
                                while(i < (pkn + 1)) {
                                    if(kz == 1){
                                        %><a href="itnotice.jsp?pg=<%=i-1%>"><</a><%
                                    }

                                    kz=2;

                                    if(i >= 10) {
                                        %><a class = "page <%if (pag == i || (i == 9)) {%>active<%}%>" href="itnotice.jsp?pg=<%=i%>"><%=i%></a><%
                                    } else {
                                        %><a class = "page <%if ((pag + 1) == i) {%>active<%}%>" href="itnotice.jsp?pg=<%=i-1%>"><%=i%></a><%
                                    }
                                    
                                    i++;
                                    pkd++;

                                    if(i % 10 == 0) {
                                        %><a href="itnotice.jsp?pg=<%=i%>">></a><%
                                        break;
                                    }
                                }
                                %></div><%
                            }
                        } catch (Exception e) { 
                            %><h1>실패 원인: <%=e %>a</h1><%
                        }
                    %>
            </div>
        </div>
        <jsp:include page="../contact/contact.jsp"></jsp:include>
        <jsp:include page="../header/footer.jsp"></jsp:include>
    </body>
</html>