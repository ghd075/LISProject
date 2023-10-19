package kr.or.lis.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.MemberService;
import kr.or.lis.service.MemberServiceImpl;
import kr.or.lis.vo.MemberVO;

public class MemberLoginController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String nextPage = null;
		
		String ctx = request.getContextPath();
		
		MemberService msv = MemberServiceImpl.getInstance();
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		
		System.out.println("아이디 와 비밀번호 : " + mid + ", " + mpw);
		
		String login_keep = request.getParameter("login_keep");

		if (mid == null || mid == "" || mpw == null || mpw == "") {
			request.setAttribute("login_error", "로그인 정보를 바르게 입력해주세요.");
			System.out.println("로그인이 널인 경우");
			nextPage = "memberLogin";
		} else {

			// memberVO Login_type int형이 0인 경우 : id자체가 존재하지 않음.
			// memberVO Login_type int형이 1인 경우 : id가 존재하지만, id와 pw가 일치하지 않음.
			// memberVO Login_type int형이 2인 경우 : id와 pw가 일치함 => 로그인 시킴.
			// memberVO Login_type int형이 3인 경우 : 탈퇴한 회원 => 로그인 불가능.
				
			MemberVO m = msv.loginMember(mid, mpw);
			if (m != null) {
				if (m.getLogin_type() == 0) {
					//아이디가 존재하지 않는 경우.
					request.setAttribute("login_error", "존재하지 않는 아이디입니다.");
					nextPage = "memberLogin";
				} else if (m.getLogin_type() == 1) {
					//비밀번호 틀린 경우
					request.setAttribute("login_error", "아이디와 비밀번호가 올바르지 않습니다.");
					nextPage = "memberLogin";
				} else if(m.getLogin_type() == 2){
					request.getSession().setAttribute("member", m);
					nextPage = "redirect:" + ctx + "/LisMain.do";
				}
			}
		}
		return nextPage;
	}

}
