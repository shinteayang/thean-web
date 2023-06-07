<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");

    String sql = "SELECT * FROM big_question";

    Connection conn = Util.getConnection();
    PreparedStatement p1 = Prepare.getPrepare(conn, sql);
    ResultSet rs = p1.executeQuery();

    int id = 0;
    int big_id = 0;
%>
<link rel="stylesheet" href="../../../css/thean_academy/contact.css">
<div class = "contact-container">
    <div class = "chat-container">
        <div class = "chat-messages">
            <div class = "chat-message received">
            <script>
            var i=1;
            
            </script>
            
                <%

                    while (rs.next()) {
                        %>
                            <div onClick = "" class = "msg" id = "div-<%=rs.getInt("id")%>">
                                <input type="hidden" id = "id-<%=rs.getInt("id")%>" name = "id" value = "<%=rs.getInt("id")%>">
                                <input type="hidden" id = "sec_id-<%=rs.getInt("big_id")%>" name = "sec_id" value = "<%=rs.getInt("big_id")%>">
                                <div><%=rs.getString("question")%></div>
                            </div>
                        <%
                    }
                %>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
 var msg = null;
    function addChats() {
       
         msg=document.querySelectorAll('.msg');
        console.log(msg);
     
 
    msg.forEach(function(div) {
        div.addEventListener('click', function() {
            console.log(div);
            var id = this.querySelector('input[name="id"]').value;
            var sec_id = this.querySelector('input[name="sec_id"]').value;

            $.ajax({
                url: "addChat.jsp",
                type: "GET",
                data: {
                    id: id,
                    sec_id: sec_id
                },
                success: function(data) {
                    $(".chat-messages").append(data);
                   
                    if(i==1){
                    addChats();
                    i++;
                    console.log(i);
                    }else{
                    i--;
                    console.log(i);
                    }
                 
                    console.log(msg);
                    
                },
                error: function(error) {
                    console.log(error);
                }
            });
        });
    });
   console.log(msg);
    }
 
    addChats();
    console.log(i);
    
   
   
</script>