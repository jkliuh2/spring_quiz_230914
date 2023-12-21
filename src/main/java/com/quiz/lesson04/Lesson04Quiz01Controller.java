package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.domain.Seller;

@Controller
@RequestMapping("/lesson04/quiz01")
public class Lesson04Quiz01Controller {

	@Autowired
	private SellerBO sellerBO;
	
	
	// 1.seller 추가
	// 1-1. view jsp
	// url: http://localhost:8080/lesson04/quiz01/add-seller-view
	@GetMapping("/add-seller-view")
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	// 1-2. insert + 입력 성공 jsp
	// url: http://localhost:8080/lesson04/quiz01/add-seller
	@PostMapping("/add-seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value = "profileImageUrl", required = false) String profileImageUrl,
			@RequestParam(value = "temperature", defaultValue = "36.5") double temperature) {
		// 프로필 이미지: Null 허용(DB에서도.)
		// 온도: Null 허용(생략) + 기본값 36.5(DB 설정) => Null로 받으면 DB에서 저장할 때, 알아서 36.5로 들어간다.
		// => 기본값 여기서 설정 안하면 NPE 발생. 따라서 defaultValue 설정했다.
		
		// DB insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		// jsp 연결
		return "lesson04/afterAddSeller";
	}
	
	
	// 2. seller 출력
	// 가장 최근에 추가된 seller 정보를 출력
	// url: http://localhost:8080/lesson04/quiz01/seller-info-view
	// url: http://localhost:8080/lesson04/quiz01/seller-info-view?id=3 / 3번 문제
	@GetMapping("/seller-info-view")
	public String sellerInfoView(
			@RequestParam(value = "id", required = false) Integer id, // 3번 문제를 위한 RequestParam
			// id는 2번처럼 NULL로 들어올 수도 있어서 NULL 허용 + Integer, 기본값은 세팅X
			Model model) {
		
		Seller seller = null; // if 문 밖에서도 사용할 수 있도록 if문 외부에서 선언
		
		// id NULL 여부 확인(3번 문제)
		if (id == null) { // id == null -> 가장 최근 정보 select
			// DB select
			seller = sellerBO.getLatestSeller();
			
		} else { // id != null -> id 해당 정보 select(2번과는 다른 메소드 실행)
			// DB select
			seller = sellerBO.getSellerById(id);
		}
		
		// Model 데이터 넣기
		model.addAttribute("result", seller);
		model.addAttribute("title", "판매자 정보");
		
		// jsp로 response
		return "lesson04/sellerInfo";
	}
	
	
	// 3. id가 파라미터로 넘어오면 해당 id select해서 출력하기
	// 2. 의 메소드들 재활용하기.
	// +) RequestParam으로 id를 받기(NULL 허용)
	// +) id의 NULL 여부에 따라 다른 select 메소드 실행하도록 변경.
}
