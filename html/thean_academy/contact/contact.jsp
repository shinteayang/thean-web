<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<%
    request.setCharacterEncoding("UTF-8");

    String sql = "SELECT * FROM questions";

    Connection conn = Util.getConnection();
    PreparedStatement p1 = Prepare.getPrepare(conn, sql);
    ResultSet rs = p1.executeQuery();
%>
<link rel="stylesheet" href="../../../css/thean_academy/contact.css">
<div class = "contact-container">
    <div class = "chat-container hidden">
        <div class = "status-bar">
            <div class = "exit" onClick = "exit()">✕</div>
        </div>
        <div class = "chat-messages">
            <div class = "chat-message received">
                궁금한 사항이 있으시면 챗봇을 통해 <br>물어보세요!
            </div>
        </div>
        <div class = "btns">
            <%
                while (rs.next()) {
                    %>
                        <button onClick = "addChats(<%=rs.getInt("id")%>)" class = "q-btn">
                            <%=rs.getString("question")%>
                        </button>
                    <%
                }
            %>
        </div>
    </div>
    <div class = "kcon">
        <div class = "kakao-con">
            <div class = "kakao" onClick = "exit()"></div>
            <div style = "margin-left: 14px;">
                <div class = "k-title">궁금한건<br>채팅으로 문의해주세요</div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    var chat = document.querySelector('.chat-messages');
    var con = document.querySelector('.chat-container');
    var icon = document.querySelector('.kcon');

    function addQuestion(id) {
        $.ajax({
            url: "https://thean-ac.com/source/html/thean_academy/index/addQuestion.jsp",
            type: "GET",
            data: {
                id: id,
            },
            success: function(data) {
                $(".chat-messages").append(data); 
                chat.scrollTop = chat.scrollHeight;
                console.log("sc");
            },
            error: function(xhr, status, error) {
                console.log(xhr.responseText);
                console.log(status);
                console.log(error);
                console.log("scz");
            }
        });
    }

    function addAnswer(id) {
        $.ajax({
            url: "https://thean-ac.com/source/html/thean_academy/index/addChat.jsp",
            type: "GET",
            data: {
                id: id,
            },
            success: function(data) {
                $(".chat-messages").append(data); 
                chat.scrollTop = chat.scrollHeight;   
                console.log("sc");               
            },
            error: function(error) {
                console.log(error);
                console.log("sc");
                
            }
        });
    }

    function addChats(id) {
        addQuestion(id);
        addAnswer(id);
    }

    function exit() {
        icon.classList.toggle('hidden');
        con.classList.toggle('hidden');
    }
</script>