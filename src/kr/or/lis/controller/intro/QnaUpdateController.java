package kr.or.lis.controller.intro;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.NoticeService;
import kr.or.lis.service.NoticeServiceImpl;
import kr.or.lis.service.QnaService;
import kr.or.lis.service.QnaServiceImpl;
import kr.or.lis.vo.NoticeVO;

public class QnaUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		QnaService nsv = QnaServiceImpl.getInstance();
		PrintWriter out = response.getWriter();
		
		int nno = Integer.parseInt(request.getParameter("nno").trim());
//		String pageNum = request.getParameter("pageNum");
		String mid = request.getParameter("mid");
		String ntitle = request.getParameter("ntitle");
		String ncontent = request.getParameter("ncontent");
		String ctx = request.getContextPath();
		
		NoticeVO vo = new NoticeVO();
		vo.setNno(nno);
		vo.setMid(mid);
		vo.setNtitle(ntitle);
		vo.setNcontent(ncontent);
		
		int result = nsv.noticeUpdate(vo, nno);
		System.out.println(vo);
		
		String search_error = (String)request.getAttribute("search_error");
		System.out.println(search_error);
		request.setAttribute("search_error", search_error);
		
		request.setAttribute("sendRedirect", true);
		
		if(result == 1) {
			System.out.println(result+"행이 수정되었습니다");
			request.setAttribute("noticeUpdate", "수정이 완료되었습니다.");
			out.println("수정이 완료되었습니다.");
			return "redirect:" + ctx + "/intro/qnaList.do";	
		}
		else
		{
			
			System.out.println("수정하지 못했습니다");
			out.println("수정 중 오류가 발생 했습니다.");
			return "redirect:" + ctx + "/intro/qnaList.do";	
		}
	}

}
