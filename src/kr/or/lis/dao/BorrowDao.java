package kr.or.lis.dao;

import java.util.HashMap;
import java.util.List;

import kr.or.lis.vo.BorrowVO;
import kr.or.lis.vo.JoinVO;
import kr.or.lis.vo.BorrowVO2;

public interface BorrowDao {
	// 대여 기능
	public int insertBorrow(BorrowVO b);
	
    // 고객번호에 해당하는 대출 번호 조회
    public int calB_no(String mno);
    
	// 연체 여부 확인
    public int delay(String mno);
    
    // 연체 일수 계산
    public int delay2(String mno);
    
	//대여시 대여번호 삽입
    public int getNextBorNo();
    
    public List<JoinVO> selBorrowList();
    
  // 고객번호로 반납된 도서 목록 조회
    public List<BorrowVO2> selectBycust_No(String mno);
    
    // 대출 목록의 총 개수 조회
    public int getTotalCount(String mno);
    
    // 도서 반납 처리
    public int updateBorrow(int bor_no);  
    
    // 현재 대출 중인 도서 개수 조회
    public int getTotalCount3(String mno);
    
    // 고객번호로 현재 대출 중인 도서 목록 조회
    public List<BorrowVO2> selectBycust_No3(HashMap<String, Object> map);
}
