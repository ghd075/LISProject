package kr.or.lis.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.MainService;
import kr.or.lis.service.MainServiceImpl;
import kr.or.lis.vo.NoticeVO;

public class MainController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MainService noticeService = MainServiceImpl.getInstance();
		
		List<NoticeVO> list = noticeService.getMainNotice();
		
		request.setAttribute("HNlist", list);
		
		return "main/main";
	}

}
