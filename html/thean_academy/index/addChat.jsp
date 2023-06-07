<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");

    int id = Integer.parseInt(request.getParameter("id"));
    int sec_id = Integer.parseInt(request.getParameter("sec_id"));

    String sqla = "SELECT * FROM answers WHERE id = " + id;
    String sqln = "SELECT * FROM normal_question WHERE nor_id = " + sec_id;
    String sqls = "SELECT * FROM sub_question WHERE sub_id = " + sec_id;

    Connection conn = Util.getConnection();

    PreparedStatement pa = Prepare.getPrepare(conn, sqla);
    PreparedStatement pn = Prepare.getPrepare(conn, sqln);
    PreparedStatement ps = Prepare.getPrepare(conn, sqls);
int i=10;
    ResultSet rsa = pa.executeQuery();//최종답
    ResultSet rsn = pn.executeQuery();//중질문
    ResultSet rss = ps.executeQuery();//소질문
    int ij=0;
    try {
        %><div class = "chat-message received"><%
            while (rsa.next()) {
                %>
                    <div><%=rsa.getString("answer")%></div>
                <%
                  ij++;
                  i++;
            }
            %></div><%
            if(i==0){
                %><div class = "chat-message received"><%
                  while (rsn.next()) {
                %>
                    <div class = "msg" onClick="addChats()" id = "div-<%=ij%>">
                        <input type="hidden" id = "id-<%=rsn.getInt("id")%>" name = "id" value = "<%=rsn.getInt("id")%>">
                        <input type="hidden" id = "sec_id-<%=rsn.getInt("nor_id")%>" name = "sec_id" value = "<%=rsn.getInt("nor_id")%>">
                        <div><%=rsn.getString("question")%></div>
                    </div>
                    
                <%
                ij++;
            }
            %></div><%
            }else if(i!=1){
                %><div class = "chat-message received"><%
                while (rss.next()) {
                %>
                    <div class = "msg" onClick="addChats()" id = "div-<%=ij%>">
                        <input type="hidden" id = "id-<%=rss.getInt("id")%>" name = "id" value = "<%=rss.getInt("id")%>">
                        <input type="hidden" id = "sec_id-<%=rss.getInt("sub_id")%>" name = "sec_id" value = "<%=rss.getInt("sub_id")%>">
                        <div><%=rss.getString("question")%></div>
                    </div>
                
                <%
                ij++;
            }
            %></div><%
        }
    } catch (Exception e) {
        %><h1><%=e%></h1><%
    }
%>
