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
		return bookmarkMapper.selectBookmark();
	}
	
	// insert
	// input: name, url / output: X
	public void addBookmark(String name, String url) {
		bookmarkMapper.insertBookmark(name, url);
	}
}
