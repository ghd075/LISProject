package kr.or.lis.controller.book;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.BorrowService;
import kr.or.lis.service.BorrowServiceImpl;
import kr.or.lis.vo.JoinVO;

public class AdminBorrowListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BorrowService service = BorrowServiceImpl.getInstance();
		List<JoinVO> list = service.selBorrowList();
		
		if(list != null)	
		{
			request.setAttribute("borrowList", list);
		}

		return "borrowList";
	}

}
