package com.quiz.booking.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.booking.domain.Booking;
import com.quiz.booking.mapper.BookingMapper;

@Service
public class BookingBO {
	
	@Autowired
	private BookingMapper bookingMapper;

	// 전체 테이블 Select
	public List<Booking> getBookingList() {
		return bookingMapper.selectBookingList();
	}
	
	// delete
	// input:id / output:int
	public int deleteBookingById(int id) {
		return bookingMapper.deleteBookingById(id);
	}
	
	// insert
	// input: 여러가지 / output: int
	public int addBooking(
			String name, Date date, int day, 
			int headcount, String phoneNumber) {
		return bookingMapper.insertBooking(name, date, day, headcount, phoneNumber);
	}
	
	// select (name, phoneNumber)
	// input: name, phoneNumber / output: Booking(여러개가 들어오면 date가 가장 가까운(더 이전 날짜) 하나만 보내도록 가공)
	public Booking getNearestBookingByNamePhoneNumber(String name, String phoneNumber) {
		List<Booking> bookingList = bookingMapper.selectBookingListByNamePhoneNumber(name, phoneNumber);
//		Booking nearestBooking = bookingList.get(0);
//		for (int i = 1; i < bookingList.size(); i++) {
//			if (nearestBooking.getDate().after(bookingList.get(i).getDate())) {
//				// A.before(B) -> A가 B보다 이전이면 true
//				// A.after(B) -> A가 B보다 이후이면 true
//				nearestBooking = bookingList.get(i);
//			}
//		}
		
		// 없는 경우[] -> null 리턴
		
		// 있는 경우[1, 2, 3] -> 가장 마지막 index로 보내주면 된다.(날짜상, 저렇게 나온다는듯?)
		// size()-1 인덱스로 보내주면 된다.
		
		// 두 조건을 하나로 합친다.
		return bookingList.isEmpty() ? null : bookingList.get(bookingList.size() - 1);
		// List가 비어있는가? null : 마지막 booking;
	}
}
