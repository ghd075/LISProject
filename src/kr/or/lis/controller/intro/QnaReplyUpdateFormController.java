package kr.or.lis.controller.intro;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.QnaService;
import kr.or.lis.service.QnaServiceImpl;
import kr.or.lis.vo.ReplyVO;

public class QnaReplyUpdateFormController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		QnaService nsv = QnaServiceImpl.getInstance();
		PrintWriter out = response.getWriter();

		ReplyVO vo = new ReplyVO();
		//int rno = Integer.parseInt(request.getParameter("rno").trim());
		int rno = Integer.parseInt(request.getParameter("rno").trim());
		int nno = Integer.parseInt(request.getParameter("nno").trim());
		String ncontent = request.getParameter("ncontent");
		String ctx = request.getContextPath();
		vo = nsv.getReplyOne(rno);
	

		request.setAttribute("selReply", vo);
		
		String search_error = (String)request.getAttribute("search_error");
		System.out.println(search_error);
		request.setAttribute("search_error", search_error);
		
			//return "redirect:" + ctx + "/intro/qnaDetail.do?nno="+nno;	
	
		return "qnaReplyUpdate";
		
	}


}

