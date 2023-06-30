<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%@ page import="java.util.Date" %>
<%

int id=Integer.parseInt(request.getParameter("id"));
int ct=Integer.parseInt(request.getParameter("ct"));
Connection conn = null;
conn = Util.getConnection();
PreparedStatement ps = null;

ResultSet rs =null;
String sqla="";
String sql = "";
try { 
           sqla="select * from MV where categorynum="+ct+";";
            ps=conn.prepareStatement(sqla);
            rs=ps.executeQuery();

            while(rs.next()){
            sql=sql+"insert into videotime(videonum,usernum,ctnum) values("+rs.getInt("mv_tol")+","+id+","+ct+");";
                ps=conn.prepareStatement("insert into videotime(videonum,usernum,ctnum) values("+rs.getInt("mv_tol")+","+id+","+ct+");");
               ps.executeUpdate();

            }
              
              conn.close();

        } catch(Exception e) { 
            %><h1>실패 원인:<%=e %></h1><%   
        }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>결제가 완료 되었습니다. </h1><h1>창을 닫고 결제 완료버튼을 클릭해주세요.</h1>
    <script>
    location.href="ok.jsp";
    
    </script>
</body>
</html>