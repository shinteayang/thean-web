<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="DBPKG.Prepare"%>
<%
    if(session != null && session.getAttribute("name") != null) {
        Object name = session.getAttribute("name");
        int op = (int)session.getAttribute("number");
        int opa = (int)session.getAttribute("op");
 		String point = null;

        String sql = "select *, format(point, 0) as pointc from USER where user_number="+op+ ";";

        Connection conn = Util.getConnection();     
        ResultSet res = null;
        
        try {	 
            PreparedStatement ps = Prepare.getPrepare(conn, sql);
            ResultSet rs = ps.executeQuery();
            int inm=1;

            if(rs.next()) {
                point=rs.getString("pointc");
            }
        } catch(Exception e) { 
            %><%=e%><%
        }     
        %>
            <div id = "sidebar">
                <div class = "profile-container">
                    <div class = "profile">
                        <div class = "profile-name"><%=name%>   <h style = "font-size: 0.8em;">님</h></div>
                        <div class = "profile-info">
                            <div class = "profile-point">
                                <div>적립금</div>
                                <div><%=point%>원</div>
                            </div>
                            <div> 
                                <%if(opa >= 5) { %><a href="../../admin/html/index.jsp">관리자페이지</a><% }%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class ="mymenu-container">
                    <div class = "mymenu">
                        <div class = "menues"><a href = "../user/infoUpdate.jsp">정보변경</a></div>
                        <div class = "menues"><a href="../user/cupon.jsp">쿠폰함</a></div>
                        <div class = "menues"><a href="../lecture/mylecture.jsp">나의 강의실</a></div>
                        <div class = "menues"><a href="../notice/notice.jsp?pg=0&se=all">문의하기</a> </div>
                    </div>
                </div>
            </div>
        <%
    } else {
        %><%
    }
%>