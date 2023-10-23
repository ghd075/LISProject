package kr.or.lis.controller.intro;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.lis.common.Controller;
import kr.or.lis.vo.MemberVO;


public class ChatWindowController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		MemberVO vo = (MemberVO)session.getAttribute("member");
		request.setAttribute("loginId", vo.getMid());
		
		
		
		
	
		
		return "chatWindow";
	}

}
