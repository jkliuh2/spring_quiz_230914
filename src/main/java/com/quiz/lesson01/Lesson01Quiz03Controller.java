package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// jsp 컨트롤러

@Controller // jsp 파일로 보낼 때는 @Controller만.
public class Lesson01Quiz03Controller {

	// url: http://localhost:8080/lesson01/quiz03/1
	@RequestMapping("/lesson01/quiz03/1") // Request url path
	public String quiz03() {
		// @ResponseBody가 아닌 단독으로 사용되는 @Controller만 있을 때 + return String
			// -> ViewResolver에 의해 리턴된 String의 jsp 경로를 찾고 화면이 구성된다. 
				// => 최종적으로는 HTML 응답(Response Body에 담겨서)
		
		return "lesson01/quiz03"; // jsp 경로 
		// prefix, suffix 제외하고 적기
	}
}

// Request -> Response
			// @ResponseBody + String => HttpMessageConverter => HTML
			// @ResponseBody + 객체 => HttpMessageConverter -> jackson lib => JSON
			// return String => ViewResolver -> jsp => HTML