package com.quiz.weather_history.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.weather_history.domain.Weather;

@Repository
public interface WeatherMapper {
	
	// 전체 날씨 select
	public List<Weather> selectWeather();
	
	// 날씨 Insert
	public int insertWeather(Weather weather);
}
