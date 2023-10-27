package kr.or.lis.controller.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.BookService;
import kr.or.lis.service.BookServiceImpl;
import kr.or.lis.vo.BookVO;

public class RecommendedBooksController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BookService book = BookServiceImpl.getInstance();
		List<BookVO> booklist = book.findAllRecom();
		
		request.setAttribute("list", booklist);
		
		return "recommendedBooks";
	}

}
