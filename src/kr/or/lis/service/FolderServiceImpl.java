package kr.or.lis.service;

import java.util.List;

import kr.or.lis.dao.FolderDao;
import kr.or.lis.dao.FolderDaoImpl;
import kr.or.lis.vo.FolderVO;

public class FolderServiceImpl implements FolderService {
	private FolderDao dao;
	
	private static FolderServiceImpl service;
	
	private FolderServiceImpl() {
		dao = FolderDaoImpl.getInstance();
	}
	
	public static FolderServiceImpl getInstance() {
		if(service == null) service = new FolderServiceImpl();
		return service;
	}
	@Override
	public List<FolderVO> selectByNo(int mno) {
		return dao.selectByNo(mno);
	}

	@Override
	public int pageByFolder(int mno) {
		return dao.pageByFolder(mno);
	}

}
