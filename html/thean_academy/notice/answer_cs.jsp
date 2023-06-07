<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    int pb = Integer.parseInt(request.getParameter("pb"));
    String pw = request.getParameter("pw");

    String sqla = "";
    String sql = "select * from cs where no="+id+";";
    int op_a=0;
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/itnoticeas.css" />
    </head>
    <body>
        <jsp:include page="../header/header.jsp"></jsp:include>
        <div class = "main">
            <div class = "content">
                <%      

                if(session.getAttribute("name") == null) {
                    op_a=999999;
                 } else {
                    Object op2 = session.getAttribute("number");
                    op_a = Integer.parseInt(op2.toString());
                         }  


                    try {
                        Connection conn = Util.getConnection(); 
                        PreparedStatement ps = Prepare.getPrepare(conn, sql);
                        ResultSet rs = ps.executeQuery();
                    
                        if(rs.next()) {

                            if(rs.getString("user_no").equals("0")){
                                if(pb==1){
                                    %>  
                                <div class = "title"><%=rs.getString("idx") %></div>
                                <div class = "info-wrap">
                                    <div class = "info">
                                        <div class = "b">작성자</div>
                                        <div><%=rs.getString("us_name")%></div>
                                    </div>
                                    <div class = "info">
                                        <div class = "b">작성날짜</div>
                                        <div><%=rs.getString("date") %></div>
                                        <div class = "b"><a href="answer_cs.jsp?pb=2&id=<%=id%>&pw=0">수정하기</a></div>
                                    </div>
                                </div>
                                <div class="te"><%=rs.getString("text") %></div>
                            <%   
                            sqla = "select * from cs where no="+id+" and checkaa='답변완료';";
                        PreparedStatement pes = Prepare.getPrepare(conn, sqla);
                        ResultSet res = pes.executeQuery();
                    
                        if(res.next()) {
                            %>   
                                <div class = "title">Re:<%=rs.getString("idx") %></div>
                                <div class = "info-wrap">
                                    <div class = "info">
                                        <div class = "b">답변강사</div>
                                        <div><%=rs.getString("answerte")%></div>
                                    </div>
                                    <div class = "info">
                                        <div class = "b">답변날짜</div>
                                        <div><%=rs.getString("datean") %></div>
                                    </div>
                                </div>
                                <div class="te"><%=rs.getString("answer") %></div>
                            <%     
                        }  
                                }else{
                                    if(rs.getString("pw").equals(pw)){
                                        if(pb==2){
                                             %>  
                                <div class = "title"><%=rs.getString("idx") %></div>
                                <div class = "info-wrap">
                                    <div class = "info">
                                        <div class = "b">작성자</div>
                                        <div><%=rs.getString("us_name")%></div>
                                        
                                    </div>
                                    <div class = "info">
                                        <div class = "b">작성날짜</div>
                                        <div><%=rs.getString("date") %></div>
                                     
                                        <div class = "b"><a href="update.jsp?id=<%=id%>">수정하기</a></div>
                                    </div>
                                </div>
                                <div class="te"><%=rs.getString("text") %></div>
                            <%   
                            sqla = "select * from cs where no="+id+" and checkaa='답변완료';";
                        PreparedStatement pes = Prepare.getPrepare(conn, sqla);
                        ResultSet res = pes.executeQuery();
                    
                        if(res.next()) {
                            %>   
                                <div class = "title">Re:<%=rs.getString("idx") %></div>
                                <div class = "info-wrap">
                                    <div class = "info">
                                        <div class = "b">답변강사</div>
                                        <div><%=rs.getString("answerte")%></div>
                                    </div>
                                    <div class = "info">
                                        <div class = "b">답변날짜</div>
                                        <div><%=rs.getString("datean") %></div>
                                    </div>
                                </div>
                                <div class="te"><%=rs.getString("answer") %></div>
                            <%     
                        }  
                                        }else if(pb==3){
                                            %>
                                            <h1>수정하기</h1>
                                            <%

                                        }
                                        
                                    }else{
                                        if(pw.equals("0")){
 %>
                                        <form id = "pw-form" action="answer_cs.jsp">
                                            <div style = "text-align: center;">
                                                <input type="password" name="pw" placeholder = "비밀번호 입력">
                                        <input type="text" name="pb" value="<%=pb%>" hidden>
                                        <input type="text" name="id" value="<%=id%>" hidden>
                                        <button type="submit">확인</button>
                                            </div>
                                        </form>
                                        
                                        
                                        
                                        
                                        <%
                                        }else{
 %>
                                        <form id = "pw-form" action="answer_cs.jsp">
                                            <div style = "text-align: center;">
                                                <input type="password" name="pw" placeholder = "비밀번호 입력">
                                        <input type="text" name="pb" value="<%=pb%>" hidden>
                                        <input type="text" name="id" value="<%=id%>" hidden>
                                        
                                        <button type="submit">확인</button>
                                        <p style="color:red;">비밀번호가 일치하지 않습니다</p>
                                            </div>
                                        </form>
                                        
                                        
                                        
                                        
                                        <%

                                        }
                                       
                                    }

                                }

                            }else{
                                 if(pb==1){
                                    %>  
                                <div class = "title"><%=rs.getString("idx") %></div>
                                <div class = "info-wrap">
                                    <div class = "info">
                                        <div class = "b">작성자</div>
                                        <div><%=rs.getString("us_name")%></div>
                                    </div>
                                    <div class = "info">
                                        <div class = "b">작성날짜</div>
                                        <div><%=rs.getString("date") %></div>
                                    </div>
                                    <%
                                    if(rs.getInt("user_no")==op_a){
                                        %>
                                         <div class = "b"><a href="update.jsp?id=<%=id%>">수정하기</a></div>
                                        <%
                                    }else{
                                        %>
                                        
                                        <%

                                    }
                                    
                                    
                                    
                                    %>
                                     
                                </div>
                                <div class="te"><%=rs.getString("text") %></div>
                            <%   

                            sqla = "select * from cs where no="+id+" and checkaa='답변완료';";
                        PreparedStatement pes = Prepare.getPrepare(conn, sqla);
                        ResultSet res = pes.executeQuery();
                    
                        if(res.next()) {
                            %>   
                                <div class = "title">Re:<%=rs.getString("idx") %></div>
                                <div class = "info-wrap">
                                    <div class = "info">
                                        <div class = "b">답변강사</div>
                                        <div><%=rs.getString("answerte")%></div>
                                    </div>
                                    <div class = "info">
                                        <div class = "b">답변날짜</div>
                                        <div><%=rs.getString("datean") %></div>
                                    </div>
                                </div>
                                <div class="te"><%=rs.getString("answer") %></div>
                            <%     
                        }  
                                }else{
                                 if (session == null || session.getAttribute("name") == null) { 
                                    %>
                                    <script>
                                    alert("접근권한이 없습니다");
                                    history.go(-1);
                                    
                                    </script>
                                    <%


                                 }else{
                                    Object j =session.getAttribute("number");
                                    int usno = Integer.parseInt(j.toString());
                                    if(rs.getInt("user_no")==usno){
 %>  
                                <div class = "title"><%=rs.getString("idx") %></div>
                                <div class = "info-wrap">
                                    <div class = "info">
                                        <div class = "b">작성자</div>
                                        <div><%=rs.getString("us_name")%></div>
                                        
                                    </div>
                                    <div class = "info">
                                        <div class = "b">작성날짜</div>
                                        <div><%=rs.getString("date") %></div>
                                     
                                         <div class = "b"><a href="update.jsp?id=<%=id%>">수정하기</a></div>
                                    </div>
                                </div>
                                <div class="te"><%=rs.getString("text") %></div>
                            <%
                    sqla = "select * from cs where no="+id+" and checkaa='답변완료';";
                        PreparedStatement pes = Prepare.getPrepare(conn, sqla);
                        ResultSet res = pes.executeQuery();
                    
                        if(res.next()) {
                            %>   
                                <div class = "title">Re:<%=rs.getString("idx") %></div>
                                <div class = "info-wrap">
                                    <div class = "info">
                                        <div class = "b">답변강사</div>
                                        <div><%=rs.getString("answerte")%></div>
                                    </div>
                                    <div class = "info">
                                        <div class = "b">답변날짜</div>
                                        <div><%=rs.getString("datean") %></div>
                                    </div>
                                </div>
                                <div class="te"><%=rs.getString("answer") %></div>
                            <%     
                        }  

                                    }else{
                                        %>
                                     <script>
                                    alert("접근권한이 없습니다");
                                    history.go(-1);
                                    
                                    </script>
                                    <%
                                    }



                                 }




                                }
                                    


                            }
                            
                        } 
                        
                       
                    } catch (Exception e) { 
                        %><h1>실패 원인: <%=e %><%
                    }
                %>
                <a class = "back-btn" href="notice.jsp?pg=0&se=all">뒤로가기</a>  
            </div>
        </div>
        
        <div class = "kakao" OnClick="window.open('https://open.kakao.com/o/g2kr00ad')"></div>
	    
    </body>
</html>