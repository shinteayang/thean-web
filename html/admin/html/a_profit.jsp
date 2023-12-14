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
    request.setCharacterEncoding("UTF-8");
    DecimalFormat df = new DecimalFormat("###,###,###");

    int price_sum = 0;
    int surtax_sum = 0;
    int academy_setm_sum = 0;
    int teacher_amount_sum = 0;
    int teacher_tax_sum = 0;
    int teacher_setm_sum = 0;
    int cnt = 0;

    String variableValue = Key.getKey();

    int year = Integer.parseInt(request.getParameter("year"));
    int month = Integer.parseInt(request.getParameter("month"));
    String teacher = request.getParameter("teacher");

    Connection conn = null;
    conn = Util.getConnection();
    String sql = "SELECT b.price_date as price_date, b.buy_number as number, b.user_name as name, b.ct_name as ct, b.price as price, CONCAT('0', AES_DECRYPT(UNHEX(u.user_phone), '" + variableValue + "')) as phone, AES_DECRYPT(UNHEX(u.user_id), '" + variableValue + "') as id, u.mb_cat as job FROM buy b JOIN USER u ON b.user_number = u.user_number JOIN CATE c ON c.categorynum = b.ct_number WHERE YEAR(b.price_date) = " + year + " AND MONTH(b.price_date) = " + month + " AND c.te_name = '" + teacher + "' GROUP BY b.buy_number";
    String sql2 = "SELECT teacher_no, teacher_name FROM teacher";
    String sql3 = "SELECT MONTH(price_date) AS mon, SUM(price) as price FROM buy WHERE YEAR(price_date) = " + year + " AND MONTH(price_date) = " + month + " GROUP BY mon";

    PreparedStatement ps = conn.prepareStatement(sql);
    PreparedStatement ps2 = conn.prepareStatement(sql2);
    PreparedStatement ps3 = conn.prepareStatement(sql3);

    ResultSet rs = ps.executeQuery();
    ResultSet rs2 = ps2.executeQuery();
    ResultSet rs3 = ps3.executeQuery();
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
                    <div>
                        <form action="a_profit.jsp" method = "get" onsubmit="return check();">
                            <select name="year" id="year">
                                <option value="">연도 선택</option>
                                <option value="2023">2023년</option>
                                <option value="2022">2022년</option>
                            </select>
                            <select name="month" id="month">
                                <option value="">월 선택</option>
                                <option value="1">1월</option>
                                <option value="2">2월</option>
                                <option value="3">3월</option>
                                <option value="4">4월</option>
                                <option value="5">5월</option>
                                <option value="6">6월</option>
                                <option value="7">7월</option>
                                <option value="8">8월</option>
                                <option value="9">9월</option>
                                <option value="10">10월</option>
                                <option value="11">11월</option>
                                <option value="12">12월</option>
                            </select>
                            <select name="teacher" id="teacher">
                                <option value="">강사 선택</option>
                                <%
                                    while(rs2.next()) {
                                        %><option value="<%=rs2.getString("teacher_name")%>"><%=rs2.getString("teacher_name")%></option><%
                                    }
                                %>
                            </select>
                            <button type = "submit">조회</button>
                            <div class = "profit-title">
                                <%=year%>년 <%=month%>월분 <%=teacher%> 강사 정산
                            </div>
                            <div class = "profit">
                                <div class = "profit-element">
                                    <br>
                                    <div>총매출</div>
                                    <div>강사정산</div>
                                    <div>순수익</div>
                                </div>
                                <%
                                    while(rs3.next()) {
                                        int price = rs3.getInt("price");
                                        int surtax = (int)(price * 0.1);
                                        int teacher_amount = (int)((price - surtax) * 0.6);
                                        int teacher_tax = (int)(teacher_amount * 0.033);
                                        int teacher_setm = teacher_amount - teacher_tax;
                                        %>
                                            <div class = "profit-element">
                                                <div><%=rs3.getString("mon")%>월</div>
                                                <div><%=df.format(price)%>원</div>
                                                <div><%=df.format(teacher_setm)%>원</div>
                                                <div><%=df.format(price - teacher_setm)%>원</div>
                                            </div>
                                        <%
                                    }
                                %>
                            </div>
                        </form>
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
                    <button onclick="exportToExcel()">엑셀로 다운로드</button>
                </div>
            </div>
        </div>
    </body>
</html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function check() {
        var year = $("#year option:selected").val();
        var month = $("#month option:selected").val();
        var teacher = $("#teacher option:selected").val();
        
        if (year == "") {
            alert('연도를 선택해주세요.');
            return false;
        } if (month == "") {
            alert('월을 선택해주세요.');
            return false;
        } if (teacher == "") {
            alert('강사를 선택해주세요.');
            return false;
        } else {
            return true;
        }
    }

    function exportToExcel() {
        let table = document.getElementById("table");
        let html = table.outerHTML;

        let blob = new Blob([html], {
            type: 'application/vnd.ms-excel'
        });
        let a = document.createElement("a");
        a.href = URL.createObjectURL(blob);
        a.download = "<%=year%>년_<%=month%>월분_<%=teacher%>_강사_정산.xls";
        document.body.appendChild(a);
        a.click();
        document.body.removeChild(a);
    }
</script>
<%
    conn.close();
%>