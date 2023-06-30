<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="DBPKG.Prepare"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<%

request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id");


Connection conn = null;
conn = Util.getConnection();
String category="";
int price=0;
String yn="";
String name_cp="";
int num=0;
String name="";
Date now = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd:hh:mm:ss");
String today = sf.format(now);	

if(session == null || session.getAttribute("name")==null) {
    %>
<script>
	alert("잘못된 접근 경로입니다!!");
	var link = 'https://www.thean-ac.com:8081/source/html/thean_academy/index/main.jsp';
</script>
<%
} else {
	name=session.getAttribute("name").toString();
	num= Integer.parseInt(session.getAttribute("number").toString());
    
    try{  
        PreparedStatement ps = conn.prepareStatement("select * from cuponcd where cuponcode='"+id+"';");
        ResultSet rs = ps.executeQuery();
 
        if(rs.next()){ 
       price = rs.getInt("price");
       yn = rs.getString("yn");
       category = rs.getString("category");
       name_cp = rs.getString("name_cp");
        	
        
        	
        	
        }else{
        	%>
        	<script>
        	alert("쿠폰번호가 일치하지 않습니다");
        	location.replace("cupon.jsp");
        	</script>
        	<%
        }
        

    } catch(Exception e) { 
        %><h1>
	실패 원인:<%="select * from cuponcd where cuponcode="+id+";" %></h1>
<%
    }
    
    
    
    if(category.equals("point") && yn.equals("n")){
    	%>ok<%
    	try{  
    PreparedStatement pstmt = conn.prepareStatement("INSERT INTO cupon(cod,user_number,price,category,yn,name_cupon,user_name,date) VALUES (?,?,?,?,?,?,?,?)");
    pstmt.setString(1, id);
	pstmt.setInt(2, num);
	pstmt.setInt(3, price);
	pstmt.setString(4, category);
	pstmt.setString(5, yn);
	pstmt.setString(6, name_cp);
	pstmt.setString(7, name);
	pstmt.setString(8, today);
	pstmt.executeUpdate();
	
	PreparedStatement pastmt = conn.prepareStatement("update USER set point=point+"+price+" where user_number="+num+";");
	pastmt.executeUpdate();
	PreparedStatement pazstmt = conn.prepareStatement("update cuponcd set yn='y';");
	pazstmt.executeUpdate();
	
	%>
	<script>
	alert("적립되었습니다");
	location.replace("cupon.jsp");
	</script>
	<%
    }catch(Exception e) {%><%="update USER set point=point+"+price+"where user_number="+num+";"%><% }
    
    
    
    
    
    
    
    
    
    
    
    
}else if(category.equals("point") && yn.equals("y")){
	%>
	<script>
	alert("이미 사용된 구폰입니다");
	location.replace("cupon.jsp");
	</script>
	<%
}




}























%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Document</title>
</head>
<body>

</body>
</html>