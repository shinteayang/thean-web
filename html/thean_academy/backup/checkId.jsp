<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>

<% 
    String variablePath = "/opt/tomcat/webapps/ROOT/WEB-INF/keys/key.sh";
    String variableName = "KEY";
    String variableValue = "";

    BufferedReader br = new BufferedReader(new FileReader(variablePath));
    String line = "";

    while ((line = br.readLine()) != null) {
        if (line.startsWith(variableName)) {
        variableValue = line.substring(line.indexOf("=") + 1);
        }
    }

	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String result = null;
	String sql = "SELECT * FROM USER WHERE AES_DECRYPT(UNHEX(user_id), ?) = ?";
	
	try {	
		conn = Util.getConnection();
		
		pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, variableValue);
		pstmt.setString(2, id);
		
		rs = pstmt.executeQuery();
		
		if (rs.next()) { result = "exist"; }	
	} 
	catch (Exception e) { e.printStackTrace(); }
	
	out.clear();
	out.print(result);
%>