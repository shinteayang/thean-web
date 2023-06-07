<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    int option = Integer.parseInt(request.getParameter("option"));
    int id = Integer.parseInt(request.getParameter("id"));
    int time = Integer.parseInt(request.getParameter("time"));

    Connection conn = Util.getConnection();
    PreparedStatement pst = conn.prepareStatement("update videotime set time = ? where ctnum = ? and videonum = ?");
    pst.setInt(1, time);
    pst.setInt(2, id);
    pst.setInt(3, option);
    pst.executeUpdate();
%>