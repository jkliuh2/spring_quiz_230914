<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 펜션</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

<!-- datepicker -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- 외부 스타일시트 -->
<link rel="stylesheet" type="text/css" href="/css/booking/quiz06_style.css">
</head>
<body>
	<div id="wrap" class="container p-0">
		<%-- 헤더. 로고영역 --%>
		<header class="d-flex justify-content-center align-items-center">
			<h1>통나무 팬션</h1>
		</header>
		<%-- 메뉴 영역 --%>
		<nav class="d-flex align-items-center">
			<jsp:include page="menu.jsp" />
		</nav>
		<%-- section 영역 --%>
		<section class="contents">
			<jsp:include page="section-checkBooking.jsp"></jsp:include>
		</section>
		<%-- footer 영역 --%>
		<footer class="d-flex align-items-center text-secondary">
			<small> 제주특별자치도 제주시 애월읍<br> 사업자등록번호: 111-222-255222 /
				농어촌민박사업자지정 / 대표:김동목<br> Copyright 2025 tongnamu All right
				reserved
			</small>
		</footer>
	</div>



	<!-- script -->
	<script>
		$(document).ready(function() {
							
			// 라디오 버튼 이벤트
			$("input[name=member]").on("change", function() {
				let radioValue = $(this).val();
				if (radioValue == "member") {
					$("#memberBox").removeClass("d-none");
					$("#nonMemberBox").addClass("d-none");
				} else if (radioValue == "nonMember") {
					$("#nonMemberBox").removeClass("d-none");
					$("#memberBox").addClass("d-none");
				}
			}); // 라디오 버튼 이벤트 끝

			
			// 유효성 검사. 조회하기
			$(".submit-btn").on("click", function() {
												
				// 라디오 체크된것의 value 가져오기.
				let radioValue = $("input:radio[name=member]:checked").val();
				// input들 중에 radio타입, name=member 애들중에 checked 인 놈.
												
				// 회원
				if (radioValue == "member") {
					let id = $("#id").val();
					let password = $("#password").val();

					if (id == "") {
						alert("아이디를 입력하십시오.");
						return;
					}
													
					if (password == "") {
						alert("비밀번호를 입력하십시오.");
						return;
					}

					alert(id + "님을 조회합니다.");

					// 비회원
				} else if (radioValue == "nonMember") {
					let name = $("#name").val();
					let phoneNumber = $("#phoneNumber").val();
					let reserveDate = $("#reserveDate").val();
													
					if (name == "") {
						alert("이름을 입력하십시오.");
						return;
					}
					if (phoneNumber == "") {
						alert("전화번호를 입력하십시오.");
						return;
					} else if (phoneNumber.startsWith("010") == false) {
						alert("010 으로 시작하는 번호만 입력 가능합니다.");
						return;
					}
					if (reserveDate == "") {
						alert("예약일자를 입력하십시오.");
						return;
					}

					alert("이름: " + name
							+ "\n전화번호: "
							+ phoneNumber
							+ "\n예약일자: "
							+ reserveDate
							+ "\n정보를 조회합니다.");
				}
											
			}); // 조회버튼 이벤트 끝

							
			// 날짜 datepicker
			$("#reserveDate").datepicker({
				minDate : 0 // 오늘날짜 이후로 선택
				,dateFormat : "yy년 mm월 dd일" // 입력되는 형태
			}); // datepicker 끝

							
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
		}); // 레디이벤트 끝
	</script>
</body>
</html>