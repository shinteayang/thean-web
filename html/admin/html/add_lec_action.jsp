<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%@ page import="java.sql.*"%>

<%
    request.setCharacterEncoding("UTF-8");
    String uploadPath = "/var/lib/tomcat9/webapps/ROOT/source/upload_server/"; // 업로드할 폴더 경로
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
    int day = Integer.parseInt(multipartRequest.getParameter("day"));
    int price = Integer.parseInt(multipartRequest.getParameter("price"));
    String category = multipartRequest.getParameter("category");
    String teacher = multipartRequest.getParameter("teacher");
    String intro = multipartRequest.getParameter("intro");
    int difficulty = Integer.parseInt(multipartRequest.getParameter("difficulty"));
    String recom = multipartRequest.getParameter("recom");

    Connection conn = Util.getConnection();
    PreparedStatement ps = conn.prepareStatement("insert into CATE (categoryname, day, price, te_name, ct_info, th_cat, img, niz, te_no, cover, free, file, diffculty) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

    String[] uploadedFileNamesArray = uploadedFileNames.toArray(new String[0]);

    ps.setString(1, title);
    ps.setInt(2, day);
    ps.setInt(3, price);
    ps.setString(4, teacher);
    ps.setString(5, intro);
    ps.setString(6, category);
    ps.setString(7, uploadedFileNamesArray[0]);
    ps.setString(8, recom);
    ps.setInt(9, 22);
    ps.setString(10, uploadedFileNamesArray[2]);
    ps.setString(11, uploadedFileNamesArray[3]);
    ps.setString(12, uploadedFileNamesArray[4]);
    ps.setInt(13, difficulty);

    ps.executeUpdate();
    
    response.sendRedirect("a_lecture.jsp");
%>
