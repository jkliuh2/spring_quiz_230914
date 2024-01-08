package com.quiz.weather_history.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.quiz.weather_history.domain.WeatherHistory;

@Mapper
public interface WeatherMapper {
	
	// 전체 날씨 select
	// input:X / output:List<>
	public List<WeatherHistory> selectWeatherHistoryList();
	
	// 날씨 Insert
	public int insertWeatherHistory(WeatherHistory weatherHistory);
}
