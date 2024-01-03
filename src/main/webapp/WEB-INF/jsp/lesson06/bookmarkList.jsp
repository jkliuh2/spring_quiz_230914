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
						<button type="button" data-bookmark-id="${bookmark.id}" class="del-btn btn btn-danger">삭제</button>
					</td>
				</tr>
				</c:forEach> <%-- 반복문 끝 --%>
			</tbody>
		</table>
	</div>	
	
<script>
	$(document).ready(function() {
		
		// 삭제 버튼 클릭 이벤트
		$('.del-btn').on('click', function() {
			//alert("삭제버튼");
			
			// 클릭된 삭제버튼의 값 가져오기
			// 1) value값 or id로 지정해서 그 해당 값 가져오기
			// 태그: value="${id}"
			/* let id = $(this).val();
			let id = $(this).attr("value");
			let id = e.target.value; */
			// 위 세가지 모두 같은 경우
			
			// data를 이용해서 값 가져오기
			// 태그영역: data-bookmark-id
			// 스크립트 영역: .data('bookmark-id');
			let id = $(this).data('bookmark-id');
			
			// AJAX 통신 - 데이터 삭제 후 화면 새로고침
			$.ajax({
				// request
				type:"DELETE" // 삭제 전용 요청 방식. AJAX만 가능
				, url:"/lesson06/delete-bookmark"
				, data:{"id":id}
			
				// response
				, success:function(data) {
					// 성공시 "code":200, "result":성공
					// 실패시(rowCount=0) "code":500, "error_message":삭제에 실패~~
					if (data.code == 200) {
						// location.href="/lesson06/bookmark-list-view" // 완전한 새로고침.
						location.reload(); // 간단한 새로고침
					} else if (data.code == 500) {
						alert(data.error_message); // 이게 나온다는 건, 로직상 오류났다는 것. 시스템상 문제는 없음
					}
				}
				, error:function(error) { // 귀찮으면 error로 퉁치면 됨
					alert("삭제하는데 실패했습니다. 관리자에게 문의해주세요.");
				}
			}); // ajax 끝
			
		}); // 삭제 버튼 클릭 이벤트 끝
	}); // 레디이벤트 끝
</script>
	
</body>
</html>