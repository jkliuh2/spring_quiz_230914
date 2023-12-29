package com.quiz.lesson06.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.domain.Bookmark;

@Repository
public interface BookmarkMapper {

	// 전체 테이블 select
	public List<Bookmark> selectBookmark();
	
	// insert
	// input: name, url / output:int
	public int insertBookmark(
			@Param("name") String name, 
			@Param("url") String url);
}
