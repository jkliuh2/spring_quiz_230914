<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력</title>
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
			<aside class="bg-info col-2">
				<%-- 로고 영역 --%>
				<div id="logo">
					<img src="/img/weather.svg" width="100" alt="기상청 로고">
				</div>
				<%-- 메뉴 --%>
				<nav>
					<ul class="nav flex-column">
						<li class="nav-item"><a href="/weather_history/weather-list-view" class="nav-text nav-link">날씨</a></li>
						<li class="nav-item"><a href="/weather_history/add-weather-view" class="nav-text nav-link">날씨입력</a></li>
						<li class="nav-item"><a href="#" class="nav-text nav-link">테마날씨</a></li>
						<li class="nav-item"><a href="#" class="nav-text nav-link">관측 기후</a></li>
					</ul>
				</nav>
			</aside>
			<%-- 컨텐츠 영역 --%>
			<section id="weather-history" class="content1 col-10">
				<h3>날씨 입력</h3>
				<form method="post" action="/weather_history/add-weather">
					<div class="d-flex justify-content-between mt-5">
						<div class="d-flex align-items-center">
							<div class="input-label">날짜</div>
							<input type="text" class="form-control" id="date" name="date">
						</div>
						<div class="d-flex align-items-center">
							<div class="input-label">날씨</div>
							<select class="form-control" name="weather">
								<option>맑음</option>
								<option>구름조금</option>
								<option>흐림</option>
								<option>비</option>
							</select>
						</div>

						<div class="d-flex align-items-center">
							<div class="input-label">미세먼지</div>
							<select class="form-control" name="microDust">
								<option>좋음</option>
								<option>보통</option>
								<option>나쁨</option>
								<option>최악</option>
							</select>
						</div>
					</div>

					<div class="d-flex justify-content-between mt-5">
						<div class="d-flex align-items-center">
							<div class="input-label">기온</div>
							<div class="input-group">
								<input type="text" class="form-control" name="temperatures">
								<div class="input-group-append">
									<span class="input-group-text">℃</span>
								</div>
							</div>
						</div>
						<div class="d-flex align-items-center">
							<div class="input-label">강수량</div>
							<div class="input-group">
								<input type="text" class="form-control" name="precipitation">
								<div class="input-group-append">
									<span class="input-group-text">mm</span>
								</div>
							</div>
						</div>

						<div class="d-flex align-items-center">
							<div class="input-label">풍속</div>
							<div class="input-group">
								<input type="text" class="form-control" name="windSpeed">
								<div class="input-group-append">
									<span class="input-group-text">km/h</span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="text-right mt-4 mb-5">
						<input type="submit" class="btn btn-success" value="저장">
					</div>
				</form>
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