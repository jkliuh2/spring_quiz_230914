package com.quiz.booking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.booking.bo.BookingBO;
import com.quiz.booking.domain.Booking;

@RequestMapping("/booking")
@Controller
public class BookingController {
	// 6강 퀴즈03
	// `booking` 테이블 이용
	
	@Autowired
	private BookingBO bookingBO;

	
	// 3-1. 예약 목록 보기 
	// url: http://localhost:8080/booking/booking-list-view
	@GetMapping("/booking-list-view")
	public String bookingListView(Model model) {
		
		// DB Select - 모든 테이블
		List<Booking> bookingList = bookingBO.getBookingList();
		
		// model에 정보 담기
		model.addAttribute("bookingList", bookingList);
		
		// jsp로 이동
		return "booking/bookingList";
	}
	
	
	// 3-2. 예약하기 페이지
	
	
	// 3-3. 예약 조회 기능
	// url : http://localhost:8080/booking/checkBooking
	@GetMapping("/checkBooking")
	public String checkBooking() {
		return "booking/checkBooking";
	}
}
