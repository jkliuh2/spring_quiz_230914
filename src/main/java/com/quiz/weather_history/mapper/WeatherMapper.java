package com.quiz.weather_history.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.weather_history.domain.WeatherHistory;

@Repository
public interface WeatherMapper {
	
	// 전체 날씨 select
	// input:X / output:List<>
	public List<WeatherHistory> selectWeatherHistoryList();
	
	// 날씨 Insert
	public int insertWeatherHistory(WeatherHistory weatherHistory);
}
