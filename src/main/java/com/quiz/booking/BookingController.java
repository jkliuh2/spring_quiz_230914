package com.quiz.booking;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	// 3-1. 예약 삭제 - AJAX통신(DELETE)
	// url: /delete-booking
	@ResponseBody
	@DeleteMapping("/delete-booking")
	public Map<String, Object> deleteBooking(
			@RequestParam("id") int id) {
		
		// DB delete / 실패:0, 성공:1이상
		int rowCount = bookingBO.deleteBookingById(id);
		
		// call back할 Map 만들기
		Map<String, Object> result = new HashMap<>();
		if (rowCount > 0) {
			result.put("code", 200);
			result.put("result_message", "예약이 성공적으로 취소되었습니다.");
		} else {
			result.put("code", 500);
			result.put("error_message", "삭제에 실패했습니다");
		}
		
		// return
		return result;
	}
	
	
	// 3-2. 예약하기 페이지
	// url: http://localhost:8080/booking/make-booking-view
	@GetMapping("/make-booking-view")
	public String makeBookingView() {
		return "booking/makeBooking";
	}
	
	// 3-2. AJAX통신 - 데이터 Insert
	// url: /add-booking
	@ResponseBody
	@PostMapping("/add-booking")
	public Map<String, Object> addBooking(
			@RequestParam("name") String name,
			@RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") Date date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber
			) {
		
		// DB Insert / 성공:1, 실패:0
		int rowCount = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		// data Map 만들기
		Map<String, Object> result = new HashMap<>();
		if (rowCount > 0) { // 성공시
			result.put("code", 200);
			result.put("result", "성공");
		} else { // 실패시
			result.put("code", 500);
			result.put("error_message", "예약에 실패했습니다.");
		}
		
		// data 리턴
		return result;
	}
	
	
	// 3-3. 예약 조회 view 페이지
	// url : http://localhost:8080/booking/check-booking-view
	@GetMapping("/check-booking-view")
	public String checkBookingView() {
		return "booking/checkBooking";
	}
	
	// 3-3. AJAX - 예약 확인하기 기능
	@ResponseBody
	@GetMapping("/check-booking")
	public Map<String, Object> checkBooking(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber) {
		
		// DB select -> 가장 가까운(date가 가장 이전) 하나만 BO에서 보낸다 
		Booking booking = bookingBO.getNearestBookingByNamePhoneNumber(name, phoneNumber);
		// BO에서 데이터 가공을 전부 해서 딱 한건만 Controller에 들어왔다.
		
		// Map 만들기
		Map<String, Object> result = new HashMap<>();
		if (booking == null) { // 예약 내역이 없을 때.
			result.put("code", 500);
			result.put("message", "예약된 내역이 존재하지 않습니다.");
		} else { // 예약 내역 존재 -> 성공
			result.put("code", 200);
			result.put("booking", booking); // Booking 객체를 통째로 value로 집어넣는다.
		}
		
		// 리턴
		return result;
	}
}
