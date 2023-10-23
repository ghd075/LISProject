package kr.or.lis.controller.community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.FBoardService;
import kr.or.lis.service.FBoardServiceImpl;
import kr.or.lis.vo.NoticeVO;

public class FBoardUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		FBoardService csv = FBoardServiceImpl.getInstance();
		PrintWriter out = response.getWriter();
		
		int nno = Integer.parseInt(request.getParameter("nno").trim());
//		String pageNum = request.getParameter("pageNum");
		String mid = request.getParameter("mid");
		String ntitle = request.getParameter("ntitle");
		String ncontent = request.getParameter("ncontent");
		String ctx = request.getContextPath();
		
		NoticeVO vo = new NoticeVO();
		vo.setNno(nno);
		vo.setMid(mid);
		vo.setNtitle(ntitle);
		vo.setNcontent(ncontent);
		
		int result = csv.noticeUpdate(vo, nno);
		System.out.println(vo);
		
		String search_error = (String)request.getAttribute("search_error");
		System.out.println(search_error);
		request.setAttribute("search_error", search_error);
		
	
		
		if(result == 1) {
			System.out.println(result+"행이 수정되었습니다");
			request.setAttribute("fBoardUpdate", "수정이 완료되었습니다.");
			out.println("수정이 완료되었습니다.");
			return "redirect:" + ctx + "/community/fBoardList.do";	
		}
		else
		{
			
			System.out.println("수정하지 못했습니다");
			out.println("수정 중 오류가 발생 했습니다.");
			return "redirect:" + ctx + "/community/fBoardList.do";	
		}
	}

}

