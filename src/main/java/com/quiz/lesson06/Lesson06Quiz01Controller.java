package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookmarkBO;
import com.quiz.lesson06.domain.Bookmark;

@RequestMapping("/lesson06/quiz01")
@Controller
public class Lesson06Quiz01Controller {
	
	@Autowired
	private BookmarkBO bookmarkBO;
	

	// 즐겨찾기 추가하기 view
	// url: http://localhost:8080/lesson06/quiz01/add-bookmark-view
	@GetMapping("/add-bookmark-view")
	public String addBookmarkView() {
		return "lesson06/addBookmark";
	}
	
	
	// 즐겨찾기 insert
	// url: add-bookmark / 무조건 ResponseBody + String => callBack을 위함
	@ResponseBody
	@PostMapping("/add-bookmark")
	public String addBookmark(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		
		// DB insert
		bookmarkBO.addBookmark(name, url);
		
		// call back
		return "성공";
	}
	
	
	// 즐겨찾기 추가 후 목록 view
	// url: /after-bookmark-view
	@GetMapping("/after-bookmark-view")
	public String afterBookmarkView(Model model) {
		
		// DB select
		List<Bookmark> bookmarkList = bookmarkBO.getBookmark();
		
		// model 데이터 담기
		model.addAttribute("bookmarkList", bookmarkList);
		
		// jsp로
		return "lesson06/afterBookmark";
	}
}
