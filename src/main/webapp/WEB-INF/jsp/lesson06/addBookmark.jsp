<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가하기</title>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<%-- AJAX를 사용하려면 jquery 원본 필요(slim 쓰면 안된다.) --%>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>	
		<div class="form-group">
			<div class="m-2">제목</div>
			<input type="text" id="name" class="form-control m-2">
			<div class="m-2">주소</div>
			<div class="form-inline">
				<input type="text" id="url" class="form-control m-2 col-10">
				<%-- 중복확인 버튼 --%>
				<button type="button" id="urlCheckBtn" class="btn btn-info form-control col-1">중복확인</button>
			</div>
			<smail id="urlStatusArea" class="text-danger d-none">
				<%-- 중복확인 버튼 경고문. 기본으로 숨겨놓는다. --%>
				중복된 url입니다.
			</smail>
			<smail id="availableUrl" class="text-success d-none">
				<%-- 저장 가능하면 뜨는 문구. --%>
				저장 가능한 url입니다.
			</smail>
			
			<%-- 사이트 추가 버튼 --%>
			<button id="addBtn" type="button" class="btn btn-success form-control">추가</button>
		</div>
	</div>
	
<script>
	//레디 이벤트
	$(document).ready(function() { 
		
		// 중복확인 버튼 클릭 이벤트
		$('#urlCheckBtn').on('click', function() {
			
			let url = $('#url').val().trim(); // url 값 변수화. trim() 함수 잊지 말자.
			
			// url 비어있을 때
			if (url == "") {
				alert("url이 비어있습니다/");
				return;
			}
			
			// 여기까지 내려왔으면 일단 url은 채워져있다
			
			// AJAX 통신 - 중복확인
			$.ajax({
				// request
				type:"POST" // url같이 긴 데이터의 경우, POST로 보내자
				, url:"/lesson06/is-duplication-url"
				, data:{"url":url}
				
				// response
				, success:function(data) { // data: JSON -> dictionary
					// 성공시: {"code":200, "is_duplication":true/false}
					// true -> 중복
					if (data.is_duplication) {
						// 중복이다.
						$('#urlStatusArea').removeClass("d-none"); // 중복문구의 class 제거(d-none)
						$('#availableUrl').addClass("d-none"); // 저장가능 문구 class 추가(d-none)
					} else {
						// 중복 아니다. => 사용 가능
						$('#availableUrl').removeClass("d-none"); // 위와 정 반대.
						$('#urlStatusArea').addClass("d-none"); 
					}
				}
				, error:function(request, status, error) { // 중복 확인에 실패했을 때.
					alert("중복확인에 실패했습니다.");
				}
				
			}); // 중복확인 ajax 끝
		}); // 중복확인 버튼 클릭 끝
		
		
		
		// 추가. 버튼 클릭 이벤트
		$("#addBtn").on('click', function() {
			//alert("클릭");
			
			// 유효성 체크
			let name = $("#name").val();
			if (name == "") { // 제목 공란 체크
				alert("제목을 입력하세요.");
				return;
			}
			let url = $("#url").val();
			if (url.length < 1) { // url 공란 체크
				alert("url을 입력하세요.");
				return;
			}
			// http:// 혹은 https:// 로 시작되지 않는 경우 -> 둘 다 false (and)
			if (url.startsWith("http://") == false && url.startsWith("https://") == false) {
				alert("url 주소는 http:// 혹은 https:// 로 시작되어야 합니다.");
				return;
			}
			
			// ajax
			$.ajax({
				// request
				type:"POST"
				, url: "/lesson06/add-bookmark" // insert 컨트롤러 주소
				, data:{"name":name, "url":url} // 보내는 정보들 JSON타입으로
				
				// response(call back)
				, success:function(data) { // 이제 이 data는 JSON String이다
					/*if (data == "성공") {
						location.href="/lesson06/quiz01/bookmark-list-view"
					}*/
					
					// 이제 data는 JSON String으로 내려왔다.
					// 그런데, jQuery의 AJAX 함수가 parsing을 해준다(JSON String -> dictionary)
					// 따라서 dictionary 형태로 바로 사용 가능.
					// alert(data.code);
					if (data.code == 200) { // data의 code로 성공조건을 건다.
						location.href="/lesson06/bookmark-list-view"
					}
				}
				, error:function(request, status, error) {
					/*alert(request);
					alert(status);    // 에러가 난 상황을 알기 위한 것들.
					alert(error);*/
					alert("추가하는데 실패했습니다. 관리자에게 문의해주세요."); // 에러가 났을 때, 사용자에게 보이는 알림
				}
				
			}); // 추가-ajax 끝
		}); // 추가-버튼 클릭 이벤트 끝
	}); // 레디이벤트 끝
</script>
</body>
</html>