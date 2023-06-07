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
                <div class = "title">실측</div>
                <div class = "design-container">
                    <div class = "info-container">
                        <div class = "info-title">더안건축은 실측을 합니다</div>
                        <div class = "info">
                            다양한 이유로 건축물을 실측해야 하는 경우가 많습니다.<br>
                            기계로 스캔을 하면 될것을, 외 굳이 일일이 재야만하는지 이해가 안되시죠?<br>
                            <br>
                            벽은 수평도 안맞고, 수직도 안맞고, 경우에 따라 다양한 형태로 존재합니다.<br>
                            그 미세함이 단 몇 mm 차이겠으나,  실측하면 그것들이 그대로 반영이됩니다.<br>
                            실측한 후 그 도면을 이용하는 목적은 다양한데,  대부분 공사 또는 인허가용입니다.<br>
                            그러한 도면을 그대로 쓸 수 없기때문에, 그래서 직접 재어야만 합니다.
                        </div>
                    </div>
                    <div class = "circles">
                        <div class = "circle">건물<br>실측</div>
                        <div class = "circle">인테리어<br>실측</div>
                        <div class = "circle">구조부<br>실측</div>
                        <div class = "circle">건축법 위반<br>관련실측</div>
                        <div class = "circle">오브제<br>실측</div>
                        <div class = "circle">현장<br>실측</div>
                    </div>
                </div>
                <div class = "line"></div>
                <div class = "photo-container">
                <%
                   Connection conn = null;
    
    try {
                        conn = UtilArc.getConnection();
    
                        PreparedStatement ps = conn.prepareStatement("select * from arc where cat='실측'");
                       
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