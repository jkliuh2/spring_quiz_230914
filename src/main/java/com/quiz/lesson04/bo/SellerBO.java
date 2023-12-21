package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.domain.Seller;
import com.quiz.lesson04.mapper.SellerMapper;

@Service
public class SellerBO {

	@Autowired
	private SellerMapper sellerMapper;
	
	// 1번 1-2 insert
	// input: 파라미터들 / output: X
	public void addSeller(String nickname, 
			String profileImageUrl, double temperature) {
		sellerMapper.insertSeller(nickname, profileImageUrl, temperature);
	}
	
	// 2번 최근 seller select
	public Seller getLatestSeller() {
		return sellerMapper.selectLatestSeller();
	}
	
	// 3번 id로 select
	public Seller getSellerById(Integer id) {
		return sellerMapper.selectSellerById(id);
	}
}
