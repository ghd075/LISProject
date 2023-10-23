package kr.or.lis.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.UBoardService;
import kr.or.lis.service.UBoardServiceImpl;
import kr.or.lis.vo.NoticeVO;

public class UBoardDetailController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UBoardService noticeService = UBoardServiceImpl.getInstance();
		int nno = 0;
		nno = Integer.parseInt(request.getParameter("nno"));
		
		NoticeVO ndetail = noticeService.noticeDetail(nno);
		int noticeView = noticeService.viewCount(nno);
		
		request.setAttribute("uBdetail", ndetail);
		
		return "uBoardDetail";
	}

}
