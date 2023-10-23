package kr.or.lis.controller.book;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;

import kr.or.lis.common.Controller;
import kr.or.lis.service.BookService;
import kr.or.lis.service.BookServiceImpl;
import kr.or.lis.service.BorrowService;
import kr.or.lis.service.BorrowServiceImpl;
import kr.or.lis.vo.BorrowVO;

public class BorrowController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BookService book = BookServiceImpl.getInstance();
		BorrowService borrow = BorrowServiceImpl.getInstance();
		
		HttpSession session = request.getSession(true);
		
		String mno = (String) session.getAttribute("mno");
		int b_no = book.getNextBno(); 
		BorrowVO b = new BorrowVO();
		int bor_no = borrow.getNextBorNo();
		
        b.setBor_no(bor_no);
        b.setMno(mno);
        b.setB_no(b_no);
        
        int re = borrow.insertBorrow(b);
        
        // JSON 응답 생성
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.add("result", new JsonPrimitive(re));

        // JSON 응답을 클라이언트로 전송
        response.setContentType("application/json;charset=utf8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        out.print(gson.toJson(jsonResponse));
        out.flush();
		
		return null;
	}

}
