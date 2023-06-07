
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="DBPKG.UtilArc"%>
<%@ page import="DBPKG.Prepare"%>
    <%
    
    
    
    
    
    
    
    
    
    
    
    
    %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>더안건축</title>
	<link rel="stylesheet" type="text/css" href="../../css/thean/main.css" />
</head>
<body>
	<div id = "main">
		<div id = "header">
            <jsp:include page="header.jsp"></jsp:include>
            <a class = "feature" href = "#body">
                <img src="../../upload_server/thean_resource/arrow_bottom.png" alt="" class = "arrow">
                Featured Works
            </a>
		</div>
		<div id = "body">
            <div class = "photo-container">
                <div class = "photo-element">
                    <div class = "photo-title">설계</div>
                    <div class = "photo-list">
                        <div class = "photos">
                            <a href = "arc_info.jsp" class = "thumb-info">
                                <div class = "thumb-title">울산 당사동 다가구 주택 '바다를 품은 집'</div>
                                <div class = "thumb-year">2019</div>
                            </a>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                    </div>
                    <div class = "more">
                        <a href="">더보기</a>
                    </div>
                </div>
                <div class = "photo-element">
                    <div class = "photo-title">실축</div>
                    <div class = "photo-list">
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                    </div>
                    <div class = "more">
                        <a href="">더보기</a>
                    </div>
                </div>
                <div class = "photo-element">
                    <div class = "photo-title">준공</div>
                    <div class = "photo-list">
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                        <div class = "photos">
                            <div class = "thumb-title"></div>
                            <div class = "thumb"></div>
                        </div>
                    </div>
                    <div class = "more">
                        <a href="">더보기</a>
                    </div>
                </div>
            </div>
		</div>
	</div>
</body>
</html>