package kr.or.lis.service;

import kr.or.lis.vo.BookVO;

public interface BookService {
	// 북 정보 가져오기
	public BookVO findByNo(int b_no);
	
	// 책디테일에서 책저장
	public int insertBook(BookVO b);
}
