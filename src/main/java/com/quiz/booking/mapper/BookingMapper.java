package com.quiz.booking.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.booking.domain.Booking;

@Repository
public interface BookingMapper {

	// 전체 테이블 조회
	public List<Booking> selectBookingList();
	
	// delete
	// input:id / output:int
	public int deleteBookingById(int id);
}
