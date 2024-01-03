<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 이미지 배너 영역 --%>
<section class="banner">
	<img id="bannerImg" src="/img/test06_banner1.jpg" alt="통나무팬션이미지"
		width="1200px">
</section>
<section class="content1 d-flex">
	<aside
		class="aside-background d-flex justify-content-center align-items-center col-4">
		<h1 class="text-white">
			실시간<br> 예약 하기
		</h1>
	</aside>
	<section class="input-info col-4">
		<!-- 예약 확인 라디오 버튼 -->
		<div class="text-white mt-3">
			<span class="reserve-confirm">예약 확인</span> <label class="ml-3">
				<span>회원</span> <input type="radio" name="member" value="member"
				checked>
			</label> <label class="ml-3"> <span>비회원</span> <input type="radio"
				name="member" value="nonMember">
			</label>
		</div>

		<!-- 아이디 비밀번호 (회원) -->
		<div id="memberBox" class="mr-3">
			<div class="d-flex align-items-center justify-content-end mt-3">
				<span class="text-white mr-3">아이디:</span> <input type="text" id="id"
					class="form-control col-9">
			</div>
			<div class="d-flex align-items-center justify-content-end mt-3">
				<span class="text-white mr-3">비밀번호:</span> <input type="password"
					id="password" class="form-control col-9">
			</div>

			<!-- 버튼 -->
			<div class="d-flex justify-content-end mt-3">
				<button type="button" class="submit-btn btn btn-success">조회하기</button>
			</div>
		</div>


		<!-- 비회원 -->
		<div id="nonMemberBox" class="mr-3 d-none">
			<div class="d-flex align-items-center justify-content-end mt-2">
				<span class="text-white mr-3">이름:</span> <input type="text"
					id="name" class="form-control col-9">
			</div>
			<div class="d-flex align-items-center justify-content-end mt-2">
				<span class="text-white mr-3">전화번호:</span> <input type="text"
					id="phoneNumber" class="form-control col-9">
			</div>
			<div class="d-flex align-items-center justify-content-end mt-2">
				<span class="text-white mr-3">날짜:</span> <input type="text"
					id="reserveDate" class="form-control col-9">
			</div>
			<!-- 버튼 -->
			<div class="d-flex justify-content-end mt-2">
				<button type="button" class="submit-btn btn btn-success">조회하기</button>
			</div>
		</div>
	</section>
	<aside
		class="aside-background d-flex justify-content-center align-items-center col-4">
		<h1 class="text-white"></h1>
	</aside>
</section>