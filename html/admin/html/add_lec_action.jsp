<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="DBPKG.UtilArc"%>
<%@ page import="DBPKG.Prepare"%>
<%@ page import="java.sql.*"%>

<%
    request.setCharacterEncoding("UTF-8");
    String uploadPath = "/var/lib/tomcat9/webapps/ROOT/source/upload_server/thean_resource/arcph"; // 업로드할 폴더 경로
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

    Collections.reverse(uploadedFileNames);

    String title = multipartRequest.getParameter("title");
    String category = multipartRequest.getParameter("category");
    String teacher = multipartRequest.getParameter("loc");
    int rev = Integer.parseInt(multipartRequest.getParameter("rev"));
    String intro = multipartRequest.getParameter("intro");
    int difficulty = multipartRequest.getParameter("difficulty");
    String rec = multipartRequest.getParameter("rec");
    String etc = multipartRequest.getParameter("etc");
    String cate = multipartRequest.getParameter("cate");
    String year = multipartRequest.getParameter("year");
    int max_id = 0;

    Connection conn = UtilArc.getConnection();
    PreparedStatement ps = conn.prepareStatement("insert into CATE (categoryname, day, price, te_name, ct_info, th_cat, img, niz, te_no, cover, free, file, diffcult, diffculty) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
    PreparedStatement ps1 = conn.prepareStatement("select max(categorynum) as cnum from CATE");
    PreparedStatement ps2 = conn.prepareStatement("insert into arcph (id, num, ph) values (?, ?, ?)");

    String[] uploadedFileNamesArray = uploadedFileNames.toArray(new String[0]);

    ps.setString(1, name);
    ps.setString(2, usage);
    ps.setString(3, loc);
    ps.setString(4, land);
    ps.setString(5, total);
    ps.setString(6, des);
    ps.setString(7, rec);
    ps.setString(8, etc);
    ps.setString(9, uploadedFileNamesArray[0]);
    ps.setString(10, cate);
    ps.setString(11, year);

    ps.executeUpdate();

    ResultSet rs = ps1.executeQuery();

    if(rs.next()) {max_id = rs.getInt("max_id");}

    for (String fn : uploadedFileNamesArray) {
        ps2.setInt(1, max_id);
        ps2.setInt(2, 6);
        ps2.setString(3, fn);

        ps2.executeUpdate();
    }
    
    response.sendRedirect("add_lecture.jsp");
%>
