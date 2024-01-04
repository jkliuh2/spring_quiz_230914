<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 이미지 배너 영역 --%>
<section class="banner">
	<img id="bannerImg" src="/img/test06_banner1.jpg" alt="통나무팬션이미지"
		width="1200px">
</section>
<%-- 아래의 3분할 영역 --%>
<section class="content1 d-flex">
	<%-- 3분할 중 왼쪽영역 --%>
	<aside class="aside-background d-flex justify-content-center align-items-center col-4">
		<h1 class="text-white">
			실시간<br> 예약 하기
		</h1>
	</aside>
	<%-- 3분할 중 가운데, 입력 및 버튼 영역 --%>
	<section class="input-info col-4">
	
		<div class="text-white mt-3">
        	<span class="reserve-confirm">예약 확인</span>
        </div>

		<!-- input 칸 -->
		<div id="inputBox" class="mr-3">
			<div class="d-flex align-items-center justify-content-end mt-3">
				<span class="text-white mr-3">이름:</span> 
				<input type="text" id="name" class="form-control col-9">
			</div>
			<div class="d-flex align-items-center justify-content-end mt-3">
				<span class="text-white mr-3">전화번호:</span> 
				<input type="text" id="phoneNumber" class="form-control col-9" placeholder="예) 000-1111-2222">
			</div>

			<!-- 예약 조회 버튼 -->
			<div class="d-flex justify-content-end mt-3">
				<button type="button" id="checkBtn" class="btn btn-success">조회하기</button>
			</div>
		</div>

	</section>
	<%-- 3분할 중 오른쪽 영역 --%>
	<aside class="aside-background d-flex justify-content-center align-items-center col-4">
		<h1 class="text-white">
			예약문의:<br>
			010-<br>
			0000-1111
		</h1>
	</aside>
</section>


	<!-- script -->
	<script>
		$(document).ready(function() {
							
			// setInterval
			// 배너 이미지 교체를 위한 함수 지정.
			let bannerImg = [ "/img/test06_banner1.jpg",
				"/img/test06_banner2.jpg",
				"/img/test06_banner3.jpg",
				"/img/test06_banner4.jpg" ];
							
			let imgIndex = 0;
			function changeImg() {
				imgIndex++;
								
				if (imgIndex > bannerImg.length - 1) {
					imgIndex = 0;
				}

				$("#bannerImg").attr("src", bannerImg[imgIndex]);
			};
			setInterval(changeImg, 3000); // 3000ms마다 changeImg를 실행.
			// 이미지 변경 파트 끝
			
			
			// 조회 버튼 클릭 이벤트
			$('#checkBtn').on('click', function() {
				
				// input 값들 가져오기
				let name = $('#name').val();
				let phoneNumber = $('#phoneNumber').val();
				
				// 유효성 검사
				// 이름 공란 검사
				if (!name) {
					alert("이름을 입력해주세요.");
					return;
				}
				// 전화번호 공란 검사
				if (phoneNumber == "") {
					alert("전화번호를 입력해주세요.");
					return;
				}
				
				// AJAX 통신 - 조건에 맞는 예약정보 조회
				$.ajax({
					// reuqest
					type:"GET"
					, url:"/booking/check-booking"
					, data:{"name":name, "phoneNumber":phoneNumber}
					
					// response
					, success:function(data) {
						// 성공. 예약내역 확인함 -> code:200
						if (data.code == 200) {
							alert("이름 : " + data.booking.name
									+ "\n날짜 : " + data.booking.date.substring(0, 10)
									+ "\n일수 : " + data.booking.day
									+ "\n인원 : " + data.booking.headcount
									+ "\n상태 : " + data.booking.state
									);
						} else if (data.code == 500) {
							// 예약내역 X -> code:500
							alert(data.message);
						}
						
					}
					, error:function(error) {
						alert("예약 조회 시스템에 문제가 생겼습니다. 관리자에게 문의해주세요.");
					}
					
				}); // AJAX 통신 끝
				
			}); // 조회 버튼 클릭 이벤트 끝
			
		}); // 레디이벤트 끝
	</script>