<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%@ page import="java.sql.*"%>

<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));

    Connection conn = Util.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT categorynum, mv_link FROM MV WHERE mid_title=" + id);
    ResultSet rs = ps.executeQuery();
    int cate = 0;

    while (rs.next()) {
        String fileName = rs.getString("mv_link");
        String fileDir = "/source/upload_server/category/video";
        String filePath = request.getRealPath(fileDir) + "/"; 
        
        String file = filePath + fileName;
        File f = new File(file);
        if(f.exists()) {
            f.delete();
        }
    }

    PreparedStatement ps3 = conn.prepareStatement("SELECT ctnum FROM mid_title WHERE id=" + id);
    ResultSet rs3 = ps3.executeQuery();
    if (rs3.next()) {
        cate = rs3.getInt("ctnum");
    }

    PreparedStatement ps2 = conn.prepareStatement("DELETE FROM mid_title WHERE id =" + id);
    ps2.executeUpdate();
    
    response.sendRedirect("a_video_index.jsp?id=" + cate);
%>
