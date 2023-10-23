package kr.or.lis.service;

import java.util.List;

import kr.or.lis.vo.NoticeVO;

public interface MainService {
	public List<NoticeVO> getMainNotice();
	
	public List<NoticeVO> getMainCBoard();
	
	public List<NoticeVO> getMainUBoard();
}
