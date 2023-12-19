package com.quiz.lesson03.bo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.domain.RealEstate;
import com.quiz.lesson03.mapper.RealEstateMapper;

@Service
public class RealEstateBO {
	
	@Autowired
	private RealEstateMapper realEstateMapper;

	// 1-1.
	// input: id / output: RealEstate(있거나 혹은 NULL)
	public RealEstate getRealEstateById(int id) {
		return realEstateMapper.selectRealEstateById(id);
	}
	
	// 1-2.
	// input : rentPrice / output : List<>([] or 채워져있거나)
	public List<RealEstate> getRealEstateByRentPrice(int rentPrice) {
		// 여기서 input은 Controller에서 무조건 들어오게끔 되어 있으므로 int 타입
		
		return realEstateMapper.selectRealEstateByRentPrice(rentPrice);
	}
	
	// 1-3.
	// input: area, price / output: List<>([] or 채워져있거나)
	public List<RealEstate> getRealEstateByAreaPrice(Map<String, Object> areaPrice) {
//			int area, int price
		return realEstateMapper.selectRealEstateByAreaPrice(areaPrice);
//				area, price
	}
	
	
	// 2-1.
	// input: RealEstate / output: int(성공 행 수)
	public int addRealEstate(RealEstate realEstate) {
		return realEstateMapper.insertRealEstate(realEstate);
	}
	
	// 2-2
	// input: 6가지 params / output: int
	public int addRealEstateAsField(
			int realtorId, String address, int area, 
			String type, int price, Integer rentPrice) {
		return realEstateMapper.insertRealEstateAsField(realtorId, address, area, type, price, rentPrice);
	}
	
	
	// 3.
	// input: id, price / output: int
	public int updateRealEstateById(int id, String type, int price) {
		return realEstateMapper.updateRealEstateById(id, type, price);
	}
}
