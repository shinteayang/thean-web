<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
    <% 
    if(session == null || session.getAttribute("name")==null){
    	response.sendRedirect("main.jsp");
    }else{
    	session.invalidate();
    	response.sendRedirect("main.jsp");
    }
    
    
    %>