<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
    <% 
    if(session == null || session.getAttribute("name")==null){
    	response.sendRedirect("../index/main.jsp");
    }else{
    	session.invalidate();
    	response.sendRedirect("../index/main.jsp");
    }
    
    
    %>