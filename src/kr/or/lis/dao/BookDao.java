package kr.or.lis.dao;

import java.util.List;

import kr.or.lis.vo.BookVO;

public interface BookDao {
	
	// �� ���� ��������
	public BookVO findByNo(int b_no);
	
	// å�����Ͽ��� å����
	public int insertBook(BookVO b);
	
	//�뿩�� �뿩 å��ȣ ����
	public int getNextBno();
	
	// �缭��õ���� ���
	public List<BookVO> findAllRecom();
	
	// �̴��� �α⵵�� ���	
	public List<BookVO> getPopBook();
	
	// ��������
	public List<BookVO> findAllNew();
}
