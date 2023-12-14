<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%@ page import="java.sql.*"%>

<%
    request.setCharacterEncoding("UTF-8");

    String[] fileList = new String[4];

    int id = Integer.parseInt(request.getParameter("id"));

    Connection conn = Util.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT img, cover, free, file FROM CATE WHERE categorynum=" + id);

    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
        fileList[0] = rs.getString("img");
        fileList[1] = rs.getString("cover");
        fileList[2] = rs.getString("free");
        fileList[3] = rs.getString("file");
    }

    String fileDir = "/source/upload_server";
    String filePath = request.getRealPath(fileDir) + "/"; 
    
    for(String fn : fileList) {
        String file = filePath + fn;
        File f = new File(file);
        if(f.exists()) {
            f.delete();
        }
    }

    PreparedStatement ps2 = conn.prepareStatement("DELETE FROM CATE WHERE categorynum=" + id);
    PreparedStatement ps3 = conn.prepareStatement("DELETE FROM MV WHERE categorynum=" + id);
    PreparedStatement ps4 = conn.prepareStatement("DELETE FROM videotime WHERE ctnum=" + id);
    PreparedStatement ps5 = conn.prepareStatement("DELETE FROM mid_title WHERE ctnum=" + id);

    ps2.executeUpdate();
    ps3.executeUpdate();
    ps4.executeUpdate();
    ps5.executeUpdate();
    
    response.sendRedirect("a_lecture.jsp");
%>
