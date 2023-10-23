package kr.or.lis.service;

import kr.or.lis.dao.BorrowDao;
import kr.or.lis.dao.BorrowDaoImpl;

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

}
