package kr.or.lis.service;

import java.util.HashMap;
import java.util.List;

import kr.or.lis.dao.BorrowDao;
import kr.or.lis.dao.BorrowDaoImpl;
import kr.or.lis.vo.BorrowVO;
import kr.or.lis.vo.JoinVO;
import kr.or.lis.vo.BorrowVO2;

public class BorrowServiceImpl implements BorrowService {
	private BorrowDao dao;
	
	private static BorrowServiceImpl service;
	
	private BorrowServiceImpl() {
		dao = BorrowDaoImpl.getInstance();
	}
	
	public static BorrowServiceImpl getInstance() {
		if(service == null) service = new BorrowServiceImpl();
		return service;
	}
	@Override
	public int calB_no(String mno) {
		return dao.calB_no(mno);
	}

	@Override
	public int delay(String mno) {
		return dao.delay(mno);
	}

	@Override
	public int delay2(String mno) {
		return dao.delay2(mno);
	}

	@Override
	public int insertBorrow(BorrowVO b) {
		return dao.insertBorrow(b);
	}

	@Override
	public int getNextBorNo() {
		return dao.getNextBorNo();
	}
	@Override
	public List<BorrowVO2> selectBycust_No(String mno) {
		return dao.selectBycust_No(mno);
	}

	@Override
	public int getTotalCount(String mno) {
		return dao.getTotalCount(mno);
	}

	@Override
	public int updateBorrow(int bor_no) {
		return dao.updateBorrow(bor_no);
	}

	@Override
	public int getTotalCount3(String mno) {
		return dao.getTotalCount3(mno);
	}

	@Override
	public List<BorrowVO2> selectBycust_No3(HashMap<String, Object> map) {
		return dao.selectBycust_No3(map);
	}
	


	@Override
	public List<JoinVO> selBorrowList()
	{
		return dao.selBorrowList();
	}
}
