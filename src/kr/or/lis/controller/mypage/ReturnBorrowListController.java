package kr.or.lis.controller.mypage;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.lis.common.Controller;
import kr.or.lis.service.BorrowService;
import kr.or.lis.service.BorrowServiceImpl;

public class ReturnBorrowListController implements Controller {
	public static int pageSIZE = 12; // 한 페이지에 보여줄 게시글의 수
	public static int pageMAX = 5; // 한 페이지에서 페이징바 수
	public static int totalCount = 0;
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
        
        HashMap<String, Object> map = new HashMap<>();
        
        totalCount = borrow.getTotalCount3(mno);
        
        totalPage = (int) Math.ceil((double) totalCount / pageSIZE);

        int startPage = (pageNUM - 1) / pageMAX * pageMAX + 1;
        int endPage = startPage + pageMAX - 1;
        if (endPage > totalPage) {
            endPage = totalPage;
        }
        
        int start = (pageNUM - 1) * pageSIZE + 1;
        int end = start + pageSIZE - 1;
        if (end > totalCount) {
            end = totalCount;
        }

        map.put("mno", mno);
        map.put("start", start);
        map.put("end", end);
        
        System.out.println("***start : " + start);
        System.out.println("***end : " + end);
        System.out.println("***startPage : " + startPage);
        System.out.println("***endPage : " + endPage);
        System.out.println("***totalPage : " + totalPage);

        request.setAttribute("b", borrow.selectBycust_No3(map));
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("startPage", startPage);
        request.setAttribute("endPage", endPage);
        request.setAttribute("pageNUM", pageNUM);
        
		return "return_borrowList";
	}

}
