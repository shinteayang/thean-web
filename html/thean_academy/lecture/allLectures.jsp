<div class="video-titlea">전체강의</div>
    <div class="contents">
        <%
            PreparedStatement pes=conn.prepareStatement("select categorynum, img, format(price, 0) as price, day, th_cat, categoryname, te_name, th_cat, diffculty from CATE where categorynum="+rs.getInt("ct_number")+";");

            ResultSet res=pes.executeQuery();
            while(res.next()) {
            %>
                <a class="link" href="../lecture/lecture_info.jsp?id=<%=res.getInt("categorynum")%>">
                    <div class="video-content">
                        <div class = "difficulty"></div>
                        <div>
                            <div class="title"><%=res.getString("categoryname") %></div>
                            <div class="designer-info">
                                <div class="designer">
                                    <%=res.getString("te_name")%>
                                </div>
                            </div>
                        </div>
                        <div class = "difficulty-price">
                            <div class = "difficulty-info">
                                <%
                                    for (int j = 1 ; j <= res.getInt("diffculty") ; j++) {
                                        %>★<%
                                    }
                                %>
                            </div>
                            <div class="price-info">
                                <div class="price">₩<%=res.getString("price")%> / <%=res.getString("day")%>일</div>
                            </div>
                        </div>
                    </div>
                    <div class="thumb" style="background-image: url('../../../uploadimg/<%=res.getString("img") %>');"></div>
                </a>
            <% 
            }
        %>
    </div>