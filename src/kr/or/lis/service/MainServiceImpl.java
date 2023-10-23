package kr.or.lis.service;

import java.util.List;

import kr.or.lis.dao.MainDao;
import kr.or.lis.dao.MainDaoImpl;
import kr.or.lis.vo.NoticeVO;

public class MainServiceImpl implements MainService {
	private MainDao dao;
	
	private static MainServiceImpl service;
	
	private MainServiceImpl() {
		dao = MainDaoImpl.getInstance();
	}
	
	public static MainServiceImpl getInstance() {
		if(service == null) service = new MainServiceImpl();
		return service;
	}
	@Override
	public List<NoticeVO> getMainNotice() {
		
		return dao.getMainNotice();
	}

}
