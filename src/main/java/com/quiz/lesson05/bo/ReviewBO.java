package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.domain.Review;
import com.quiz.lesson05.mapper.ReviewMapper;

@Service
public class ReviewBO {
	
	@Autowired
	private ReviewMapper reviewMapper;

	// storeId로 select
	// input: storeId / output: List<Review>
	public List<Review> getReviewByStoreId(int storeId) {
		return reviewMapper.selectReviewByStoreId(storeId);
	}
}
