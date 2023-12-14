<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%@ page import="java.sql.*"%>

<%
    request.setCharacterEncoding("UTF-8");
    String uploadPath = "/var/lib/tomcat9/webapps/ROOT/source/upload_server/category/video"; // 업로드할 폴더 경로
    List<String> uploadedFileNames = new ArrayList<>();
    Connection conn = Util.getConnection();

    String fileDir = "/source/upload_server/category/video";
    String filePath = request.getRealPath(fileDir) + "/"; 
    int number = request.getParameter("number");

    PreparedStatement ps = conn.prepareStatement("SELECT mv_link FROM MV WHERE mv_number=" + number);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        String file = filePath + rs.getString("mv_link");
        File f = new File(file);
        if(f.exists()) {
            f.delete();
        }
    }

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
    
    String title = multipartRequest.getParameter("link");
    int id = Integer.parseInt(multipartRequest.getParameter("id"));

    String sql2 = null;
    if (uploadedFileNamesArray[0] == null) {
        sql2 = "UPDATE MV SET mv_name = '" + title + "' WHERE mv_number = " + id;
    } else {
        sq2 = "UPDATE MV SET mv_name = '" + title + "', mv_link = '" + uploadedFileNamesArray[0] + "' WHERE mv_number = " + id;
    }
    PreparedStatement ps2 = conn.prepareStatement(sql2);

    ps2.executeUpdate();
    
    response.sendRedirect("a_lecture.jsp");
%>
