package kr.or.lis.service;

import kr.or.lis.vo.BorrowVO;

public interface BorrowService {
	// 대여 기능
	public int insertBorrow(BorrowVO b);
	
    // 고객번호에 해당하는 대출 번호 조회
    public int calB_no(int b_no);
    
	// 연체 여부 확인
    public int delay(String mno);
    
    // 연체 일수 계산
    public int delay2(String mno);
    
	//대여시 대여번호 삽입
    public int getNextBorNo();
}
