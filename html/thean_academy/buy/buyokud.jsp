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
    int cod = Integer.parseInt(request.getParameter("cod"));

    Connection conn = Util.getConnection();     
    ResultSet res = null;

    int cpw=spw-1606-1;

    if(session == null || session.getAttribute("name")==null) { 
        %><script>alert("로그인 후 이용해주세요");</script><%
    } else {
        Object ido = session.getAttribute("number");
        op_a = Integer.parseInt(ido.toString());
    }		

    try {           
        PreparedStatement ps = conn.prepareStatement("select * from CATE where categorynum="+ct);
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()) {
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
        pstmt = conn.prepareStatement("update buy set date=date+"+cod+", dbc=dbc+"+cod+" where user_number="+op_a+" and ct_number="+ct+";");
        String sql="update buy set date=date+"+cod+", dbc=dbc+"+cod+" where user_number="+op_a+" and ct_number="+ct+";";

        pstmt.executeUpdate();

        if(spw>0){
            point = point-cp;

            PreparedStatement pstmta = conn.prepareStatement("update USER set point="+point+" where user_number="+id);
            pstmta.executeUpdate();
            
        }
    } catch (Exception e) { 
            %><h1>실패a 원인: <%=e %></h1><%
    }
%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>결제</title>
    <style>
        @font-face {
            font-family: 'M';
            src: url('../../../font/M.ttf');
        }

        * {
            font-family: 'M';
        }

        .com-btn {
            margin-top: 60px;
            width: 200px;
            height: 80px;
            background: #244664;
            border-radius: 10px;
            color: #fff;
            font-size: 20px;
        }
    </style>
</head>
<body>
	<% 
        if (cpw==ct) { %>
            <div style = "margin-top: 180px; text-align: center;">
                <h1>결제가 완료 되었습니다. </h1>
                <h1>결제 완료버튼을 클릭해주세요.</h1>
                <button class = "com-btn" onClick = "location.href='https://thean-ac.com/source/html/thean_academy/index/main.jsp'">결제완료</button>
            </div>
        <% } 
        else { %><h1 style="color:red;">결제 미완료 후 불법 소스로 강의 시청 시 형사처벌 대상이 될 수 있습니다.</h1><% }
	%>
</body>
</html>