package kr.or.lis.controller.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.MemberService;
import kr.or.lis.service.MemberServiceImpl;

public class CheckIdController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String mid = request.getParameter("mid");
		System.out.println("아이디 : " + mid);
		PrintWriter out = response.getWriter();
		
		if(mid == null || mid.equals("")) {
			out.println("아이디를 입력해주세요");
			
		}else {
			MemberService memberService = MemberServiceImpl.getInstance();
			int cnt = memberService.isIdChk(mid);
			System.out.println("id 체크 : " + cnt);
			if(cnt > 0){
				//0 : 이미 사용중
				out.println("0");
			}else{
				//1 : 사용가능
				out.println("1");
			}
			out.flush();
			out.close();
		}		
		return null;
	}
}
