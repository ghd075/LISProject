package kr.or.lis.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.MemberService;
import kr.or.lis.service.MemberServiceImpl;
import kr.or.lis.vo.MemberVO;

public class MemberJoinController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String nextPage = null;
		
		String mid = request.getParameter("mid");
		String mpw = request.getParameter("mpw");
		String mname = request.getParameter("mname");
		String mphone = request.getParameter("mphone");
		String memail = request.getParameter("memail");
		String mzip_code = request.getParameter("mzip_code");
		String m_first_addr = request.getParameter("m_first_addr");
		String m_second_addr = request.getParameter("m_second_addr");

		String Smbirthday = request.getParameter("mbirthday");
		String Smgender = request.getParameter("mgender");

		if (mid == null || mid.equals("") || mpw == null || mpw.equals("") || mname == null || mname.equals("")
				|| mphone == null || mphone.equals("") || memail == null || memail.equals("") || mzip_code == null
				|| mzip_code.equals("") || m_first_addr == null || m_first_addr.equals("") || Smbirthday == null
				|| Smbirthday.equals("") || Smgender == null || Smgender.equals("")) {
			request.setAttribute("register_fail", "회원가입 정보를 제대로 입력해주세요.");
			nextPage = "memberRegister";
		} else {
			
			int mbirthday = Integer.parseInt(request.getParameter("mbirthday"));
			int mgender = Integer.parseInt(request.getParameter("mgender"));
			MemberVO mvo = new MemberVO();
			mvo.setMid(mid);
			mvo.setMpw(mpw);
			mvo.setMname(mname);
			mvo.setMemail(memail);
			mvo.setMphone(mphone);
			mvo.setMzip_code(mzip_code);
			mvo.setM_first_addr(m_first_addr);
			mvo.setM_second_addr(m_second_addr);
			mvo.setMgender(mgender);
			mvo.setMbirthday(mbirthday);

			MemberService msv = MemberServiceImpl.getInstance();
			int rs = msv.registerMember(mvo);
			if (rs == 1) {
				System.out.println(rs + "행 추가되었습니다. register controller");
				nextPage = "memberRegisterSuccess";
			} else {
				request.setAttribute("register_fail", "회원가입에 실패했습니다. 다시 회원가입을 해주세요.");
				nextPage = "memberRegister";
			}

		}
		return nextPage;
	}

}
