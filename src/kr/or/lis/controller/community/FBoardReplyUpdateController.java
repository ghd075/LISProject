package kr.or.lis.controller.community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.FBoardService;
import kr.or.lis.service.FBoardServiceImpl;

import kr.or.lis.vo.ReplyVO;

public class FBoardReplyUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		FBoardService nsv = FBoardServiceImpl.getInstance();
		PrintWriter out = response.getWriter();

		ReplyVO vo = new ReplyVO();
		int rno = Integer.parseInt(request.getParameter("rno").trim());
		int nno = Integer.parseInt(request.getParameter("nno").trim());
		String ncontent = request.getParameter("ncontent");
		

		String ctx = request.getContextPath();
		
		vo.setRno(rno);
		vo.setNcontent(ncontent);
		
		int result = nsv.replyUpdate(vo);
		
		String search_error = (String)request.getAttribute("search_error");
		System.out.println(search_error);
		request.setAttribute("search_error", search_error);
		

		if(result == 1) {
			System.out.println(result+"행이 수정되었습니다");
			request.setAttribute("replyUpdate", "수정이 완료되었습니다.");
			out.println("수정이 완료되었습니다.");
			return "redirect:" + ctx + "/community/fBoardDetail.do?nno="+nno;	
		}
		else
		{
			
			System.out.println("수정하지 못했습니다");
			out.println("수정 중 오류가 발생 했습니다.");
			return "redirect:" + ctx + "/community/fBoardList.do";	
		}
	}


}

