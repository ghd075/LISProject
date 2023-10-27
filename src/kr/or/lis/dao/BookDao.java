package kr.or.lis.dao;

import java.util.List;

import kr.or.lis.vo.BookVO;

public interface BookDao {
	
	// 북 정보 가져오기
	public BookVO findByNo(int b_no);
	
	// 책디테일에서 책저장
	public int insertBook(BookVO b);
	
	//대여시 대여 책번호 삽입
	public int getNextBno();
	
	// 사서추천도서 목록
	public List<BookVO> findAllRecom();
	
	// 이달의 인기도서 목록	
	public List<BookVO> getPopBook();
	
	// 신착도서
	public List<BookVO> findAllNew();
}
