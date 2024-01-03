<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>예약 목록</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
<!-- 외부 스타일시트 -->
<link rel="stylesheet" type="text/css" href="/css/booking/quiz06_style.css">
</head>
<body>
	<div id="wrap" class="container p-0">
		<%-- 헤더. 로고영역 --%>
		<header class="d-flex justify-content-center align-items-center">
			<h1>통나무 팬션</h1>
		</header>
		<%-- 메뉴 영역 --%>
		<nav class="d-flex align-items-center">
			<jsp:include page="menu.jsp" />
		</nav>
		<%-- section 영역 --%>
		<section class="contents">
			<jsp:include page="section-bookingList.jsp"></jsp:include>
		</section>
		<%-- footer 영역 --%>
		<footer class="d-flex align-items-center text-secondary">
			<small> 제주특별자치도 제주시 애월읍<br> 사업자등록번호: 111-222-255222 /
				농어촌민박사업자지정 / 대표:김동목<br> Copyright 2025 tongnamu All right
				reserved
			</small>
		</footer>
	</div>
</body>
</html>