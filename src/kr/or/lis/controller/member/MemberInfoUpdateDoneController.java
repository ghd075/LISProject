package kr.or.lis.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javafx.scene.control.Alert;
import kr.or.lis.common.Controller;
import kr.or.lis.service.MemberService;
import kr.or.lis.service.MemberServiceImpl;
import kr.or.lis.vo.MemberVO;

public class MemberInfoUpdateDoneController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		MemberService service =MemberServiceImpl.getInstance();
		MemberVO vo = new MemberVO();

		vo.setMpw(request.getParameter("mpw"));
		vo.setMemail(request.getParameter("memail"));
		vo.setMphone(request.getParameter("mphone"));
		vo.setMzip_code(request.getParameter("mzip_code"));
		vo.setM_first_addr(request.getParameter("m_first_addr"));
		vo.setM_second_addr(request.getParameter("m_second_addr"));
		vo.setMid(request.getParameter("mid"));
		
		int res = service.updateMember(vo);
		String ctx = request.getContextPath();
		
		
		
		if(res == 1)
		{
			System.out.println("회원정보 수정완료");
			out.println("회원정보 수정완료");
			return "redirect:" + ctx + "/admin/memberList.do";
		}
		
		else
		{
		
			out.println("alert('회원정보 수정 실패')");
			return "redirect:" + ctx + "/admin/memberInfoUpdate.do?mid="+ vo.getMid();
		}
	
		


	}

}
