package com.quiz.lesson03.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.domain.RealEstate;

@Repository
public interface RealEstateMapper {
	
	// 1-1.
	public RealEstate selectRealEstateById(int id);
	
	// 1-2.
	// input : rentPrice / output : List<>([] or 채워져있거나)
	public List<RealEstate> selectRealEstateByRentPrice(int rentPrice);
	
	// 1-3.
	// input: area, price / output: List<>([] or 채워져있거나)
	public List<RealEstate> selectRealEstateByAreaPrice(
//			@Param("area") int area,
//			@Param("price") int price);
			// 이게 최근 방식이긴 함
			// xml로 단 한개의 파라미터만 보낼 수 있다. -> 이 때, @Param을 사용. 여러 개의 파라미터를 map에 담아 보낸다.
			
			Map<String, Object> areaPrice);
	
	
	// 2-1.
	// input: RealEstate / output: int(성공 행 수)
	public int insertRealEstate(RealEstate realEstate); 
		
	
	// 2-2.
	public int insertRealEstateAsField(
		@Param("realtorId") int realtorId, 
		@Param("address") String address, 
		@Param("area") int area, 
		@Param("type") String type, 
		@Param("price") int price, 
		@Param("rentPrice") Integer rentPrice);
}
