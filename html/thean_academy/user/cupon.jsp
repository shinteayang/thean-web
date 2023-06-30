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
        <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/notice.css">   
    </head>
    <body>
        <jsp:include page="../header/header.jsp"></jsp:include>
        <div id="body">
            <div>
                <div class="title">쿠폰함</div>
            </div>
            <div class = "table-container">
                <table id="table">
                    <th class="th">쿠폰이름</th>
                    <th class="th">쿠폰상태</th>
                    <th class="th">날짜</th>
                    <th class="th">사용여부</th>
                
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

                        String sql = "select * from cupon where user_number="+num+ " ORDER BY date DESC;";

                        Connection conn = Util.getConnection();     
                        ResultSet res = null;
                        
                        try {	 
                            PreparedStatement ps = Prepare.getPrepare(conn, sql);
                            ResultSet rs = ps.executeQuery();
							int inm=1;
                            while(rs.next()) {
                                %>
                                    <tr>
                                        <td><%=rs.getString("name_cupon")%></td>
                                        <td style = "text-align: left;"><%=rs.getString("price") %></a></td>
                                        <td><%=rs.getString("date") %></td>
                                        <td><%=rs.getString("yn") %></td>  	
                                    </tr>
                                <%   
                              
                            }
                            %>
                           
                            <%
                        } catch (Exception e) { 
                            %><h1>리다이렉션중</h1><%
                        }
                    %>
                </table>  
                <div class = "cupon-form">
                    <input type="text" id="cd" placeholder = "쿠폰 번호를 입력해주세요"/>
                    <button onclick="nt()" class = "sub-btn">등록</button>
                </div>
                <script>
               
                function nt(){
                	 var nm = document.getElementById("cd").value;
                	 var link = 'okcupon.jsp?id='+nm;
                	 if(nm==""){
                		 alert("쿠폰코드를 입력해주세요");
                	 }else{
                		
                		 location.replace(link);
                	 }
                	
                }
                
                </script>
                
            </div>
        </div>
        <div class = "kakao" OnClick="window.open('https://open.kakao.com/o/g2kr00ad')"></div>
	    <jsp:include page="../header/footer.jsp"></jsp:include>
    </body>
</html>