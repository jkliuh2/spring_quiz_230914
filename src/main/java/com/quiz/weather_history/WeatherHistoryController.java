package com.quiz.weather_history;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.weather_history.bo.WeatherBO;
import com.quiz.weather_history.domain.WeatherHistory;

@RequestMapping("/weather-history")
@Controller
public class WeatherHistoryController {
// 5강 퀴즈5
	
	@Autowired
	private WeatherBO weatherBO;
	
	
	// 5-1 날씨 정보 페이지
	// url: http:localhost:8080/weather-history/weather-list-view
	@GetMapping("/weather-list-view")
	public String weatherListView(Model model) {
		
		// Select 전체 날씨 정보
		List<WeatherHistory> list = weatherBO.getWeatherHistoryList();
		
		// Model에 데이터 입력
		model.addAttribute("weatherList", list);
		
		// jsp 경로 리턴		
		return "weather_history/weatherList";
	}
	
	// 5-2 날씨 입력 페이지
	// url: http:localhost:8080/weather-history/add-weather-view
	@GetMapping("/add-weather-view")
	public String addWeatherView() {
		return "weather_history/addWeather";
	}
	
	// 5-2_1 날씨 입력버튼 누르고 나서
	@PostMapping("/add-weather")
	public String addWeather(
			@ModelAttribute WeatherHistory weatherHistory
//			@RequestParam("date") String date,
//			@RequestParam("date") @DateTimeFormat(pattern = "yyyy-MM-dd") String date,
//			@RequestParam("weather") String weather,
//			@RequestParam("temperatures") double temperatures,
//			@RequestParam("precipitation") double precipitation,
//			@RequestParam("microDust") String microDust,
//			@RequestParam("windSpeed") double windSpeed
			) {
		// dateformat을 통해 변경된 String 타입이 Date로는 받을 수 없어서 date는 String으로 받았다.
		// 이것을 받을 때 Date로 받고 싶다면, 어노테이션 추가.
		// Domain에 @DateTimeFormat 설정을 추가해서 클래스 객체로 받을 수 있다.
		
		// DB Insert
		weatherBO.addWeatherHistory(weatherHistory);
		
		// DB select -> 이미 같은 컨트롤러(5-1)이 존재한다. => 리다이렉트로 해결
		
		// 전체 날씨 목록 페이지로 리다이렉트 => 이미 존재했던 컨트롤러가 Select 진행
		return "redirect:/weather-history/weather-list-view";
	}
	
	
}
