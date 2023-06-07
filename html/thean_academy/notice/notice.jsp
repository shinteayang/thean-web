<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    String name = "";
    String num=  "";
    int k=0;
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/notice.css">   
    </head>
    <body>
        <jsp:include page="../header/header.jsp"></jsp:include>
        <div id="body">
            <div>
                <div class="title">문의하기</div>
            </div>
            <div class = "table-container">
                <table id="table">
                    <th class="th">문의번호</th>
                    <th class="th">문의제목</th>
                    <th class="th">문의날짜</th>
                    <th class="th">처리상태</th>
                
                    <%   
                    String pg="";
                    String se="";
                     pg=request.getParameter("pg");
                     se=request.getParameter("se");
                     int pag=Integer.parseInt(pg);
                     int pagst=pag*10;
                        if(session == null || session.getAttribute("name")==null) {
                            
                               k=0;
                             
                        } else {
                            
                        Object namea = session.getAttribute("name");
                        Object numa = session.getAttribute("number");
                        
                        name = namea.toString();
                        num = numa.toString();
                            
                        }

                        request.setCharacterEncoding("UTF-8");

                        String sql = "select * from cs ORDER BY no DESC LIMIT "+pagst+",10;";
                       

                        Connection conn = Util.getConnection();     
                        ResultSet res = null;
                        
                        try {	 

                   

                            PreparedStatement ps = Prepare.getPrepare(conn, sql);
                            ResultSet rs = ps.executeQuery();
							int inm=1+(1*pagst);
                           
                            while(rs.next()) {
                                %>
                                    <tr>
                                        <td><%=inm%></td>
                                        <%if(rs.getString("pb").equals("on")){
                                            %><td>
                                            <a href="answer_cs.jsp?id=<%=rs.getString("no")%>&pw=0&pb=2">
                                            <%=rs.getString("idx")%>
                                            </a>
                                            <img src="../../../img/slide/pb.png" alt="" style="width:20px;height:3%;">
                                            </td><%

                                        }else{
                                            %><td>
                                            <a href="answer_cs.jsp?id=<%=rs.getString("no")%>&pw=0&pb=1">
                                            <%=rs.getString("idx")%>
                                            </a>
                                           
                                            </td><%
                                        }%>
                                    
                                        <td><%=rs.getString("date")%></td>
                                        <td><%
                                            if (rs.getString("checkaa").equals("답변완료")) {
                                                %>
                                                    <div style = "color: #72D353;"><%=rs.getString("checkaa")%></div>
                                                <%
                                            } else {
                                                %><div><%=rs.getString("checkaa")%></div><%
                                            }
                                        %></td>  	
                                    </tr>
                                    
                                <%   
                                inm++;
                            }
                            %>
                             </table>
                            <%

                            String sqlad ="select count(*) from cs;";

                            PreparedStatement peds = Prepare.getPrepare(conn, sqlad);
                            ResultSet reds = peds.executeQuery();
                            int pkn=0;
                            if(reds.next()){
                                int i=1;
                                int pkd=pag;
                                  int kz=1;
                                pkn=reds.getInt("count(*)")/10+1;
                                if(pag>10){
                                   pkd=pag/10;    

                                }
                                if(pag>=10){
                                    if(pag%10==0){
                                        i=pag/pkd*10;
                                    }else{
                                    i=pag/pkd;
                                    i=i/10;
                                    i=i*10;

                                    }
                                    
                                    
                                    
                                  
                                }
                              

                                %><div class = "page-num"><%
                                while(i<(pkn+1)){
                                    if(kz==1){
                                         %>
                                    <a href="notice.jsp?pg=<%=i-1%>&se=all"><</a>
                                    <%
                                    }
                                    kz=2;


                                    if(i>=10){
                                %>
                                   
                                    <a class = "page <%if (pag == i || (i == 9)) {%>active<%}%>" href="notice.jsp?pg=<%=i%>&se=all"><%=i%></a>
                                    <%
                                    }else{
                                %>
                                   
                                    <a class = "page <%if ((pag + 1) == i) {%>active<%}%>" href="notice.jsp?pg=<%=i-1%>&se=all"><%=i%></a>
                                    <%
                                    }
                                    
                                    i++;
                                    pkd++;
                                    if(i%10==0){
                                        %>
                                       
                                    <a href="notice.jsp?pg=<%=i%>&se=all">></a>
                                    <%
                                        break;
                                    }


                                }
                                %></div><%
                            }
                        } catch (Exception e) { 
                       
                        }
                    %>
               
                
            </div>
            <a class = "go-btn" href="gonotice.jsp?id=<%=k%>">문의작성</a>
        </div>
        <jsp:include page="../contact/contact.jsp"></jsp:include>
         <jsp:include page="../header/footer.jsp"></jsp:include>
    </body>
</html>