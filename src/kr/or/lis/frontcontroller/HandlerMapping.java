package kr.or.lis.frontcontroller;

import java.util.HashMap;

import kr.or.lis.common.Controller;
import kr.or.lis.controller.*;
import kr.or.lis.controller.book.SearchResultController;
import kr.or.lis.controller.intro.AddrViewController;
import kr.or.lis.controller.intro.FaqListController;
import kr.or.lis.controller.intro.HowToInfoController;
import kr.or.lis.controller.intro.NoticeDetailController;
import kr.or.lis.controller.intro.NoticeListController;
import kr.or.lis.controller.intro.NoticeSearchController;
import kr.or.lis.controller.member.IdSearchController;
import kr.or.lis.controller.member.LoginFormController;
import kr.or.lis.controller.member.MemberRegisterController;
import kr.or.lis.controller.member.PwSearchController;


public class HandlerMapping {
  private HashMap<String, Controller> mappings;
  public HandlerMapping() {
	  mappings=new HashMap<String, Controller>();
	  
	  /**
	   * 회원가입/로그인 페이지 관련
	   */
	  mappings.put("/LisMain.do", new MainController()); //메인화면 이동
	  mappings.put("/member/memberRegister.do", new MemberRegisterController());	//회원가입화면 이동
	  mappings.put("/member/memberLogin.do", new LoginFormController());			//로그인화면 이동
	  mappings.put("/member/memberIdSearch.do", new IdSearchController());			//ID찾기 화면 이동
	  mappings.put("/member/memberPwSearch.do", new PwSearchController());			//비밀번호찾기 화면 이동
	  
	  /**
	   * 도서관 소개 페이지 관련
	   */
	  mappings.put("/intro/howtoInfo.do", new HowToInfoController()); 				//반납/대출/연장 화면 이동
	  mappings.put("/intro/addrViewpageAPI.do", new AddrViewController()); 			//찾아오시는 길 화면 이동
	  mappings.put("/intro/faqList.do", new FaqListController()); 					//자주하는 질문 화면 이동
	  mappings.put("/intro/noticeList.do", new NoticeListController()); 			//공지사항 화면 이동
	  mappings.put("/intro/noticeDetail.do", new NoticeDetailController()); 		//공지사항 상세화면 이동
	  mappings.put("/intro/noticeSearch.do", new NoticeSearchController()); 		//공지사항 검색화면 이동
	  
	  
	  /**
	   * 도서 검색
	   */
	  mappings.put("/book/SearchResult.do", new SearchResultController()); 
  }
  public Controller getController(String key) { // key => /memberRegister.do
	  return mappings.get(key);
  }
}
