package kr.or.lis.controller.community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.FBoardService;
import kr.or.lis.service.FBoardServiceImpl;


public class FBoardReplyDeleteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		FBoardService nsv = FBoardServiceImpl.getInstance();
	
		String ctx = request.getContextPath();
		
		int rno = Integer.parseInt(request.getParameter("rno").trim());
		int nno = Integer.parseInt(request.getParameter("nno").trim());
		int result = nsv.replyDelete(rno);
		System.out.println(rno +"번글 삭제");
			
		
		if (result == 1) {
			System.out.println(result + "행 답변이 삭제되었습니다. fBoardReply Delete controller");
			return "/community/fBoardDetail.do?nno="+request.getParameter("nno"); 

		} else {
			System.out.println("묻고답하기 댓글 삭제 실패");
			request.setAttribute("register_fail", "삭제에 실패했습니다. 다시 시도해 주세요.");
			return "/community/fBoardDetail.do?nno"+nno; 
		}
	}


}

