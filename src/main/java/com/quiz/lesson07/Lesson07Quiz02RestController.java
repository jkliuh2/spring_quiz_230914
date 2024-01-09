package com.quiz.lesson07;

import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson07.entity.RecruitEntity;
import com.quiz.lesson07.repository.RecruitRepository;

@RequestMapping("/lesson07/quiz02")
@RestController
public class Lesson07Quiz02RestController {
	// recruit 테이블 이용
	// BO 생략
	
	@Autowired
	private RecruitRepository recruitRepository;

	// url: http://localhost:8080/lesson07/quiz02
	
	// 2-1. id로 조회(id:8)
	@GetMapping("/1")
	public RecruitEntity select1() {
		return recruitRepository.findById(8).orElse(null);
		// null 대신 비어있는 엔티티로 리턴하려면 new 엔티티() 해주면 된다.
	}
	
	// 2-2. Parameter 조건 조회
	// Request로 전달받은 companyId로 해당 회사 조회
	@GetMapping("/2")
	public List<RecruitEntity> select2(
			@RequestParam("companyId") int companyId) {
		return recruitRepository.findByCompanyId(companyId);
	}
	
	// 2-3. 복합 조건 조회
	// position:웹 back-end 개발자, type:정규직
	@GetMapping("/3")
	public List<RecruitEntity> select3() {
		return recruitRepository.findByPositionAndType(
				"웹 back-end 개발자", "정규직");
	}
	
	// 2-4. 복합 조건 조회2
	// type:정규직 or salary >= 9000
	@GetMapping("/4")
	public List<RecruitEntity> select4() {
		return recruitRepository.findByTypeOrSalaryGreaterThanEqual(
				"정규직", 9000);
	}
	
	// 2-5. 정렬 제한 조건
	// type:계약직, 연봉기준 내림차순, limit 3
	@GetMapping("/5")
	public List<RecruitEntity> select5() {
		return recruitRepository.findTop3ByTypeOrderBySalaryDesc("계약직");
	}
	
	// 2-6. 범위 조회
	// region=성남시 분당구, salary:(7000<= <= 8000)
	@GetMapping("/6")
	public List<RecruitEntity> select6() {
		return recruitRepository.findByRegionAndSalaryBetween(
				"성남시 분당구", 7000, 8000);
	}
	
	// 2-7. Native Query
	// 마감일이 2026-04-10 이후이고 연봉이 8100 이상인 정규직 공고를 연봉 내림차순
	@GetMapping("/7")
	public List<RecruitEntity> select7() {
//		return recruitRepository.findByDeadlineAfterAndSalaryGreaterThanEqaulAndTypeOrderBySalaryDesc("2026-04-10", 8100, "정규직");
		return recruitRepository.findNativeQuery("2026-04-10", 8100, "정규직");
	}
}
