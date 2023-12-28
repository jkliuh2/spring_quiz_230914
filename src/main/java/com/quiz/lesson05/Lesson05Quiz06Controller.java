package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.domain.Store;

@RequestMapping("/lesson05/quiz06")
@Controller
public class Lesson05Quiz06Controller {
	
	@Autowired
	private StoreBO storeBO;

	// 6-1 store 테이블로 view 페이지 만들기
	// lesson02에서 만든 클래스 활용
	// url: http://localhost:8080/lesson05/quiz06/store-list-view
	@GetMapping("/store-list-view")
	public String storeListView(Model model) {
		
		// DB(store) select(전체)
		List<Store> storeList = storeBO.getStoreList();
		
		// model에 정보 넣기
		model.addAttribute("storeList", storeList);
		
		// jsp view path
		return "lesson05/quiz06/storeList";
	}
	
	
	// 6-2 위에서 가게이름을 눌렀을 때 해당 가게 리뷰들의 리스트 띄우는 페이지
	// review 클래스는 없어서, lesson05에 새롭게 만들자.
	@GetMapping("/reviews")
	public String reviews(
			@RequestParam("storeId") int storeId,
			@RequestParam("storeName") String storeName) {
		return "lesson05/quiz06/reviews";
	}
}
