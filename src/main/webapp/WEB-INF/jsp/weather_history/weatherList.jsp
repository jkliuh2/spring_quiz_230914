<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<!-- css파일 링크 -->
<link rel="stylesheet" type="text/css" href="/css/weather_history/weather_style.css">
</head>
<body>
	<div id="wrap">
		<section class="contents d-flex">
			<%-- 메뉴 영역 --%>
			<aside class="col-2">
				<%-- 로고 영역 --%>
				<div id="logo">
					<img src="/img/weather.svg" width="100" alt="기상청 로고">
				</div>
				<%-- 메뉴 --%>
				<nav>
					<ul class="nav flex-column">
						<li class="nav-item"><a href="/weather-history/weather-list-view" class="nav-text nav-link">날씨</a></li>
						<li class="nav-item"><a href="/weather-history/add-weather-view" class="nav-text nav-link">날씨입력</a></li>
						<li class="nav-item"><a href="#" class="nav-text nav-link">테마날씨</a></li>
						<li class="nav-item"><a href="#" class="nav-text nav-link">관측 기후</a></li>
					</ul>
				</nav>
			</aside>
			<%-- 컨텐츠 영역 --%>
			<section id="weather-history" class="content1 col-10">
				<h3>과거 날씨</h3>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${weatherList}" var="weather">
						<tr>
							<td> <%-- 날짜(Date객체로 들어옴) --%>
								<fmt:formatDate value="${weather.date}" pattern="yyyy년 MM월 dd일" />
							</td>
							<td> <%-- 날씨(그림) --%>
								<c:if test="${weather.weather eq '맑음'}">
									<img src="/img/sunny.jpg" alt="맑음">
								</c:if>
								<c:if test="${weather.weather eq '흐림'}">
									<img src="/img/cloudy.jpg" alt="흐림">
								</c:if>
								<c:if test="${weather.weather eq '구름조금'}">
									<img src="/img/partlyCloudy.jpg" alt="구름조금">
								</c:if>
								<c:if test="${weather.weather eq '비'}">
									<img src="/img/rainy.jpg" alt="비">
								</c:if>
							</td>
							<td>${weather.temperatures}℃</td>
							<td>${weather.precipitation}mm</td>
							<td>${weather.microDust}</td>
							<td>${weather.windSpeed}km/h</td>
						</tr>
						</c:forEach> <%-- 반복문 끝 --%>
					</tbody>
				</table>
			</section>
		</section>
		<%-- footer영역 --%>
		<footer class="d-flex">
			<div class="d-flex align-items-center">
				<img src="/img/weather.svg" width="200" alt="기상청 이미지">
			</div>
			<div class="d-flex align-items-center">
				<small class="text-secondary">(07062) 서울시 동작구 여의대방로 16길 61<br>
				Copyright@20XX KMA. All Rights RESERVED.</small>
			</div>
		</footer>
	</div>
</body>
</html>