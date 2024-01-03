package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.domain.Bookmark;
import com.quiz.lesson06.mapper.BookmarkMapper;

@Service
public class BookmarkBO {

	@Autowired
	private BookmarkMapper bookmarkMapper;
	
	// 전체 테이블 select
	public List<Bookmark> getBookmark() {
		return bookmarkMapper.selectBookmarkList();
	}
	
	// insert
	// input: name, url / output: X
	public void addBookmark(String name, String url) {
		bookmarkMapper.insertBookmark(name, url);
	}
	
	// url 중복 확인
	// input: url / output: boolean
	// DAO에서 받아온 데이터를 BO에서 가공, boolean으로 Controller에 리턴한다.
	public boolean isDuplicationByUrl(String url) {
//		return bookmarkMapper.isDuplicationByUrl(url);
		
		// 중복 없음: [](빈 리스트) / 중복이면 리스트 채워짐(size>0 or empty()함수 이용)
		List<Bookmark> bookmarkList = bookmarkMapper.selectBookmarkListByUrl(url);
		// 중복없으면 false, 중복이면 true가 리턴되야 한다.
//		return bookmarkList.isEmpty() ? false : true;
		return !bookmarkList.isEmpty(); // isEmpty가 true면 false가 리턴되는 것
	}
	
	// deleteById
	// output:int(삭제된 행 개수)
	public int deleteBookmarkById(int id) {
		return bookmarkMapper.deleteBookmarkById(id);
	}
}
