<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%@ page import="java.sql.*"%>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    int ct = Integer.parseInt(request.getParameter("ct"));
    String title = request.getParameter("title");

    Connection conn = Util.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT mv_link FROM MV WHERE mv_number=" + id);
    ResultSet rs = ps.executeQuery();

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

    PreparedStatement ps2 = conn.prepareStatement("DELETE FROM MV WHERE mv_number =" + id);
    ps2.executeUpdate();
    
    response.sendRedirect("a_video_list.jsp?id=" + id + "&title=" + title + "&ct=" + ct);
%>
