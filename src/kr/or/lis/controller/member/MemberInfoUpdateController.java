package kr.or.lis.controller.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.MemberService;
import kr.or.lis.service.MemberServiceImpl;
import kr.or.lis.vo.MemberVO;

public class MemberInfoUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberService service =MemberServiceImpl.getInstance();
		String mid = (String)request.getParameter("mid");
		MemberVO vo = service.selMemberOne(mid);
		request.setAttribute("memberInfo", vo);
		return "memberInfoUpdate";
	}

}
