package kr.or.lis.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.MemberService;
import kr.or.lis.service.MemberServiceImpl;
import kr.or.lis.vo.MemberVO;

public class MemberPwSearchController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String nextPage = null;
		
		String ctx = request.getContextPath();
		// 한글 깨짐 방지
		request.setCharacterEncoding("utf-8");
		
		MemberService msv = MemberServiceImpl.getInstance();
		String mid = request.getParameter("mid");
		String memail = request.getParameter("memail");
		
		System.out.println(mid+memail);
		if (mid == null || mid == "" || memail == null || memail == "") {
			System.out.println("pw_search_null임");
			request.setAttribute("pw_Search_error", "아이디와 이메일을 바르게 입력해주세요.");
			//RequestDispatcher dis = request.getRequestDispatcher("./member/memberPwSearch.jsp");
			//dis.forward(request, response);
			nextPage = "memberPwSearch.jsp";
		} else {
			MemberVO mvo = msv.pwSearch(mid, memail);
			if(mvo != null){
				//아이디와 이메일이 존재하므로 메일을 보내는 servlet으로 이동시켜야함.
				System.out.println("pw찾기_이메일 확인완료");
				//request.setAttribute("memail", memail);
				//request.setAttribute("mid", mid);
				//RequestDispatcher dis = request.getRequestDispatcher("/memberPwtmpSend.do");
				//dis.forward(request, response);
				nextPage = "redirect:" + ctx + "/member/memberPwtmpSend.do?memail=" + memail + "&mid=" + mid;
				
			}else {
				request.setAttribute("pw_Search_error", "등록되지 않은 아이디와 이메일입니다.");
				//RequestDispatcher dis = request.getRequestDispatcher("./member/memberPwSearch.jsp");
				//dis.forward(request, response);
				nextPage = "memberPwSearch.jsp";
			}
		}
		
		return nextPage;
	}

}
