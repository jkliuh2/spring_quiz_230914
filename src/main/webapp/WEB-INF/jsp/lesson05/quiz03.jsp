<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5강 quiz03 fmt 라이브러리</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<%-- 3-1 --%>
	<div class="container">
		<h1>1. 후보자 득표율</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>기호</th>
					<th>득표수</th>
					<th>득표율</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${candidates}" var="candidate" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><fmt:formatNumber value="${candidate}" type="number" /></td>
					<td><fmt:formatNumber value="${candidate / 1000000}" type="percent" /></td>
				</tr>
				</c:forEach> <%-- 반복문 끝 --%>
			</tbody>
		</table>
	</div>
	
	<%-- 3-2 --%>	
	<div class="container">
		<h1>2. 카드 명세서</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>사용처</th>
					<th>가격</th>
					<th>사용 날짜</th>
					<th>할부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${cardBills}" var="cardBill">
				<tr>
					<td>${cardBill.store}</td>
					<td><fmt:formatNumber value="${cardBill.pay}" type="currency" /> </td>
					<td> <%-- 사용 날짜 --%>
						<fmt:parseDate value="${cardBill.date}" pattern="yyyy-MM-dd" var="date" />
						<%-- String -> Date 변환해서 date 변수에 담기 --%>
						<fmt:formatDate value="${date}" pattern="yyyy년 MM월 dd일" />
						<%-- date에 담긴 Date -> String + (원하는 포맷) 으로 바꿔서 출력하기 --%>
					</td>
					<td>${cardBill.installment}</td>
				</tr>
				</c:forEach> <%-- 반복문 끝 --%>
			</tbody>
		</table>
	</div>
</body>
</html>