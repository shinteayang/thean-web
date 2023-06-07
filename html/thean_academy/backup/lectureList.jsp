<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    int option = Integer.parseInt(request.getParameter("option"));
    int id = Integer.parseInt(request.getParameter("id"));

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        conn = Util.getConnection();
        pstmt = conn.prepareStatement("select * from MV where categorynum="+id+" and mv_tol="+option+";");

        rs = pstmt.executeQuery();

        while (rs.next()) {
            String link = rs.getString("mv_link");
            String mid_title = rs.getString("mid_title");
            String mvlk = mid_title+"/"+link;
            %>
                <div class="video-time">28분 51초</div>
                <div class="video-title"><%=rs.getString("mv_name") %></div>
                <div class="video-frame">
                    <iframe src="../../upload_server/category/video/cad/<%=mvlk %>"
                        frameborder="0" width="100%" height="100%"></iframe>
                </div>
                <div class="btn-container">
                    <button class="question">강의 질문하기</button>
                </div>
            <%
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
        rs.close();
        pstmt.close();
        conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>