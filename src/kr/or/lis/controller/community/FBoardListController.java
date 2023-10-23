package kr.or.lis.controller.community;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.FBoardService;
import kr.or.lis.service.FBoardServiceImpl;
import kr.or.lis.service.NoticeService;
import kr.or.lis.service.NoticeServiceImpl;
import kr.or.lis.vo.NoticeVO;

public class FBoardListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{

		FBoardService noticeService = FBoardServiceImpl.getInstance();
		// 페이징
		int pageSize = 10; // 페이지 당 글 수
		int pageBlock = 10; // 페이지 링크 수
		// 총 글 개수
		int nCount = noticeService.getBoardCount(); /* 변경 : 메소드 */
		System.out.println(nCount);
		// 페이지 수 초기화
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		} else if (pageNum.equals("")) {
			pageNum = "1";
		}
		// startPage , endPage 구하는 식
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(pageNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int pageCount = (nCount / pageSize) + (nCount % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = ((currentPage / pageBlock)) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;

		// 페이징 rownum 구하기
		int startRnum = ((currentPage - 1) * pageSize) + 1; // 거의 공식
		int endRnum = startRnum + pageSize - 1; // currentPage*pageSize
		System.out.println("시작페이징 ~ 끝 페이징 : " + startRnum + " - " + endRnum);

		// 이전 다음 기능
		int prev = 1;
		int next = 1;
		if (startPage != 1) {
			prev = startPage - 1;
		}
		if (endPage > pageCount) {
			next = endPage + 1;
		}
		System.out.println(prev + "이전 - 다음" + next);
		List<NoticeVO> list = noticeService.noticeList(startRnum, endRnum); /* 변경 : 메소드 */

		// 보내주기
//		HttpSession session = request.getSession(); // 세션 가져오기

		// 세션에 데이터 설정
//		String search_error = (String) session.getAttribute("search_error");
//		System.out.println(search_error);
		
		// 세션에 데이터 다시 설정
//		session.setAttribute("search_error", search_error);
		
		String search_error = (String) request.getAttribute("search_error");
		System.out.println(search_error);
		request.setAttribute("search_error", search_error);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PageNum", currentPage);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("prev", prev);
		request.setAttribute("next", next);

		request.setAttribute("fBoardList", list); /* 변경 : el태그 - jsp이랑 맞추기 */
		System.out.println(list.size() + ", " + startPage + ", " + endPage);
		
		return "fBoardList";  // 이동경로
		
	}

}
