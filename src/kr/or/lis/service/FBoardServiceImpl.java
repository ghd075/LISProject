package kr.or.lis.service;

import java.util.List;

import kr.or.lis.dao.FBoardDao;
import kr.or.lis.dao.FBoardDaoImpl;
import kr.or.lis.vo.NoticeVO;

public class FBoardServiceImpl implements FBoardService {
	private FBoardDao dao;
	
	private static FBoardServiceImpl service;
	
	private FBoardServiceImpl() {
		dao = FBoardDaoImpl.getInstance();
	}
	
	public static FBoardServiceImpl getInstance() {
		if(service == null) service = new FBoardServiceImpl();
		return service;
	}
	
	@Override
	public List<NoticeVO> noticeSearch(String nSearch, int start, int end) {

		return dao.noticeSearch(nSearch, start, end);
	}

	@Override
	public int getSearchCount(String nSearch) {
        return dao.getSearchCount(nSearch);
	}

	@Override
	public int getBoardCount() {
        return dao.getBoardCount();
	}

	@Override
	public List<NoticeVO> noticeList(int start, int end) {
        return dao.noticeList(start, end);
	}

	@Override
	public NoticeVO noticeDetail(int nno) {
        return dao.noticeDetail(nno);
	}

	@Override
	public int noticeWrite(NoticeVO vo) {
        return dao.noticeWrite(vo);
	}

	@Override
	public int noticeUpdate(NoticeVO vo, int nno) {
        return dao.noticeUpdate(vo, nno);
	}

	@Override
	public int noticeDelete(int nno) {
        return dao.noticeDelete(nno);
	}

	@Override
	public int viewCount(int nno) {
        return dao.viewCount(nno);
	}

}
