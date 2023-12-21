<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 확인</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>공인중개사 정보</h1>
		<table class="table">
			<tr>
				<th>ID</th>
				<td>${realtor.id}</td>
			</tr>
			<tr>
				<th>상호명</th>
				<td>${realtor.office}</td>
			</tr>
			<tr>
				<th>전화 번호</th>
				<td>${realtor.phoneNumber}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${realtor.address}</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>${realtor.grade}</td>
			</tr>
		</table>
	</div>
</body>
</html>