package kr.or.lis.controller.intro;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.QnaService;
import kr.or.lis.service.QnaServiceImpl;
import kr.or.lis.vo.MemberVO;
import kr.or.lis.vo.NoticeVO;

public class QnaWriteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		QnaService nsv = QnaServiceImpl.getInstance();
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("member"); 
		

		String ntitle = request.getParameter("ntitle");
		String ncontent = request.getParameter("ncontent");
		ncontent.replaceAll("\n", "<br>");
		System.out.println(ntitle);
		NoticeVO vo = new NoticeVO();
		vo.setMid(mvo.getMid());
		vo.setNtitle(ntitle);
		vo.setNcontent(ncontent);
		String ctx = request.getContextPath();

		int result = nsv.noticeWrite(vo);
		System.out.println("실행결과 : " + result);
		
		String search_error = (String)request.getAttribute("search_error");
		System.out.println(search_error);
		request.setAttribute("search_error", search_error);
		
		request.setAttribute("sendRedirect",true);

		request.setAttribute("qnaWrite", result);
		
			if (result == 1) {
				System.out.println(result + "행 추가되었습니다. qnaWrite controller");
				return "redirect:" + ctx + "/intro/qnaList.do"; 

			} else {
				System.out.println("묻고답하기 등록 실패");
				request.setAttribute("register_fail", "등록에 실패했습니다. 다시 시도해 주세요.");
				return "qnaWrite"; 
			}
		
		
		
	}

}
