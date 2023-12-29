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
			<input type="text" id="url" class="form-control m-2">
			<button id="addBtn" type="button" class="btn btn-success form-control">추가</button>
		</div>
	</div>
	
<script>
	$(document).ready(function() {
		
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
			if (url.startsWith("http://") == false && url.startsWith("https://") == false) {
				alert("url 주소는 http:// 혹은 https:// 로 시작되어야 합니다.");
				return;
			}
			
			// ajax
			$.ajax({
				// request
				type:"POST"
				, url: "/lesson06/quiz01/add-bookmark"
				, data:{"name":name, "url":url}
				
				// response
				, success:function(data) {
					//alert(data); // 성공
					if (data == "성공") {
						location.href="/lesson06/quiz01/after-bookmark-view"
					}				
				}
				, error:function(request, status, error) {
					alert(request);
					alert(status);
					alert(error);
				}
				
			});
			
		}); // 버튼 클릭 이벤트 끝
	}); // 레디이벤트 끝
</script>
</body>
</html>