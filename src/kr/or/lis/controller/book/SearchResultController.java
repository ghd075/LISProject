package kr.or.lis.controller.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;

public class SearchResultController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String queryValue = request.getParameter("query"); // 또는 원하는 방법으로 값을 가져옴
		request.setAttribute("query", queryValue);
		
		return "SearchResult";
	}

}
