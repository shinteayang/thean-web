<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    int option = Integer.parseInt(request.getParameter("option"));
    int id = Integer.parseInt(request.getParameter("id"));

    Connection conn = Util.getConnection();
    PreparedStatement pst = conn.prepareStatement("update videotime set ys = 'y' where ctnum = ? and videonum = ?");
    pst.setInt(1, id);
    pst.setInt(2, option);
    pst.executeUpdate();
%>