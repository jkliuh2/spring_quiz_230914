package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@RequestMapping("/add-seller-view")
	public String addSellerView() {
		return "lesson04/addSeller";
	}
	
	// 1-2. insert + 입력 성공 jsp
	// url: http://localhost:8080/lesson04/quiz01/add-seller
	@PostMapping("/add-seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam("profileImageUrl") String profileImageUrl,
			@RequestParam("temperature") double temperature) {
		
		// DB insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		
		// jsp 연결
		return "lesson04/afterAddSeller";
	}
	
	
	// 2. seller 출력
	// 가장 최근에 추가된 seller 정보를 출력
	// url: http://localhost:8080/lesson04/quiz01/seller-info
	@RequestMapping("/seller-info")
	public String sellerInfo(Model model) {
		// DB select
		Seller seller = sellerBO.getLatestSeller();
		
		// Model 데이터 넣기
		model.addAttribute("result", seller);
		
		// jsp 연결
		return "lesson04/sellerInfo";
	}
}
