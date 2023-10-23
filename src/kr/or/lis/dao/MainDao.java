package kr.or.lis.dao;

import java.util.List;

import kr.or.lis.vo.NoticeVO;

public interface MainDao {
	
	public List<NoticeVO> getMainNotice();

	public List<NoticeVO> getMainCBoard();
	
	public List<NoticeVO> getMainUBoard();
}
