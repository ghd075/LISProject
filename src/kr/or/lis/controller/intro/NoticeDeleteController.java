package kr.or.lis.controller.intro;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.NoticeService;
import kr.or.lis.service.NoticeServiceImpl;

public class NoticeDeleteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		NoticeService nsv = NoticeServiceImpl.getInstance();
	
		String ctx = request.getContextPath();
		
		int nno = Integer.parseInt(request.getParameter("nno").trim());
		int result = nsv.noticeDelete(nno);
			
			if(result == 1) {
				System.out.println("삭제 성공");
				out.println("삭제 되었습니다.");
				
				request.setAttribute("sendRedirect",true);
				
				return "redirect:" + ctx + "/intro/noticeList.do";
			}else {
			
				return "noticeDetail";
			
			}
	}
}

