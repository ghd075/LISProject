package kr.or.lis.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.FBoardService;
import kr.or.lis.service.FBoardServiceImpl;
import kr.or.lis.vo.NoticeVO;

public class FBoardReplyController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		FBoardService fService = FBoardServiceImpl.getInstance();
		int nno = 0;
		nno = Integer.parseInt(request.getParameter("nno"));
		
		NoticeVO ndetail = fService.noticeDetail(nno);
		int fBoardView = fService.viewCount(nno);
		request.setAttribute("fBdetail", ndetail);
		
		return "fBoardReply";
		
		
	}

}
