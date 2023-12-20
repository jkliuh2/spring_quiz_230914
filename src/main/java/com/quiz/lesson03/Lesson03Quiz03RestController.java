package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;

@RestController
public class Lesson03Quiz03RestController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	// url: http://localhost:8080/lesson03/quiz03/1?id=8&type=전세&price=70000
	@RequestMapping("/lesson03/quiz03/1")
	public String quiz03_1(
			@RequestParam(value = "id") int id,
			@RequestParam(value = "type") String type,
			@RequestParam(value = "price") int price) {
		int rowCount = realEstateBO.updateRealEstateById(id, type, price);
		// 이번엔 DTO에 담지 않고 그냥 넘긴다.
		
		return "수정 성공: " + rowCount;
	}
}
