<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.Util"%>
<%@ page import="DBPKG.Prepare"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="../../../css/thean_academy/education.css">  
    </head>
    <body>
    <%
    String te = request.getParameter("tec");
     String sqlad ="";
	String se = "selected";
	int iz=0;
	if(te.equals("all")){
		iz=1;
	}else{
		iz=Integer.parseInt(te);;
	}

    
    %>
        <jsp:include page="../header/header.jsp"></jsp:include>
        <div id="body">
            <div>
                <div class="title">학습지원</div>
            </div>
            <div>
                <div class = "teacher-list">
                    <div class = "teacher-name">강사명</div>
                    <form action="education.jsp" id = "searchForm">
                    <select name="tec" id="tec">
                        <option value="all">강사를 선택해주세요</option>
					<%
                      String pg="";
                     pg=request.getParameter("pg");

                     int pag=Integer.parseInt(pg);
                     int pagst=pag*10;
                     int nuno=1;
					 String sql = "select teacher_name,teacher_no from teacher;";

					Connection conn = Util.getConnection();     ResultSet res = null;
					
					try {	 
				    	PreparedStatement ps = Prepare.getPrepare(conn, sql);
						ResultSet rs = ps.executeQuery();
						
						int number = 0;
						int i=1;

				        while(rs.next()) {
				        	if(te.equals("all")){
				        		%><option value="<%=rs.getInt("teacher_no")%>"><%=rs.getString("teacher_name") %></option><%
				        	}else{
				        		if(rs.getInt("teacher_no")==iz){
				        			%><option value="<%=rs.getInt("teacher_no")%>" selected><%=rs.getString("teacher_name") %></option><%
				        		}else{
				        			%><option value="<%=rs.getInt("teacher_no")%>"><%=rs.getString("teacher_name") %></option><%
				        		}
				        		
				        		
				        		
				        	}
				        	
				        
				        }
					
					
					}catch(Exception e){
						%><%=e%><% 
					}
					
					%>
                    </select>
                    <input type="text" name="pg" value="0" hidden>
                    </form>
                </div>
            </div>
            <div class = "table-container">
                <table id="table">
                    <th class="th">게시번호</th>
                    <th class="th">제목</th>
                    <th class="th">강사</th>
                    <th class="th">날짜</th>
                    <th class="th">현황</th>
                    
                    	<%
                    	if(te==null || te.equals("all")){
                    		

                            try {
            PreparedStatement ps = conn.prepareStatement("select MAX(non) from tenoice;");
            ResultSet rts = ps.executeQuery();
    
            if(rts.next()) { 
                nuno = rts.getInt("MAX(non)");
                nuno += 1;
            } else {
                nuno = 1;			
            }
    	} catch(Exception e) { 
        	%><h1><%=e %></h1><% 	
        }

        sql = "select * from tenoice LIMIT "+pagst+",10;";
        sqlad ="select count(*) from tenoice;";
                    	}else{

                             try {
            PreparedStatement ps = conn.prepareStatement("select MAX(non) from tenoice where te_no="+te+";");
            ResultSet rts = ps.executeQuery();
    
            if(rts.next()) { 
                nuno = rts.getInt("MAX(non)");
                nuno += 1;
            } else {
                nuno = 1;			
            }
    	} catch(Exception e) { 
        	%><h1><%=e %></h1><% 	
        }


                    		sql = "select * from tenoice where te_no="+te+" LIMIT "+pagst+",10;";
                            sqlad="select count(*) from tenoice where te_no="+te+";";
                    	}
					 

					 ResultSet ress = null;
					
					try {	 
				    	PreparedStatement pes = Prepare.getPrepare(conn, sql);
						ress = pes.executeQuery();
						
						int number = 0;
						int i=1;
                       if(pag==0){
                        i=1;
                       }else{
                        i=pag*10+1;
                       }

				        while(ress.next()) {
				        	%>
				        	<tr>
				        	<td><%=i %></td>
				        	<td><a href="../notice/edan.jsp?id=<%=ress.getString("non") %>"><%=ress.getString("idx") %></a></td>
				        	<td><%=ress.getString("answerte") %></td>
				        	<td><%=ress.getString("date") %></td>
				        	<td><%=ress.getString("checkaa") %></td>
				        	</tr>
				        	
				        	
				        	<%
				        	i++;
				        
				        }

                        %></table><%
                








                            PreparedStatement peds = Prepare.getPrepare(conn, sqlad);
                            ResultSet reds = peds.executeQuery();
                            int pkn=0;
                            if(reds.next()){
                                int ia=1;
                                int pkd=pag;
                                  int kz=1;
                                pkn=reds.getInt("count(*)")/10+1;
                                if(pag>10){
                                   pkd=pag/10;    

                                }
                                if(pag>=10){
                                    if(pag%10==0){
                                        ia=pag/pkd*10;
                                    }else{
                                    ia=pag/pkd;
                                    ia=ia/10;
                                    ia=ia*10;

                                    }
                                    
                                    
                                    
                                  
                                }
                             
                                %><div class = "page-num"><%
                                while(ia<(pkn+1)){
                                    if(kz==1){
                                         %>
                                    <a href="education.jsp?pg=<%=i-1%>&tec=<%=te%>"><</a>
                                    <%
                                    }
                                    kz=2;

                                    if(ia>=10){
                                        %>
                                   
                                    <a class = "page <%if (pag == ia || (ia == 9)) {%>active<%}%>" href="education.jsp?pg=<%=ia%>&tec=<%=te%>"><%=ia%></a>
                                    <%
                                    }else{
                                        %>
                                   
                                    <a class = "page <%if ((pag + 1) == ia) {%>active<%}%>" href="education.jsp?pg=<%=ia-1%>&tec=<%=te%>"><%=ia%></a>
                                    <%
                                    }
                                    
                                    ia++;
                                    pkd++;
                                    if(ia%10==0){
                                        %>
                                       
                                    <a href="education.jsp?pg=<%=ia%>&tec=<%=te%>">></a>
                                    <%
                                        break;
                                    }
                                }
                                %></div><%
                            }
                        } catch(Exception e) {
                            %><%=e%><% 
                        }	
					%>       
            </div>
            <a class = "back-btn" href="eduWrite.jsp?te=<%=te%>">작성하기</a>
        </div>
        <jsp:include page="../header/footer.jsp"></jsp:include>
        <jsp:include page="../contact/contact.jsp"></jsp:include>
    </body>
    <script>
        const form = document.getElementById("searchForm");
        const select = document.getElementById("tec");

        select.addEventListener('change', () => {
            form.submit();
        });
    </script>
</html>