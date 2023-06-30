<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.UtilArc"%>
<%@ page import="DBPKG.Prepare"%>

<%
String id = request.getParameter("id");
Connection conn = null;



%>
<!doctype html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>더안건축</title>
	<link rel="stylesheet" type="text/css" href="../../css/thean/arc_info.css" />
</head>
<body>
	<div id = "main">
        <jsp:include page="header.jsp"></jsp:include>
		<div id = "body">
            <div class = "explain-container">
            <%
             
    try {
                        conn = UtilArc.getConnection();
    
                        PreparedStatement ps = conn.prepareStatement("select * from arc where id="+id+";");
                       
                        ResultSet rs = ps.executeQuery();
    
                        
                        if(rs.next()){
%>
  <div class = "explain">
                    <div class = "title"><%=rs.getString("cat")%> - <%=rs.getString("nm")%></div>
                    <div class = "ex-elements">
                        <div class = "ex-element">
                            <div class = "ex-title">용도</div>
                            <div class = "ex-info"><%=rs.getString("work")%></div>
                        </div>
                        <div class = "ex-element">
                            <div class = "ex-title">위치</div>
                            <div class = "ex-info"><%=rs.getString("gps")%></div>
                        </div>
                        <div class = "ex-element">
                            <div class = "ex-title">대지면적</div>
                            <div class = "ex-info"><%=rs.getString("ground")%>m²</div>
                        </div>
                        <div class = "ex-element">
                            <div class = "ex-title">연면적</div>
                            <div class = "ex-info"><%=rs.getString("grow")%>m²</div>
                        </div>
                        <div class = "ex-element">
                            <div class = "ex-title">설계</div>
                            <div class = "ex-info"><%=rs.getString("design")%></div>
                        </div>
                        <div class = "ex-element">
                            <div class = "ex-title">촬영</div>
                            <div class = "ex-info"><%=rs.getString("photo")%></div>
                        </div>
                        <div class = "ex-element">
                            <div class = "ex-title">기타</div>
                            <div class = "ex-info"><%=rs.getString("etc")%></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class = "img-element">












<%
                        }


                        ps = conn.prepareStatement("select * from arcph where id="+id+";");
                       
                        rs = ps.executeQuery();
    

                        while(rs.next()){
                            %>
                            <img src="../../upload_server/thean_resource/<%=rs.getString("ph")%>" class = "arc-img" alt="">
                            
                            
                            
                            
                            <%



                        }




    
    
    }catch(Exception e){
%><%=e%><%

    }
    
    
    
    
    
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            %>
              
          </div>
		</div>
	</div>
</body>
</html>