package kr.or.lis.controller.community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.FBoardService;
import kr.or.lis.service.FBoardServiceImpl;

public class FBoardDeleteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		FBoardService csv = FBoardServiceImpl.getInstance();
	
		String ctx = request.getContextPath();
		
		int nno = Integer.parseInt(request.getParameter("nno").trim());
		int result = csv.noticeDelete(nno);
			
			if(result == 1) {
				System.out.println("삭제 성공");
				out.println("삭제 되었습니다.");
				
				
				return "redirect:" + ctx + "/community/fBoardList.do";
			}else {
			
				return "fBoardDetail";
			
			}
	}


}

