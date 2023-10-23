package kr.or.lis.controller.intro;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.QnaService;
import kr.or.lis.service.QnaServiceImpl;
import kr.or.lis.vo.NoticeVO;
import kr.or.lis.vo.ReplyVO;

public class QnaDetailController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QnaService qnaService = QnaServiceImpl.getInstance();
		int nno = 0;
		nno = Integer.parseInt(request.getParameter("nno"));
		
		NoticeVO ndetail = qnaService.noticeDetail(nno);
		
		int qnaView = qnaService.viewCount(nno);
		request.setAttribute("ndetail", ndetail);

		
		List<ReplyVO> list = qnaService.getReply(nno);
		request.setAttribute("qreplyList", list);
		
		
		return "qnaDetail";
	}

}
