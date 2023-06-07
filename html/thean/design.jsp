<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.UtilArc"%>
<%@ page import="DBPKG.Prepare"%>
    
<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>about</title>
        <link rel="stylesheet" type="text/css" href="../../css/thean/design.css" />
    </head>
    <body>
        <div id = "main">
            <jsp:include page="header.jsp"></jsp:include>
            <div id = "body">
                <div class = "title">설계</div>
                <div class = "design-container">
                    <div class = "info-container">
                        <div class = "info-title">더안건축은 설계를 합니다</div>
                        <div class = "info">
                            시공가능한 설계로 풀어드립니다<br>
                            설계가 필수인 대형/관공서 현장, 현장관리로 스트레스 받는 소규모 인테리어현장 등<br>
                            빠르고 정확하게, 공사가능한 디테일을 짚어서 풀어드립니다.<br>
                            <br>
                            필요하다면 디자인까지,<br>
                            필요하다면 브랜딩까지,<br>
                            필요하다면 모델링까지.
                        </div>
                    </div>
                    <div class = "circles">
                        <div class = "circle">건축<br>설계</div>
                        <div class = "circle">인테리어<br>설계</div>
                        <div class = "circle">공사<br>도서</div>
                        <div class = "circle">디자인</div>
                        <div class = "circle">브랜딩</div>
                        <div class = "circle">현장<br>감리</div>
                    </div>
                </div>
                <div class = "line"></div>
                <div class = "photo-container">
                    <%
                    Connection conn = null;
    
    try {
                        conn = UtilArc.getConnection();
    
                        PreparedStatement ps = conn.prepareStatement("select * from arc where cat='설계'");
                       
                        ResultSet rs = ps.executeQuery();
    
                        while(rs.next()){
                            %>
                      <div class = "photos">
                            <a href = "arc_info.jsp?id=<%=rs.getString("id")%>" class = "thumb-info">
                                <div class = "thumb-title"><%=rs.getString("nm")%></div>
                                <div class = "thumb-year"><%=rs.getString("year")%></div>
                            </a>
                            <div class = "thumb" style = "background-image: url('../../upload_server/thean_resource/<%=rs.getString("phm")%>');"></div>
                        </div>      
                            
                            
                            
                            <%


                        }
                        }catch(Exception e){

                        }



                        %>
                    
                </div>
            </div>
        </div>
    </body>
</html>