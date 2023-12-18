package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.domain.RealEstate;

@RestController
@RequestMapping("/lesson03/quiz01/")
public class Lesson03Quiz01RestController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	// 1. id 받아서 해당 id 매물 출력
	// url: http://localhost:8080/lesson03/quiz01/1?id=20
	@RequestMapping("1")
	public RealEstate quiz01_1( // 데이터 단 한개
			@RequestParam(value = "id") int id) { // NULL 비 허용
		return realEstateBO.getRealEstateById(id);
	}
	
	// 2. 월세를 param으로 받고 월세보다 낮은 매물 출력
	// url: http://localhost:8080/lesson03/quiz01/2?rent_price=90
	@RequestMapping("2")
	public List<RealEstate> quiz01_2( // 데이터 여러개 -> List
			@RequestParam(value = "rent_price", required = true) Integer rentPrice) {
		// rentPrice는 Integer 타입.
		// 단, requestParam은 NULL 비허용으로 받을 것이라서 required = true
		
		return realEstateBO.getRealEstateByRentPrice(rentPrice);
	}
	
	// 3. param = 넓이(area), 가격(price) -> 넓이 이상, 가격 이하 조건 출력
	// url: http://localhost:8080/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("3")
	public List<RealEstate> quiz01_3(
		@RequestParam(value = "area") int area,
		@RequestParam(value = "price") int price) {
		return realEstateBO.getRealEstateAreaPrice(area, price);
	}
}
