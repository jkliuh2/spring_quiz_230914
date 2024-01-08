package com.quiz.lesson07.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.quiz.lesson07.entity.CompanyEntity;

public interface CompanyRepository extends JpaRepository<CompanyEntity, Integer> {
	// Spring data JPA
	// 어노테이션도 필요없음
	
	// 엔티티 객체 save(엔티티객체); 메소드가 숨어있다고 보면 됨.
	
	// delete(엔티티객체); 메소드도 있음
}
