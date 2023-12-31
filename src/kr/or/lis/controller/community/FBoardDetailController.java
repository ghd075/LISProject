package kr.or.lis.controller.community;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.FBoardService;
import kr.or.lis.service.FBoardServiceImpl;
import kr.or.lis.vo.NoticeVO;
import kr.or.lis.vo.ReplyVO;

public class FBoardDetailController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		FBoardService fBoardService = FBoardServiceImpl.getInstance();
		int nno = 0;
		nno = Integer.parseInt(request.getParameter("nno"));
		
		NoticeVO ndetail = fBoardService.noticeDetail(nno);
		int noticeView = fBoardService.viewCount(nno);
		
		request.setAttribute("fBdetail", ndetail);
		
		List<ReplyVO> list = fBoardService.getReply(nno);
		request.setAttribute("freplyList", list);
		
		return "fBoardDetail";
	}

}
