<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="d-flex justify-content-center align-items-center my-3">
	<h1>예약하기</h1>
</div>
<div class="d-flex justify-content-center">
	<div class="col-6 font-weight-bold">
		<label>이름</label>
		<input type="text" id="name" class="form-control mb-3">
		<label>예약날짜</label>
		<input type="text" id="date" class="form-control mb-3">
		<label>숙박일수</label>
		<input type="number" id="day" class="form-control mb-3">
		<label>숙박인원</label>
		<input type="number" id="headcount" class="form-control mb-3">
		<label>전화번호</label>
		<input type="text" id="phoneNumber" class="form-control mb-3" placeholder="예) 010-1234-5678">
		<%-- 예약 상태는 입력X. --%>
		
		<button type="button" id="bookingBtn" class="btn btn-warning form-control">예약하기</button>
	</div>
</div>

<%-- JS --%>
<script>
	$(document).ready(function() {
		
		// datepicker
		$('#date').datepicker({
			dateFormat:"yy-mm-dd"
		});
		
		// 예약하기 버튼 이벤트
		$('#bookingBtn').on('click', function() {
			
			// input 값들 가져오기
			let name = $('#name').val();
			let date = $('#date').val();
			let day = $('#day').val();
			let headcount = $('#headcount').val();
			let phoneNumber = $('#phoneNumber').val();
			
			// 유효성검사
			// 이름 공란 검사
			if (!name) {
				alert("이름을 입력하세요.");
				return;
			}
			// 예약날짜 공란 검사
			if (date == "") {
				alert("예약 날짜를 선택하세요.");
				return;
			}
			// 숙박일수 공란 검사
			if (day == "") {
				alert("숙박일수를 입력하세요.");
				return;
			}
			// 숙박인원 공란 검사
			if (headcount == "") {
				alert("숙박인원을 입력하세요.");
				return;
			}
			// 전화번호 공란 검사
			if (!phoneNumber) {
				alert("전화번호를 입력하세요.");
			}
			/* // 유효한 전화번호 검사
			let phoneNumberList = phoneNumber.split("-");
			if (phoneNumberList.length != 3 
					|| phoneNumberList[1].length > 4
					|| phoneNumberList[1].length < 3
					|| phoneNumberList[2].length !=4) {
				alert("유효한 전화번호가 아닙니다. 다시 입력해주세요.");
			} else if (phoneNumberList[0] != '010') {
				alert("휴대전화의 전화번호는 010으로 시작해야 합니다.");
			} */
			
			// 입력하지 않은 예약상태(state)는 대기중. 으로 한다.
			let state = "대기중";
			
			// AJAX 통신 - INSERT
			$.ajax({
				// request
				type:"POST"
				, url:"/booking/add-booking"
				, data:{
					"name":name
					, "date":date
					, "day":day
					, "headcount":headcount
					, "phoneNumber":phoneNumber
					, "state":state}
				
				// response
				, success:function(data) {
					// 성공:200, 실패:500
					if (data.code == 200) {
						alert(data.result + ": 예약에 성공했습니다.");
						location.reload(); // 새로고침
					} else if (data.code == 500) {
						alert(data.error_message);
					}
				}
				, error:function(error) {
					alert("예약에 실패했습니다. 관리자에게 문의해주세요.");
				}
				
			}); // ajax 통신 끝
		}); // 버튼 클릭 끝
	}); // 레디이벤트 끝
</script>