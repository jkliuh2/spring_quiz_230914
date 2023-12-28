package com.quiz.weather_history.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.weather_history.domain.WeatherHistory;
import com.quiz.weather_history.mapper.WeatherMapper;

@Service
public class WeatherBO {
	
	@Autowired
	private WeatherMapper weatherMapper;

	// 전체 날씨 Select
	// input:X / output:List<WeatherHistory>
	public List<WeatherHistory> getWeatherHistoryList() {
		return weatherMapper.selectWeatherHistoryList();
	}
	
	// 날씨 Insert
	public void addWeatherHistory(WeatherHistory weatherHistory) {
		weatherMapper.insertWeatherHistory(weatherHistory);
	}
}
