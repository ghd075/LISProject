package kr.or.lis.dao;

import kr.or.lis.vo.BookVO;

public interface BookDao {
	
	// 북 정보 가져오기
	public BookVO findByNo(int b_no);
	
	// 책디테일에서 책저장
	public int insertBook(BookVO b);
	
	//대여시 대여 책번호 삽입
	public int getNextBno();
}
