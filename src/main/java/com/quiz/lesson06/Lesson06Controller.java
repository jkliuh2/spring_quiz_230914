package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@RequestMapping("/lesson06")
@Controller
public class Lesson06Controller {
	
	@Autowired
	private BookmarkBO bookmarkBO;
	

	// 1-1. 즐겨찾기 추가하기 view
	// url: http://localhost:8080/lesson06/add-bookmark-view
	@GetMapping("/add-bookmark-view")
	public String addBookmarkView() {
		return "lesson06/addBookmark";
	}
	
	
	// 1-1. 즐겨찾기 insert
	// ★ AJAX 통신 요청 -> 응답값 String
	// url: add-bookmark / 무조건 ResponseBody + String => callBack을 위함
	@ResponseBody
	@PostMapping("/add-bookmark")
	public Map<String, Object> addBookmark(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			) {
		
		// DB insert
		bookmarkBO.addBookmark(name, url);
		
		// 성공 했을 때, Call Back 데이터. {"code":200, "result":"성공"} -> 이러한 String이 내려갈 것임
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200); // 성공 했을 때 코드 = 200
		result.put("result", "성공"); // 성공 했을 때 상태 알림?
		
		// call back
		return result;
		// ★ 여기서 내려가는 result는 그냥 JSON 모양으로 생긴 String이다. ★
	}
	
	
	// 1-2. 즐겨찾기 추가 후 목록 view
	// url: http://localhost:8080/lesson06/bookmark-list-view
	@GetMapping("/bookmark-list-view")
	public String bookmarkListView(Model model) {
		
		// DB select
		List<Bookmark> bookmarkList = bookmarkBO.getBookmark();
		
		// model 데이터 담기
		model.addAttribute("bookmarkList", bookmarkList);
		
		// jsp로
		return "lesson06/bookmarkList";
	}
	
	
	// 2-1. ajax통신 - url 중복확인
	// url: /is-duplication-url
	@ResponseBody
	@GetMapping("/is-duplication-url")
	public Map<String, Object> isDuplicationUrl(
			@RequestParam("url") String url) {
		
		// DB select -> 중복여부(boolean) - true:중복
		boolean is_duplication = bookmarkBO.isDuplicationByUrl(url);
				
		// 리턴 할 Map 만들기
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("is_duplication", is_duplication);
		
		// 리턴
		return result;
	}
	
	
	// 2-2. ajax통신 - delete
	// url: /delete-bookmark-by-id
	@ResponseBody
	@PostMapping("/delete-bookmark-by-id")
	public Map<String, Object> deleteBookmarkById(
			@RequestParam("id") int id) {
		
		// DB delete
		bookmarkBO.deleteBookmarkById(id);
		
		// 리턴할 Map 만들기
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		
		// call back
		return result;
	}
}