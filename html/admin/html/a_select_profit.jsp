<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="java.io.*"%>
<%@ page import="DBPKG.Key"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="DBPKG.Key"%>
<%
    DecimalFormat df = new DecimalFormat("###,###,###"); 

    int price_sum = 0;
    int surtax_sum = 0;
    int academy_setm_sum = 0;
    int teacher_amount_sum = 0;
    int teacher_tax_sum = 0;
    int teacher_setm_sum = 0;
    int cnt = 0;

    String variableValue = Key.getKey();
    Connection conn = null;
    conn = Util.getConnection();
    String sql = "SELECT *, b.buy_number as number, b.user_name as name, b.ct_name as ct, b.price as price, CONCAT('0', AES_DECRYPT(UNHEX(u.user_phone), '" + variableValue + "')) as phone, AES_DECRYPT(UNHEX(u.user_id), '" + variableValue + "') as id, u.mb_cat as job FROM buy b JOIN USER u ON b.user_number = u.user_number GROUP BY b.buy_number";

    PreparedStatement ps = conn.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
%>
<!doctype html>
    <html lang="ko">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>더안건축-관리자</title>
        <link rel="stylesheet" href="../css/profit.css" />
        <link rel="stylesheet" href="../css/teacher.css">
        <link rel="stylesheet" href="../css/co.css" />
    </head>
    <body>
        <div class = "body">
            <jsp:include page="menubar.jsp"></jsp:include>
            <div class="main-container">
                <div class = "main-elements">
                    <div class="main-title">정산 관리</div>
                    <div class = "profit">
                        
                    </div>
                    <table id = "table">
                        <tr>
                            <th>결제일시</th>
                            <th>구매자정보</th>
                            <th>강의명</th>
                            <th>회원구분</th>
                            <th>결제금액</th>
                            <th>부가세</th>
                            <th>학원정산</th>
                            <th>강사금액</th>
                            <th>강사세금</th>
                            <th>강사정산</th>
                        </tr>
                        <%
                            while(rs.next())
                            {
                                int price = rs.getInt("price");
                                int surtax = (int)(price * 0.1);
                                int academy_setm = (int)((price - surtax) * 0.4);
                                int teacher_amount = (int)((price - surtax) * 0.6);
                                int teacher_tax = (int)(teacher_amount * 0.033);
                                int teacher_setm = teacher_amount - teacher_tax;

                                price_sum += price;
                                surtax_sum += surtax;
                                academy_setm_sum += academy_setm;
                                teacher_amount_sum += teacher_amount;
                                teacher_tax_sum += teacher_tax;
                                teacher_setm_sum += teacher_setm;

                                cnt += 1;
                        %>
                        <tr>
                            <td><%=rs.getString("price_date")%></td>
                            <td><%=rs.getString("name")%>/<%=rs.getString("id")%>/<%=rs.getString("phone")%></td>
                            <td><%=rs.getString("ct")%></td>
                            <td><%=rs.getString("job")%></td>
                            <td><%=df.format(price)%></td>
                            <td><%=df.format(surtax)%></td>
                            <td><%=df.format(academy_setm)%></td>
                            <td><%=df.format(teacher_amount)%></td>
                            <td><%=df.format(teacher_tax)%></td>
                            <td><%=df.format(teacher_setm)%></td>
                        </tr>
                        <%
                            }
                        %>
                        <tr>
                            <td>총합</td>
                            <td></td>
                            <td>강의구매 <%=cnt%>개</td>
                            <td></td>
                            <td><%=df.format(price_sum)%></td>
                            <td><%=df.format(surtax_sum)%></td>
                            <td><%=df.format(academy_setm_sum)%></td>
                            <td><%=df.format(teacher_amount_sum)%></td>
                            <td><%=df.format(teacher_tax_sum)%></td>
                            <td><%=df.format(teacher_setm_sum)%></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>