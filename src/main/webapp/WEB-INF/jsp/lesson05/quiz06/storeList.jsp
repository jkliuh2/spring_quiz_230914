<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리동네 가게</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<!-- 외부 스타일시트 -->
<link rel="stylesheet" type="text/css" href="/css/lesson05_quiz06/store_style.css">
</head>
<body>
	<div id="wrap" class="container">
		<%-- header 부분 --%>
		<header class="bg-info text-white d-flex align-items-center pl-3">
			<h1>배탈의 민족</h1>
		</header>
		<%-- section 부분 --%>
		<section class="contents">
			<div class="display-4 my-3">
				우리동네 가게
			</div>
			<%-- 가게 박스 부분 --%>
			<c:forEach items="${storeList}" var="store">
			<a href="/lesson05/quiz06/reviews?storeId=${store.id}&storeName=${store.name}">
				<div class="border border-info rounded p-3 text-dark my-3">
					<h3 class="font-weight-bold">${store.name}</h3>
					<h5 class="font-weight-bold">전화번호 : ${store.phoneNumber}</h5>
					<h5 class="font-weight-bold">주소 : ${store.address}</h5>
				</div>
			</a>
			</c:forEach> <%-- 반복문 끝 --%>
		</section>
		<%-- footer 부분 --%>
		<footer>
			<hr>
			<h4>(주)우와한 형제</h4>
			<h5 class="text-secondary">고객센터:1500-1500</h5>
		</footer>
	</div>
</body>
</html>