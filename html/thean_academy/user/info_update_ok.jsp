<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%@ page import="DBPKG.Key"%>
<%
    String key = Key.getKey();
    request.setCharacterEncoding("UTF-8");
    
    String email = request.getParameter("email");
    String address = request.getParameter("address1");
    String num = request.getParameter("num");

    String sql = "UPDATE USER SET user_mail = '" + email + "', user_adress = hex(AES_ENCRYPT('" + address + "','" + key + "')) WHERE user_number = " + num;

    Connection conn = Util.getConnection();
    PreparedStatement ps = Prepare.getPrepare(conn, sql);

    ps.executeUpdate();

    %>
        <script>
            alert('정보 변경이 완료되었습니다.');
        </script>
    <%

    response.sendRedirect("../index/main.jsp");
%>