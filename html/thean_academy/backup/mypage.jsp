<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	
	
	<style>
	#sidebar{
	
	position: fixed;
  top: 0;
  right: -250px; /* 사이드바가 화면 우측에 위치하도록 함 */
  width: 250px;
  height: 100%;
  background-color: #f1f1f1;
  z-index: 1; /* 사이드바가 페이지 컨텐츠 위에 나타나도록 함 */
  transition: right 0.5s; /* 우측으로 이동할 때 트랜지션 효과를 추가함 */
	
	
	}
	#sidebar.active {
  right: 0; /* active 클래스가 추가되면 사이드바가 화면 우측에서 왼쪽으로 이동하도록 함 */
}
	
	
	</style>
</head>
<body>

</body>
</html>