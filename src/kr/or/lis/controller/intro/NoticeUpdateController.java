package kr.or.lis.controller.intro;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.NoticeService;
import kr.or.lis.service.NoticeServiceImpl;
import kr.or.lis.vo.NoticeVO;

public class NoticeUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		NoticeService nsv = NoticeServiceImpl.getInstance();
		PrintWriter out = response.getWriter();
		
		String ctx = request.getContextPath();
		
		int nno = Integer.parseInt(request.getParameter("nno").trim());
		String pageNum = request.getParameter("pageNum");
		String mid = request.getParameter("mid");
		String ntitle = request.getParameter("ntitle");
		String ncontent = request.getParameter("ncontent");
		
		NoticeVO vo = new NoticeVO();
		vo.setNno(nno);
		vo.setMid(mid);
		vo.setNtitle(ntitle);
		vo.setNcontent(ncontent);
		
		int result = nsv.noticeUpdate(vo, nno);
		System.out.println(vo);
		
		if(result == 1) {
			System.out.println(result + "행이 수정되었습니다");
			out.println("수정이 완료되었습니다.");
		} else {
			System.out.println("수정하지 못했습니다");
			out.println("수정 중 오류가 발생 했습니다.");
		}
		return "redirect:" + ctx + "/intro/noticeDetail.do?nno=" + nno + "&pageNum=" + pageNum;
	}
}

