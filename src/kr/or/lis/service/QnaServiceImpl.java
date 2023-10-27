package kr.or.lis.service;

import java.util.List;

import kr.or.lis.dao.QnaDao;
import kr.or.lis.dao.QnaDaoImpl;
import kr.or.lis.vo.NoticeVO;
import kr.or.lis.vo.ReplyVO;

public class QnaServiceImpl implements QnaService {
	
private QnaDao dao;
	
	private static QnaServiceImpl service;
	
	private QnaServiceImpl() {
		dao = QnaDaoImpl.getInstance();
	}
	
	public static QnaServiceImpl getInstance() {
		if(service == null) service = new QnaServiceImpl();
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
	
	@Override
	public int replyWrite(NoticeVO vo)
	{
        return dao.replyWrite(vo);
	}
	
	@Override
	public List<ReplyVO> getReply(int nno)
	{
        return dao.getReply(nno);
	}
	
	@Override
	public int replyDelete(int nno)
	{
		return dao.replyDelete(nno);
	}
	
	@Override
	public ReplyVO getReplyOne(int rno)
	{
		return dao.getReplyOne(rno);
	}
	@Override
	public int replyUpdate(ReplyVO vo)
	{
		return dao.replyUpdate(vo);
	}
	
	@Override
	public int getReplyCnt(int nno)
	{
		return dao.getReplyCnt(nno);
	}

	
}
