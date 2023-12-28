<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배달삼겹 리뷰</title>
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
				배달삼겹 - 리뷰
			</div>
			<%-- 리뷰 전체 박스 부분 --%>
			<div class="border border-info rounded p-4 text-dark my-3">
				<%-- 이름+별점 --%>
				<div class="d-flex">
					<div class="mr-2"><h4 class="font-weight-bold">이정재</h4></div>
					<div>
						<img src="/img/star/star_fill.png" alt="별" width="20">
						<img src="/img/star/star_fill.png" alt="별" width="20">
					</div>
				</div>
				<%-- 날짜 --%>
				<h6 class="text-secondary font-weight-bold mb-3">2021년 4월 3일</h6>
				<%-- 리뷰 내용 --%>
				<h4 class="my-3">고기가 덜 익어서 왔어요!</h4>
				<%-- 메뉴 --%>
				<div class="p-1">
					<span id="menu-text" class="border border-white rounded font-weight-bold p-1">목살 고기만</span>
				</div>
			</div>
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