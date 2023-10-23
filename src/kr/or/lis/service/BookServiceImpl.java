package kr.or.lis.service;

import kr.or.lis.dao.BookDao;
import kr.or.lis.dao.BookDaoImpl;
import kr.or.lis.vo.BookVO;

public class BookServiceImpl implements BookService {
	private BookDao dao;
	
	private static BookServiceImpl service;
	
	private BookServiceImpl() {
		dao = BookDaoImpl.getInstance();
	}
	
	public static BookServiceImpl getInstance() {
		if(service == null) service = new BookServiceImpl();
		return service;
	}
	
	@Override
	public BookVO findByNo(int b_no) {
		return dao.findByNo(b_no);
	}

	@Override
	public int insertBook(BookVO b) {
		return dao.insertBook(b);
	}

}
