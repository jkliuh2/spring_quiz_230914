package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.domain.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {

	@Autowired
	private RealtorBO realtorBO;
	
	
	// 공인중개사 입력 view
	// url: http://localhost:8080/lesson04/quiz02/add-realtor-view
	@GetMapping("/add-realtor-view")
	public String addRealtorView() {
		return "/lesson04/addRealtor";
	}
	
	// 입력 -> insert -> 가입자 정보 select -> 출력
	@PostMapping("/add-realtor")
	public String addRealtor(
			@ModelAttribute Realtor realtor,
			Model model) {
		
		// insert
		realtorBO.addRealtor(realtor);
		
		
		// 입력한 정보 select
		realtor = realtorBO.getRealtorById(realtor);
		
		
		// model 입력
		model.addAttribute("realtor", realtor);
		
		
		// view 경로
		return "lesson04/afterAddRealtor";
	}
}
