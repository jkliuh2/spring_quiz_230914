<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<%-- AJAX를 사용하려면 jquery 원본 필요(slim 쓰면 안된다.) --%>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 목록</h1>
		<table class="table">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${bookmarkList}" var="bookmark" varStatus="status">
				<tr>
					<td class="font-weight-bold">${status.count}</td>
					<td>${bookmark.name}</td>
					<td class="font-weight-bold"><a href="${bookmark.url}" target="blank">${bookmark.url}</a></td>
					<td>
						<button id="deleteBtn-${bookmark.id}" type="button" class="deleteBtn btn btn-danger">삭제</button>
					</td>
				</tr>
				</c:forEach> <%-- 반복문 끝 --%>
			</tbody>
		</table>
	</div>	
	
<script>
	$(document).ready(function() {
		
		// 삭제 버튼 클릭 이벤트
		$('.deleteBtn').on('click', function() {
			//alert("삭제버튼");
			
			// 클릭된 삭제버튼의 값 가져오기
			//let idstr = $(this).attr("id"); // deleteBtn-id
			//alert(idstr);
			//let id = idstr.split("-")[1];
			let id = $(this).attr("id").split("-")[1]; // id값
			//alert(id);
			
			// AJAX 통신 - 데이터 삭제 후 화면 새로고침
			$.ajax({
				// request
				type:"POST"
				, url:"/lesson06/delete-bookmark-by-id"
				, data:{"id":id}
			
				// response
				, success:function(data) {
					// 성공시 "code":200
					if (data.code == 200) {
						//alert("성공");
						location.href="/lesson06/bookmark-list-view"
					}
				}
				, error(request, status, error) {
					alert("데이터 삭제에 실패했습니다. 관리자에게 문의해주세요.");
				}
			}); // ajax 끝
			
		}); // 삭제 버튼 클릭 이벤트 끝
	}); // 레디이벤트 끝
</script>
	
</body>
</html>