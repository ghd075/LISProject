package kr.or.lis.frontcontroller;

import java.util.HashMap;

import kr.or.lis.common.Controller;
import kr.or.lis.controller.*;
import kr.or.lis.controller.book.*;
import kr.or.lis.controller.community.*;
import kr.or.lis.controller.intro.*;
import kr.or.lis.controller.member.*;


public class HandlerMapping {
  private HashMap<String, Controller> mappings;
  public HandlerMapping() {
	  mappings = new HashMap<String, Controller>();
	  
	  /**
	   * 회원가입/로그인 페이지 관련
	   */
	  mappings.put("/LisMain.do", new MainController()); //메인화면 이동
	  mappings.put("/member/memberRegister.do", new MemberRegisterController());		// 회원가입화면 이동
	  mappings.put("/member/memberLogin.do", new LoginFormController());				// 로그인화면 이동
	  mappings.put("/member/memberIdSearch.do", new IdSearchController());				// ID찾기 화면 이동
	  mappings.put("/member/memberIdSearchError.do", new IdSearchErrorController());	// ID찾기실패페이지 화면 이동
	  mappings.put("/member/memberPwSearch.do", new PwSearchController());				// 비밀번호찾기 화면 이동
	  
	  mappings.put("/member/memberLoginF.do", new MemberLoginController());				//로그인 기능
	  mappings.put("/member/memberLogout.do", new MemberLogoutController());			//로그아웃 기능
	  mappings.put("/member/IdSearch.do", 	new MemberIdSearchController());			//ID찾기 기능
	  mappings.put("/member/PwSearch.do", 	new MemberPwSearchController());			//PW찾기 기능
	  mappings.put("/member/memberPwtmpSend.do", new MemberPwtmpSendController());		//임시비밀번호보내기 기능
	  mappings.put("/member/CheckId.do", new CheckIdController());						//아이디 중복체크 기능
	  mappings.put("/member/CheckEmail.do", new CheckEmailController());				//이메일 중복체크 기능
	  mappings.put("/member/memberJoin.do", new MemberJoinController());				//회원가입 기능
	  
	  /**
	   * 도서관 소개 페이지 관련
	   */
	  mappings.put("/intro/howtoInfo.do", new HowToInfoController()); 					// 반납/대출/연장 화면 이동
	  mappings.put("/intro/addrViewpageAPI.do", new AddrViewController()); 				// 찾아오시는 길 화면 이동
	  mappings.put("/intro/faqList.do", new FaqListController()); 						// 자주하는 질문 화면 이동
	  
	  mappings.put("/intro/noticeList.do", new NoticeListController()); 				// 공지사항 화면 이동
	  mappings.put("/intro/noticeDetail.do", new NoticeDetailController()); 			// 공지사항 상세화면 이동
	  mappings.put("/intro/noticeSearch.do", new NoticeSearchController()); 			// 공지사항 검색화면 이동
	  mappings.put("/intro/noticeWriteF.do", new NoticeWriteFormController()); 			// 공지사항 글쓰기화면 이동
	  mappings.put("/intro/noticeWrite.do", new NoticeWriteController()); 				// 공지사항 글쓰기 기능
	  mappings.put("/intro/noticeDelete.do", new NoticeDeleteController()); 			// 공지사항 글 삭제 기능
	  mappings.put("/intro/noticeUpdateF.do", new NoticeUpdateFormController()); 		// 공지사항 글 수정화면 기능
	  mappings.put("/intro/noticeUpdate.do", new NoticeUpdateController()); 			// 공지사항 글 수정 기능
	  
	  mappings.put("/intro/qnaList.do", new QnaListController()); 						// 묻고답하기 화면 이동
	  mappings.put("/intro/qnaDetail.do", new QnaDetailController()); 					// 묻고답하기 상세화면 이동
	  mappings.put("/intro/qnaSearch.do", new QnaSearchController()); 					// 묻고답하기 검색화면 이동
	  mappings.put("/intro/qnaWrite.do", new QnaWriteController()); 					// 묻고답하기 글 쓰기
	  mappings.put("/intro/qnaDelete.do", new QnaDeleteController()); 					// 묻고답하기 글 삭제
	  mappings.put("/intro/qnaUpdate.do", new QnaUpdateController()); 					// 묻고답하기 글 수정
	  mappings.put("/intro/qnaReply.do", new QnaReplyController()); 					// 댓글 리스트
	  mappings.put("/intro/qnaReplyWrite.do", new QnaReplyWriteController()); 			// 묻고답하기 글 수정
	  mappings.put("/intro/qnaReplyDelete.do", new QnaReplyDeleteController()); 		// 묻고답하기 글 삭제
	  mappings.put("/intro/qnaReplyUpdate.do", new QnaReplyUpdateController()); 		// 묻고답하기 글 업데이트
	  mappings.put("/intro/chatWindow.do", new ChatWindowController()); 				// 1:1 채팅 기능	  
	  
	  /**
	   * 도서 검색
	   */
	  mappings.put("/book/SearchResult.do", new SearchResultController()); 				// 도서검색 화면 이동
	  mappings.put("/book/detailBook.do", new DetailBookController()); 					// 도서 상세 화면 이동
	  mappings.put("/book/insertBorrow.do", new BorrowController()); 					// 도서 대여 기능 
	  mappings.put("/book/insertBook.do", new InsertBookController()); 					// 도서정보 삽입 기능 
	 
	  /**
	   * 커뮤니티 페이지 관련
	   */
	  mappings.put("/community/cBoardList.do", new CBoardListController());     		// 창작물게시판 화면 이동
	  mappings.put("/community/cBoardDetail.do", new CBoardDetailController()); 		// 창작물게시판 상세화면 이동
	  mappings.put("/community/cBoardSearch.do", new CBoardSearchController()); 		// 창작물게시판 검색화면 이동
	  mappings.put("/community/cBoardWrite.do", new CBoardWriteController()); 			// 창작물게시판 글쓰기 기능
	  mappings.put("/community/cBoardDelete.do", new CBoardDeleteController()); 		// 창작물게시판 글 삭제 기능
	  mappings.put("/community/cBoardUpdate.do", new CBoardUpdateController()); 		// 창작물게시판 글 수정 기능
	 
	  mappings.put("/community/uBoardList.do", 	new UBoardListController()); 			// 중고장터게시판 화면 이동
	  mappings.put("/community/uBoardDetail.do", new UBoardDetailController()); 		// 중고장터 상세화면 이동
	  mappings.put("/community/uBoardSearch.do", new UBoardSearchController());	 		// 중고장터 검색화면 이동
	  mappings.put("/community/uBoardWrite.do", new UBoardWriteController()); 			// 중고장터 글쓰기 기능
	  mappings.put("/community/uBoardDelete.do", new UBoardDeleteController()); 		// 중고장터 글 삭제 기능
	  mappings.put("/community/uBoardUpdate.do", new UBoardUpdateController()); 		// 중고장터 글 수정 기능
	 
	  mappings.put("/community/fBoardList.do", new FBoardListController()); 			// 자유게시판 화면 이동
	  mappings.put("/community/fBoardDetail.do", new FBoardDetailController()); 		// 자유게시판 상세화면 이동
	  mappings.put("/community/fBoardSearch.do", new FBoardSearchController()); 		// 자유게시판 검색화면 이동
	  mappings.put("/community/fBoardWrite.do", new FBoardWriteController()); 			// 자유게시판 글쓰기 기능
	  mappings.put("/community/fBoardDelete.do", new FBoardDeleteController()); 		// 자유게시판 글 삭제 기능
	  mappings.put("/community/fBoardUpdate.do", new FBoardUpdateController()); 		// 자유게시판 글 수정 기능	  
  }
  public Controller getController(String key) { // key => /memberRegister.do
	  return mappings.get(key);
  }
}
