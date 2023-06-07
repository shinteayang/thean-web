<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%@ page import="java.util.Date" %>
<%
int price=0;
int mprice=0;
Date now = new Date();
String ct_name="";
int day=0;
String te_name="";
String cover="";
String user_id="";


String user_name="";
String user_adress="";
String user_phone="";
String user_mail="";
int number = 0;
int op_a = 0;
int i = 1;
int point=0;
int scp=0;
int id = Integer.parseInt(request.getParameter("id"));
int cp = Integer.parseInt(request.getParameter("cp"));
int ct = Integer.parseInt(request.getParameter("ct"));
int spw = Integer.parseInt(request.getParameter("spw"));
Connection conn = Util.getConnection();     ResultSet res = null;
int cpw=spw-1606-1;
try {           
    PreparedStatement ps = conn.prepareStatement("select * from CATE where categorynum="+ct);
    ResultSet rs = ps.executeQuery();

    
if(rs.next()){
	price=rs.getInt("price");
	ct_name=rs.getString("categoryname");
	day=rs.getInt("day");
	te_name=rs.getString("te_name");
	cover=rs.getString("cover");
}
PreparedStatement psa = conn.prepareStatement("select * from USER where user_number="+id);
ResultSet rsa = psa.executeQuery();
if(rsa.next()){
	user_name=rsa.getString("user_name");
	user_adress=rsa.getString("user_adress");
	user_phone=rsa.getString("user_phone");
	user_mail=rsa.getString("user_mail");
	user_id=rsa.getString("user_id");
	point=rsa.getInt("point");

}

PreparedStatement pstmt = conn.prepareStatement("select * from USER where user_number="+op_a);
pstmt = conn.prepareStatement("INSERT INTO buy (`buy_number`, `user_name`, `user_id`, `user_number`, `ct_number`, `ct_name`, `price`, `date`, `buy_info`,dbc) VALUES (NULL,?, ?, ?, ?, ?, ? , ?, ?, ?);");

pstmt.setString(1, user_name);
pstmt.setString(2, user_id);
pstmt.setInt(3, id);
pstmt.setInt(4, ct);
pstmt.setString(5, ct_name);
pstmt.setInt(6, price);
pstmt.setInt(7, day);
pstmt.setString(8, "정상결제");
pstmt.setInt(9, day);

pstmt.executeUpdate();

point = point-cp;

	PreparedStatement pstmta = conn.prepareStatement("update USER set point="+point+" where user_number="+id);
	pstmta.executeUpdate();

    %>
    <script>
    location.href="update-vd.jsp?id=<%=id%>&ct=<%=ct%>"
    
    </script>
    
    
    <%
  
} catch (Exception e) { 
        %><h1>실패a 원인: <%=e %></h1><%
}


%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>결제</title>

</head>
<body>
	
</body>
</html>