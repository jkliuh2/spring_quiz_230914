package com.quiz.lesson04.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson04.domain.Seller;

@Repository
public interface SellerMapper {

	// 1번 1-2. insert
	// input: 파라미터들 / output: int
	public int insertSeller(
			@Param("nickname") String nickname, 
			@Param("profileImageUrl") String profileImageUrl, 
			@Param("temperature") double temperature);
	
	// 2번 최근 seller select
	public Seller selectLatestSeller();
	
	// 3번 id select
	public Seller selectSellerById(Integer id);
}
