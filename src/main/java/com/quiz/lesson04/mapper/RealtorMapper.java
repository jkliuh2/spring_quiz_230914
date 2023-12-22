package com.quiz.lesson04.mapper;

import org.springframework.stereotype.Repository;

import com.quiz.lesson04.domain.Realtor;

@Repository
public interface RealtorMapper {

	// insert
	public void insertRealtor(Realtor realtor);
	
	// select
	public Realtor selectRealtorById(int id);
}
