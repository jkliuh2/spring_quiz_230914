package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.domain.RealEstate;
import com.quiz.lesson03.mapper.RealEstateMapper;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateMapper realEstateMapper;

	// 1.
	// input: id / output: RealEstate(있거나 혹은 NULL)
	public RealEstate getRealEstateById(int id) {
		return realEstateMapper.selectRealEstateById(id);
	}
	
	// 2.
	// input : rentPrice / output : List<>([] or 채워져있거나)
	public List<RealEstate> getRealEstateByRentPrice(int rentPrice) {
		// 여기서 input은 Controller에서 무조건 들어오게끔 되어 있으므로 int 타입
		
		return realEstateMapper.selectRealEstateByRentPrice(rentPrice);
	}
	
	// 3.
	// input: area, price / output: List<>([] or 채워져있거나)
	public List<RealEstate> getRealEstateAreaPrice(int area, int price) {
		return realEstateMapper.selectRealEstateAreaPrice(area, price);
	}
}
