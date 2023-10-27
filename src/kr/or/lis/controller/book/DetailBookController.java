package kr.or.lis.controller.book;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.lis.common.Controller;
import kr.or.lis.service.*;

public class DetailBookController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BookService book = BookServiceImpl.getInstance();
		FolderService folder = FolderServiceImpl.getInstance();
		BorrowService borrow = BorrowServiceImpl.getInstance();
		
		HttpSession session = request.getSession(true);
		String mno = null;
		
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		
		if (session.getAttribute("mno") == null) {
            request.setAttribute("days", 0);
		} else {
			mno = (String) session.getAttribute("mno");
			System.out.println("회원번호 가져오기 ==> " + mno);
			int delay = borrow.delay(mno);
			//만약 연체가 있으면 값을 싣는다.
			System.out.println("연체 유무 확인 : " + delay + ":@:@:::::::::::::::::::::");
			 
			if (delay > 0) {
                // 연체일수를 넣습니다.
                request.setAttribute("days", borrow.delay2(mno));
            } else {
                request.setAttribute("days", 0);
            } 
			
			 System.out.println("회원번호 가져오기 ==> " + mno);
			 request.setAttribute("f", folder.findByNo(mno));
		}
		
		int b_count2 = borrow.calB_no(mno);
		request.setAttribute("b", book.findByNo(b_no));
		request.setAttribute("sumbook", b_count2);
		request.setAttribute("query", request.getParameter("query"));
		
		return "detailBook";
	}

}
