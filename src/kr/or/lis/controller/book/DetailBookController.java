package kr.or.lis.controller.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.lis.common.Controller;

public class DetailBookController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		if (session.getAttribute("cust_no") == null) {
            request.setAttribute("days", 0);
		} else {
			String mno = (String) session.getAttribute("mno");
		}
		
		String queryValue = request.getParameter("query"); // 또는 원하는 방법으로 값을 가져옴
		request.setAttribute("query", queryValue);
		String bnoValue = request.getParameter("b_no");
		request.setAttribute("b_no", bnoValue);
		
		return "detailBook";
	}

}
