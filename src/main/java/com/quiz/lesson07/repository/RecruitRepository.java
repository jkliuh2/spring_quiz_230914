package com.quiz.lesson07.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.quiz.lesson07.entity.RecruitEntity;

public interface RecruitRepository extends JpaRepository<RecruitEntity, Integer> {

	public List<RecruitEntity> findByCompanyId(int companyId); // 2-2
	public List<RecruitEntity> findByPositionAndType(String position, String type); // 2-3
	public List<RecruitEntity> findByTypeOrSalaryGreaterThanEqual(String type, int salary); // 2-4
	public List<RecruitEntity> findTop3ByTypeOrderBySalaryDesc(String Type); // 2-5
	public List<RecruitEntity> findByRegionAndSalaryBetween(String region, int minSalary, int maxSalary); // 2-6
	
	@Query(value = "select * from recruit " // 줄 바꾸기 전에 띄어쓰기를 한 칸씩 넣어줘야 오류 안난다.
			+ "where deadline > :deadline "
			+ "and salary >= :salary "
			+ "and type = :type "
			+ "order by salary DESC"
			, nativeQuery = true)
	public List<RecruitEntity> findNativeQuery(
			@Param("deadline") String deadline, 
			@Param("salary") int salary, 
			@Param("type") String type);
}
