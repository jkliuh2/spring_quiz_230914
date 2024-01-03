package com.quiz.lesson06.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.domain.Bookmark;

@Repository
public interface BookmarkMapper {

	// 전체 테이블 select
	public List<Bookmark> selectBookmarkList();
	
	// insert
	// input: name, url / output:int
	public int insertBookmark(
			@Param("name") String name, 
			@Param("url") String url);
	
	// url 중복 확인 -> url로 조회하기
	// input:url / output: 그냥 행 자체를 넘겨줄 것.(찾는 것이 여러 행일 수도 있음) -> List
	public List<Bookmark> selectBookmarkListByUrl(String url);
	
	// id로 delete
	public int deleteBookmarkById(int id);
}
