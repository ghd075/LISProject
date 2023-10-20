package kr.or.lis.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.MemberService;
import kr.or.lis.service.MemberServiceImpl;

public class CheckEmailController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String memail = request.getParameter("memail");
		System.out.println(memail);
		PrintWriter out = response.getWriter();
		
		if(memail==null||memail=="") {
			out.println("이메일을 입력해주세요");
			
		}	else {
			MemberService memberService = MemberServiceImpl.getInstance();
			
			int cnt = memberService.isEmailChk(memail);
			
			System.out.println("email 체크 : " + cnt);
			if(cnt > 0){
				//사용중 0
				out.println("0");
			}else{
				//사용가능 1
				out.println("1");
			}
			out.flush();
			out.close();
		
		}
		return null;
	}

}
