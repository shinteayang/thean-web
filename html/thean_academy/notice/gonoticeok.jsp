<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	request.setCharacterEncoding("UTF-8");
  	Connection conn = null;
  	PreparedStatement pstmt = null;
     Date now = new Date();
    conn = Util.getConnection();
	int nuno = 0;
    int opa=0;
    Object op="1";
    Object un="1";
    String phone="";
    String name="";
    int numb=0;
    String pw="";
    String idx="";
    String txt="";
    String pb="";
    String unm = un.toString();
    	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd/hh:mm");
    	String today = sf.format(now);
         idx=request.getParameter("nm");
       txt=request.getParameter("content");
        pb=request.getParameter("pb");

    if(session == null || session.getAttribute("name")==null) {
       phone=request.getParameter("digit");
       name=request.getParameter("name");
       pw=request.getParameter("pwd");
      
      



       try {
            PreparedStatement ps = conn.prepareStatement("select MAX(no) from cs;");
            ResultSet rs = ps.executeQuery();
    
            if(rs.next()) { 
                nuno = rs.getInt("MAX(no)");
                nuno += 1;
            } else {
                nuno = 1;			
            }
    	} catch(Exception e) { 
        	%><h1><%=e %></h1><% 	
        }
        try {
       
        pstmt = conn.prepareStatement("INSERT INTO cs (no,us_name,phone,idx,text,pb,checkaa,date,pw) VALUES (?,?,?,?,?,?,?,?,?)");

        pstmt.setInt(1, nuno);
        pstmt.setString(2, name);
        pstmt.setString(3, phone);
        pstmt.setString(4, idx);
        pstmt.setString(5, txt);
        pstmt.setString(6, pb);
        pstmt.setString(7, "등록완료");
        pstmt.setString(8, today);
        pstmt.setString(9, pw);
        pstmt.executeUpdate();
        conn.close();

       
           %>
        <script>
        alert("등록완료");
        location.href='notice.jsp?pg=0&se=all';
        
        </script>
        <%
        } catch(Exception e) { 
            %><h1><%=e %></h1><% 	
        }


    }else{

 name=session.getAttribute("name").toString();
      Object ag= session.getAttribute("number");   
        numb = Integer.parseInt(ag.toString());
      

       

  try {
            PreparedStatement ps = conn.prepareStatement("select MAX(no) from cs;");
            ResultSet rs = ps.executeQuery();
    
            if(rs.next()) { 
                nuno = rs.getInt("MAX(no)");
                nuno += 1;
            } else {
                nuno = 1;			
            }
    	} catch(Exception e) { 
        	%><h1><%=e %></h1><% 	
        }
        try {
       
        pstmt = conn.prepareStatement("INSERT INTO cs (no,us_name,user_no,idx,text,pb,checkaa,date) VALUES (?,?,?,?,?,?,?,?)");

        pstmt.setInt(1, nuno);
        pstmt.setString(2, name);
        pstmt.setInt(3, numb);
        pstmt.setString(4, idx);
        pstmt.setString(5, txt);
        pstmt.setString(6, pb);
        pstmt.setString(7, "등록완료");
        pstmt.setString(8, today);
        pstmt.executeUpdate();
        conn.close();

           %>
        <script>
        alert("등록완료");
        location.href='notice.jsp?pg=0&se=all';
        
        </script>
        <%

        } catch(Exception e) { 
            %><h1><%=e %></h1><% 	
        }
    





   
    	
    	
    	
    	
	
    
        } 	
%>
