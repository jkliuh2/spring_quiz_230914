package com.quiz.weather_history.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.weather_history.domain.Weather;
import com.quiz.weather_history.mapper.WeatherMapper;

@Service
public class WeatherBO {
	
	@Autowired
	private WeatherMapper weatherMapper;

	// 전체 날씨 Select
	public List<Weather> getWeather() {
		return weatherMapper.selectWeather();
	}
	
	// 날씨 Insert
	public void addWeather(Weather weather) {
		weatherMapper.insertWeather(weather);
	}
}
