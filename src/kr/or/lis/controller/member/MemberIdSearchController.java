package kr.or.lis.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.MemberService;
import kr.or.lis.service.MemberServiceImpl;
import kr.or.lis.vo.MemberVO;

public class MemberIdSearchController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String nextPage = null;
		
		String ctx = request.getContextPath();
		
		MemberService msv = MemberServiceImpl.getInstance();
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		
		if(mname == null || mname == "" || memail == null || memail == "") {
			request.setAttribute("id_search_error", "이름과 이메일 정보를 바르게 입력해주세요.");
			System.out.println("아이디 찾기 널인 경우");
			nextPage = "memberIdSearch";
		}else {
		
			MemberVO m= msv.idSearch(mname, memail);
			if(m!=null) {
				request.setAttribute("id_search_mid", m.getMid());
				nextPage = "memberIdSearchEnd";
			}else {
				nextPage = "redirect:" + ctx + "/member/memberIdSearchError.do";
			}
		
		}
		
		return nextPage;
	}

}
