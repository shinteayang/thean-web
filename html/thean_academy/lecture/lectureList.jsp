<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    int option = Integer.parseInt(request.getParameter("option"));
    int id = Integer.parseInt(request.getParameter("id"));
    int index = Integer.parseInt(request.getParameter("index")) + 1;

    Connection conn = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmtct = null;
    ResultSet rs = null;
    ResultSet rsct = null;

    int time = 0;
    String ys = null;

    try {
        conn = Util.getConnection();
        pstmt = conn.prepareStatement("select * from MV where categorynum="+id+" and mv_tol="+option+";");
        pstmtct = conn.prepareStatement("select * from videotime where ctnum = " + id + " and videonum = " + option + "");

        rs = pstmt.executeQuery();
        rsct = pstmtct.executeQuery();

        if (rsct.next()) {
            time = rsct.getInt("time");
            ys = rsct.getString("ys");
        }

        while (rs.next()) {
            String link = rs.getString("mv_link");
            String mid_title = rs.getString("mid_title");
            String mvlk = mid_title+"/"+link;
            %>
                <div class="video-title"><%=rs.getString("mv_name") %></div>
                <div class="video-frame">
                    <video class = "lecture-video<%if (ys == "n") {%> video-disabled<%}%>" id = "video-<%=index%>" controls controlsList="nodownload" oncontextmenu='return false'>
                        <source src="../../../upload_server/category/video/cad/<%=mvlk %>" type="video/mp4">
                    </video>
                </div>
                <div class="btn-container">
                    <button class="question">강의 질문하기</button>
                </div>
                <script>
                    document.getElementById("video-<%=index%>").currentTime = <%=time%>;
                </script>
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