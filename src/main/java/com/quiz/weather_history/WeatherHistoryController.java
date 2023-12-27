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
import com.quiz.weather_history.domain.Weather;

@RequestMapping("/weather_history")
@Controller
public class WeatherHistoryController {
// 5강 퀴즈5
	
	@Autowired
	private WeatherBO weatherBO;
	
	
	// 5-1 날씨 정보 페이지
	// url: http:localhost:8080/weather_history/weather-list-view
	@GetMapping("/weather-list-view")
	public String weatherListView(Model model) {
		
		// Select 전체 날씨 정보
		List<Weather> list = weatherBO.getWeather();
		
		// Model 데이터 입력
		model.addAttribute("weatherList", list);
		
		// jsp 경로 리턴		
		return "weather_history/weatherList";
	}
	
	// 5-2 날씨 입력 페이지
	// url: http:localhost:8080/weather_history/add-weather-view
	@GetMapping("/add-weather-view")
	public String addWeatherView() {
		return "weather_history/addWeather";
	}
	
	// 5-2_1 날씨 입력버튼 누르고 나서
	// path: /add-weather
	@PostMapping("/add-weather")
	public String addWeather(@ModelAttribute Weather weather) {
		
		// RequestParam들을 Insert
		weatherBO.addWeather(weather);
		
		// weather-list-view 페이지로 리다이렉트
		return "redirect:/weather_history/weather-list-view";
	}
	
	
	// url: http:localhost:8080/weather_history/weather-list-view
}
