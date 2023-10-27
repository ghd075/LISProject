package kr.or.lis.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.lis.common.Controller;
import kr.or.lis.service.BorrowService;
import kr.or.lis.service.BorrowServiceImpl;
import kr.or.lis.vo.BorrowVO2;

public class BorrowListController implements Controller {
	public static int pageSIZE =  12;   //한 페이지에 보여줄 게시글의 수
	public static int pageMAX =  5;      //한 페이지에서 페이징바 수
	public static int totalCount  = 0;   
	public static int totalPage = 0;   
	public static int updateHit = 0;
	public static int nextId;
	public static int nextNo;
	public static int pageNUM = 1;
	
	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BorrowService borrow = BorrowServiceImpl.getInstance();
		
		HttpSession session = request.getSession(true);
		
		String mno = (String) session.getAttribute("mno");
		
		totalCount = borrow.getTotalCount(mno);
		totalPage = (int) Math.ceil((double) totalCount / pageSIZE);
		
		request.setAttribute("b", borrow.selectBycust_No(mno));
        request.setAttribute("totalCount", totalCount);
        
        List<BorrowVO2> list = borrow.selectBycust_No(mno);
        
        System.out.println("날짜 : " + list.toString());
		
		return "borrowList";
	}

}
