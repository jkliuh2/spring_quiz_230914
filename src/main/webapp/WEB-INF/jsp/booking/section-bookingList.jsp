<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="d-flex justify-content-center align-items-center my-3">
    <h1>예약 목록 보기</h1>
</div>
<table class="table text-center">
	<thead>
		<tr>
			<th>이름</th>
			<th>예약날짜</th>
			<th>숙박일수</th>
			<th>숙박인원</th>
			<th>전화번호</th>
			<th>예약상태</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${bookingList}" var="booking">
			<tr>
				<td>${booking.name}</td>
				<td> <%-- 예약날짜. Date -> yyyy년 MM월 dd일 --%>
					<fmt:formatDate value="${booking.date}" 
					pattern="yyyy년 MM월 dd일" />
				</td>
				<td>${booking.day}</td>
				<td>${booking.headcount}</td>
				<td>${booking.phoneNumber}</td>
				<td> <%-- 예약상태. 대기중-info, 확정-success --%>
					<c:choose>
						<c:when test="${booking.state eq '대기중'}">
							<span class="text-info">${booking.state}</span>
						</c:when>
						<c:when test="${booking.state eq '확정'}">
							<span class="text-success">${booking.state}</span>
						</c:when>
						<c:when test="${booking.state eq '취소'}">
							<span class="text-danger">${booking.state}</span>
						</c:when>
					</c:choose>
				</td>
				<td> <%-- 삭제 버튼 --%>
					<button class="del-btn btn btn-danger" data-booking-id="${booking.id}">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<%-- 삭제버튼에 대한 AJAX 통신 --%>
<script>
	$(document).ready(function() {
		
		// 삭제 버튼 클릭 이벤트
		$('.del-btn').on('click', function() {
			//alert("삭제 버튼 클릭");
			
			// 버튼에 맞는 id값 가져오기
			let id = $(this).data('booking-id');
			//alert(id);
			
			// 삭제 AJAX통신
			$.ajax({
				// request
				type:"DELETE"
				, url:"/booking/delete-booking"
				, data:{"id":id}
				
				// response
				, success:function(data) {
					// 성공시-code:200
					if (data.code == 200) {
						alert(data.result_message);
						location.reload();
					} else if (data.code == 500) {
						// 실패시-code:500
						alert(data.error_message)
					}
				}
				, error:function(error) {
					alert("삭제에 실패했습니다. 관리자에게 문의해주세요.");
				}
				
			}); // AJAX 통신 끝
		}); // 삭제 버튼 클릭 이벤트 끝
	}); // 레디이벤트 끝
</script>
    