package kr.or.lis.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.lis.common.Controller;

public class MemberLogoutController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ctx = request.getContextPath();
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate(); // 세션 만료시킴
		}
		
		return "redirect:" + ctx + "/LisMain.do";
	}

}
