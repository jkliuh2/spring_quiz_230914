package com.quiz.lesson04.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.quiz.lesson04.domain.Realtor;

@Mapper
public interface RealtorMapper {

	// insert
	public void insertRealtor(Realtor realtor);
	
	// select
	public Realtor selectRealtorById(int id);
}
