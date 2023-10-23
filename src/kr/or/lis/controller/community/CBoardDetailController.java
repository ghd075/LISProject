package kr.or.lis.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.CBoardService;
import kr.or.lis.service.CBoardServiceImpl;
import kr.or.lis.vo.NoticeVO;

public class CBoardDetailController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CBoardService noticeService = CBoardServiceImpl.getInstance();
		int nno = 0;
		nno = Integer.parseInt(request.getParameter("nno"));
		
		NoticeVO ndetail = noticeService.noticeDetail(nno);
		int noticeView = noticeService.viewCount(nno);
		
		request.setAttribute("cBdetail", ndetail);
		
		return "cBoardDetail";
	}

}
