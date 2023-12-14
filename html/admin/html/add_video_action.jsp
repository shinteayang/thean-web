<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%@ page import="java.sql.*"%>
<%
    request.setCharacterEncoding("UTF-8");

    String uploadPath = "/var/lib/tomcat9/webapps/ROOT/source/upload_server/category/video/"; // 업로드할 폴더 경로
    List<String> uploadedFileNames = new ArrayList<>();

    MultipartRequest multipartRequest = new MultipartRequest(
        request, // HttpServletRequest
        uploadPath, // 업로드 폴더 경로
        1024 * 1024 * 1024, // 최대 업로드 파일 크기 (10MB)
        "UTF-8", // 문자 인코딩
        new com.oreilly.servlet.multipart.DefaultFileRenamePolicy() // 파일명 중복 시 리네임 정책
    );

    Enumeration files = multipartRequest.getFileNames();

    while (files.hasMoreElements()) {
        String inputName = (String) files.nextElement();
        String fileName = multipartRequest.getFilesystemName(inputName);
        uploadedFileNames.add(fileName);
        
        out.println("File uploaded: " + fileName + "<br>");
    }

    String[] uploadedFileNamesArray = uploadedFileNames.toArray(new String[0]);

    int id = Integer.parseInt(multipartRequest.getParameter("id"));
    int ct = Integer.parseInt(multipartRequest.getParameter("ct"));
    String title = multipartRequest.getParameter("title");

    Connection conn = null;
    conn = Util.getConnection();

    String sql = "SELECT MAX(mv_tol) as mv_max FROM MV WHERE categorynum=" + ct;
    String sql2 = "SELECT categoryname, day FROM CATE WHERE categorynum=" + ct;
    String sql3 = "INSERT INTO MV (mv_tol, categorynum, categoryname, mv_link, mv_day, mv_name, mid_title) VALUES (?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement ps = conn.prepareStatement(sql);
    PreparedStatement ps2 = conn.prepareStatement(sql2);
    PreparedStatement ps3 = conn.prepareStatement(sql3);

    String categoryname = null;
    int day = 0;

    ResultSet rs = ps.executeQuery();
    if(rs.next()) {
        ps3.setInt(1, rs.getInt("mv_max") + 1);
    } else {
        ps3.setInt(1, 1);
    }

    ResultSet rs2 = ps2.executeQuery();
    if (rs2.next()) {
        categoryname = rs2.getString("categoryname");
        day = rs2.getInt("day");
    }

    ps3.setInt(2, ct);
    ps3.setString(3, categoryname);
    ps3.setString(4, uploadedFileNamesArray[0]);
    ps3.setInt(5, day);
    ps3.setString(6, title);
    ps3.setInt(7, id);

    ps3.executeUpdate();

    response.sendRedirect("add_video.jsp?id=" + id + "&ct=" + ct);
%>