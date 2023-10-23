package kr.or.lis.dao;

import java.util.List;

import kr.or.lis.vo.NoticeVO;

public interface CBoardDao {
	
	// 공지사항 검색기능
	public List<NoticeVO> noticeSearch(String nSearch, int start, int end);
	
	// 공지사항 검색 페이징 - 총 검색결과 수
	public int getSearchCount(String nSearch);
	
	// 공지사항 목록 페이징 - 공지사항 총 글 개수
	public int getBoardCount();
	
	// 공지사항 목록 메소드
	public List<NoticeVO> noticeList(int start, int end);
	
	// 공지사항 상세페이지
	public NoticeVO noticeDetail(int nno);
	
	// 공지사항 글 작성
	public int noticeWrite(NoticeVO vo);
	
	// 공지사항 글 수정
	public int noticeUpdate(NoticeVO vo, int nno);
	
	// 공지사항 글 삭제
	public int noticeDelete(int nno);
	
	// 조회수 메소드
	public int viewCount(int nno);
}
