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
                <div class = "title">
                준공
                <div class = "w">※ 해당페이지에는 타 시공사의 준공사진도 포함될 수 있으며, 게시물 내부 설명에 타 시공사의 상호를 기재하였음.</div>
                </div>
                <div class = "design-container">
                    <div class = "info-container">
                        <div class = "info-title">더안건축은 공사를 합니다</div>
                        <div class = "info">
                            더안건축을 디자인을 하지만, 그디자인을 반영한 공사를 합니다.<br>
                            대부분의 시공사들은 디자인의 의도와 구현을 하지못하지만,<br>
                            더안건축은 디자인 의도표현을 목적으로 설립된 시공사기에, 디자인 자체를 이해하고 공사합니다.<br>
                            <br>
                            싸고 하자없고 고급 디자인이 나오는것은 말도안됩니다.<br>
                            다만, 그 안에서 최대한의 합리적 해결을 하고, 그것을 건축주(소비자)가 결정 할 수 있도록
                            설명하는것이 우리의 몫입니다. 
                        </div>
                    </div>
                    <div class = "circles">
                        <div class = "circle">주택<br>공사</div>
                        <div class = "circle">상가<br>공사</div>
                        <div class = "circle">인테리어<br>공사</div>
                        <div class = "circle">관공서<br>공사</div>
                        <div class = "circle">오브제<br>공사</div>
                        <div class = "circle">해외<br>공사</div>
                    </div>
                </div>
                <div class = "line"></div>
                <div class = "photo-container">
                   <%
                   Connection conn = null;
    
    try {
                        conn = UtilArc.getConnection();
    
                        PreparedStatement ps = conn.prepareStatement("select * from arc where cat='준공'");
                       
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
        </div>
    </body>
</html>