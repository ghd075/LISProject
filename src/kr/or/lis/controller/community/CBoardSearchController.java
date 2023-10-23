package kr.or.lis.controller.community;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.CBoardService;
import kr.or.lis.service.CBoardServiceImpl;
import kr.or.lis.vo.NoticeVO;

public class CBoardSearchController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CBoardService noticeService = CBoardServiceImpl.getInstance();
		String nSearch = request.getParameter("nSearch");

		String nextPage = null;
		
		String ctx = request.getContextPath();
		
		// 페이징
		int pageSize = 10; // 페이지 당 글 수
		int pageBlock = 10; // 페이지 링크 수
		
		// 총 글 개수
		int nCount = noticeService.getSearchCount(nSearch); /* 변경 : 메소드 */
		System.out.println("총 글 개수 : " + nCount);
		
		// 페이지 수 초기화
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		} else if (pageNum.equals("")) {
			pageNum = "1";
		}
	    
		// startPage , endPage 구하는 식
		
		// 현재 페이지 설정
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(pageNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 페이지 수 계산
		int pageCount = (nCount / pageSize) + (nCount % pageSize == 0 ? 0 : 1);
		int startPage = 1;
		int endPage = 1;
		
		// 시작 페이지, 끝 페이지 계산
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		System.out.println("끝페이지 1 : " + endPage);

		// 페이징 rownum 구하기
		int startRnum = ((currentPage - 1) * pageSize) + 1; // 거의 공식
		int endRnum = startRnum + pageSize - 1; // currentPage*pageSize
		System.out.println("시작페이징 ~ 끝 페이징 : " + startRnum + " - " + endRnum);
		System.out.println("검색어:  " + nSearch);

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
		
		
		if (nSearch == null || nSearch.equals("")) {
			
			request.setAttribute("search_error", "검색어를 입력해주세요");
		    System.out.println("검색어가 null 인 경우");
		    nextPage = "redirect:" + ctx + "/community/cBoardList.do";
		} else {

		    
			List<NoticeVO> searchList = noticeService.noticeSearch(nSearch, startRnum, endRnum);
			System.out.println("searchList : " + searchList);
			
			request.setAttribute("startPage", startPage);
			System.out.println("시작페이지 : " + startPage);
			request.setAttribute("endPage", endPage);
			System.out.println("끝페이지2 : " + endPage);
		    request.setAttribute("PageNum", currentPage);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("prev", prev);
			request.setAttribute("next", next);
			request.setAttribute("searchList", searchList);
			request.setAttribute("nSearch", nSearch);
			System.out.println("검색 수 " + searchList.size() + ", " + startPage + ", " + endPage);
			nextPage = "cBoardSearch"; 		// 포워딩할 JSP 페이지 경로
		}
		
		return nextPage;
	}

}
