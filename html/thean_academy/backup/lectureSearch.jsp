<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");
    
    String option = request.getParameter("option");

    Connection conn = null;
    PreparedStatement pstmt = null;
    String sql = "select * from CATE where th_cat='" + option + "'";
    ResultSet res = null;

    try {
        conn = Util.getConnection();
        pstmt = Prepare.getPrepare(conn, sql);

        res = pstmt.executeQuery();

        while (res.next()) {
            %>
                <a class="link" href="lecture_info.jsp?id=<%=res.getInt("categorynum")%>">
                    <div class="video-content">
                        <div class = "difficulty"></div>
                        <div>
                            <div class="title"><%=res.getString("categoryname") %></div>
                            <div class="designer-info">
                                <div class="designer">
                                    <%=res.getString("te_name")%>
                                </div>
                            </div>
                        </div>
                        <div class = "difficulty-price">
                            <div class = "difficulty-info">
                                <%
                                    for (int j = 1 ; j <= res.getInt("diffculty") ; j++) {
                                        %>★<%
                                    }
                                %>
                            </div>
                            <div class="price-info">
                                <div class="price">₩<%=res.getString("price")%> / <%=res.getString("day")%>일</div>
                            </div>
                        </div>
                    </div>
                    <div class="thumb" style="background-image: url('../../uploadimg/<%=res.getString("img") %>');"></div>
                </a>
            <%
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            res.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>