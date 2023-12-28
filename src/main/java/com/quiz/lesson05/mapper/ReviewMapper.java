package com.quiz.lesson05.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson05.domain.Review;

@Repository
public interface ReviewMapper {

	// storeId로 select
	// input:storeId / output:List<Review>
	public List<Review> selectReviewByStoreId(int storeId);
}
