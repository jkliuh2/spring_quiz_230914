package com.quiz.booking.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.booking.domain.Booking;

@Repository
public interface BookingMapper {

	// 전체 테이블 조회
	public List<Booking> selectBookingList();
	
	// delete
	// input:id / output:int
	public int deleteBookingById(int id);
	
	// insert
	// input: 여러가지 / output: int
	public int insertBooking(
			@Param("name") String name, 
			@Param("date") Date date, 
			@Param("day") int day, 
			@Param("headcount") int headcount, 
			@Param("phoneNumber") String phoneNumber 
			);
	
	// select (name, phoneNumber)
	// input: name, phoneNumber / output: List
	public List<Booking> selectBookingListByNamePhoneNumber(
			@Param("name") String name, 
			@Param("phoneNumber") String phoneNumber);
}
