package kr.or.lis.controller.intro;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.NoticeService;
import kr.or.lis.service.NoticeServiceImpl;
import kr.or.lis.vo.NoticeVO;

public class NoticeDetailController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		NoticeService noticeService = NoticeServiceImpl.getInstance();
		int nno = 0;
		nno = Integer.parseInt(request.getParameter("nno"));
		
		NoticeVO ndetail = noticeService.noticeDetail(nno);
		int noticeView = noticeService.viewCount(nno);
		ndetail.setNview(noticeView);
		request.setAttribute("ndetail", ndetail);
		
		return "noticeDetail";
	}

}
