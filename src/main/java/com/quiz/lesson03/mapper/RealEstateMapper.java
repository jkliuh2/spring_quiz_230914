package com.quiz.lesson03.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.domain.RealEstate;

@Repository
public interface RealEstateMapper {
	
	// 1.
	public RealEstate selectRealEstateById(int id);
	
	// 2.
	// input : rentPrice / output : List<>([] or 채워져있거나)
	public List<RealEstate> selectRealEstateByRentPrice(int rentPrice);
	
	// 3.
	// input: area, price / output: List<>([] or 채워져있거나)
	public List<RealEstate> selectRealEstateAreaPrice(int area, int price);
	
	int getAreaPrice(@Param("area") int area, @Param("price") int price);
}
