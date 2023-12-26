<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5강 quiz02</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div>
			<h1>1. JSTL forEach</h1>
			<h1>HOT 5</h1>
			<table class="table text-center">
				<thead>
					<tr>
						<th>순위</th>
						<th>제목</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${musicRanking}" var="music" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${music}</td>
					</tr>
					</c:forEach> <%-- 반복문 끝 --%>
				</tbody>
			</table>
		</div>
		<br>
		<div>
			<h1>2. JSTL 응용하기</h1>
			<h1>멤버십</h1>
			<table class="table text-center">
				<thead>
					<tr>
						<th>이름</th>
						<th>전화 번호</th>
						<th>등급</th>
						<th>포인트</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${membership}" var="member">
					<tr>
						<td>${member.name}</td>
						<td>${member.phoneNumber}</td>
						<td> <%-- 등급 --%>
							<c:choose>
								<c:when test="${member.grade eq 'VIP'}">
									<span class="text-danger">${member.grade}</span>
								</c:when>
								<c:when test="${member.grade eq \"GOLD\"}">
									<span class="text-warning">${member.grade}</span>
								</c:when>
								<c:otherwise>
									${member.grade}
								</c:otherwise>
							</c:choose>
						</td>
						<td> <%-- 포인트 --%>
							<c:if test="${member.point >= 5000}">
								<span class="text-primary">${member.point}P</span>
							</c:if>
							<c:if test="${member.point < 5000}">
								${member.point}P
							</c:if>
						</td>
					</tr>
					</c:forEach> <%-- 반복문 끝 --%>
				</tbody>
			</table>
		</div>
	</div>
	<br><br>
</body>
</html>