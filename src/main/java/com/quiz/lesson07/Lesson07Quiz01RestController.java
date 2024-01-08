package com.quiz.lesson07;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.bo.CompanyBO;
import com.quiz.lesson07.entity.CompanyEntity;

@RestController
@RequestMapping("/lesson07/quiz01")
public class Lesson07Quiz01RestController {
	
	@Autowired
	private CompanyBO companyBO;
	
	
	// 1. `company` 테이블 이용
	// 1-1 Create /save1
	// url: http://localhost:8080/lesson07/quiz01/save1
	@GetMapping("/save1")
	public CompanyEntity save1() {
//		회사명 : 넥손
//		사업내용 : 컨텐츠 게임
//		규모 : 대기업
//		사원수 : 3585명
		String name = "넥손";
		String business = "컨텐츠";
		String scale = "대기업";
		int headcount = 3585;
		
		return companyBO.addCompany(name, business, scale, headcount);
	}
	// 1-1. http://localhost:8080/lesson07/quiz01/save2
	@GetMapping("/save2")
	public CompanyEntity save2() {
//		회사명 : 버블팡
//		사업내용 : 여신 금융업
//		규모 : 대기업
//		사원수 : 6834명
		String name = "버블팡";
		String business = "여신 금융업";
		String scale = "대기업";
		int headcount = 6834;
		
		return companyBO.addCompany(name, business, scale, headcount);
	}
	
	
	// 1-2. Update
	// url: http://localhost:8080/lesson07/quiz01/update
	@GetMapping("/update")
	public CompanyEntity update() {
		// 변경 기업: 버블팡
		// 규모를 중소기업, 사원수를 34명 으로 수정 / 버블팡의 pk id번호로 업데이트
		// id = 8
//		int id = 8;
//		String scale = "중소기업";
//		int headcount = 34;
		
		return companyBO.updateCompanyScaleHeadcountById(8, "중소기업", 34);
	}
	
	
	// 1-3. Delete
	// url: http://localhost:8080/lesson07/quiz01/delete
	@GetMapping("/delete")
	public String delete() {
//		버블팡이 파산 -> 삭제 (id:8)
		companyBO.deleteCompanyById(8);
		
		return "삭제 완료";
	}
}
