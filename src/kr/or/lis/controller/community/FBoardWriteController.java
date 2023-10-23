package kr.or.lis.controller.community;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.FBoardService;
import kr.or.lis.service.FBoardServiceImpl;
import kr.or.lis.vo.MemberVO;
import kr.or.lis.vo.NoticeVO;

public class FBoardWriteController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		FBoardService csv = FBoardServiceImpl.getInstance();
		MemberVO mvo = (MemberVO)request.getSession().getAttribute("member"); 
		

		String ntitle = request.getParameter("ntitle");
		String ncontent = request.getParameter("ncontent");
		ncontent.replaceAll("\n", "<br>");
		System.out.println(ntitle);
		NoticeVO vo = new NoticeVO();
		vo.setMid(mvo.getMid());
		vo.setNtitle(ntitle);
		vo.setNcontent(ncontent);
		String ctx = request.getContextPath();

		int result = csv.noticeWrite(vo);
		
		String search_error = (String)request.getAttribute("search_error");
		System.out.println(search_error);
		request.setAttribute("search_error", search_error);
		
	

		request.setAttribute("fBoardWrite", result);
		
			if (result == 1) {
				System.out.println(result + "행 추가되었습니다. fBoardWrite controller");
				return "redirect:" + ctx + "/community/fBoardList.do"; 

			} else {
				System.out.println("창작물게시판 등록 실패");
				request.setAttribute("register_fail", "등록에 실패했습니다. 다시 시도해 주세요.");
				return "fBoardWrite"; 
			}
		
		
		
	}

}
