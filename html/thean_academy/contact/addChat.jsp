<%@ page language="java" contentType="text/html; charset=UTF-8"pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    int sec_id = Integer.parseInt(request.getParameter("sec_id"));

    String sqla = "SELECT * FROM answer WHERE id = " + id;
    String sqln = "SELECT * FROM normal_question WHERE nor_id = " + sec_id;
    String sqls = "SELECT * FROM sub_question WHERE sub_id = " + sec_id;

    Connection conn = Util.getConnection();

    PreparedStatement pa = conn.getPrepare(conn, sqla);
    PreparedStatement pn = conn.getPrepare(conn, sqln);
    PreparedStatement ps = conn.getPrepare(conn, sqls);

    ResultSet rsa = pa.executeQuery();
    ResultSet rsn = pn.executeQuery();
    ResultSet rss = ps.executeQuery();

    if (rsa.next()) {
        while (rsa.next()) {
            %>
                <div><%=rsa.getString("answer")%></div>
            <%
        }
    } else {
        if (rsn.next()) {
            while (rsn.next()) {
                %>
                    <input type="hidden" id = "id" name = "id" value = "<%=rsn.getInt("id")%>">
                    <input type="hidden" id = "sec_id" name = "nor_id" value = "<%=rsn.getInt("nor_id")%>">
                    <div onClick = "addChats()"><%=rsn.getString("answer")%></div>
                <%
            }
        } else {
            if (rss.next()) {
                while (rss.next()) {
                    %>
                        <input type="hidden" id = "id" name = "id" value = "<%=rss.getInt("id")%>">
                        <input type="hidden" id = "sec_id" name = "sub_id" value = "<%=rss.getInt("sub_id")%>">
                        <div onClick = "addChats()"><%=rss.getString("answer")%></div>
                    <%
                }
            }
        }
    }
%>
