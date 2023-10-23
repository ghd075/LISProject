package kr.or.lis.dao;

public interface BorrowDao {
	
    // 고객번호에 해당하는 대출 번호 조회
    public int calB_no(String mno);
    
	// 연체 여부 확인
    public int delay(String mno);
    
    // 연체 일수 계산
    public int delay2(String mno);
}
