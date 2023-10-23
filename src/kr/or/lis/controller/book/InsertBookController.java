package kr.or.lis.controller.book;

import java.io.IOException;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.lis.common.Controller;
import kr.or.lis.common.Message;
import kr.or.lis.service.BookService;
import kr.or.lis.service.BookServiceImpl;
import kr.or.lis.vo.BookVO;

public class InsertBookController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BookService book = BookServiceImpl.getInstance();
		
		int b_no = book.getNextBno();
        String b_title = request.getParameter("b_title");
        String[] b_publisher_list = {
            "은행나무", "시공주니어", "보물창고", "웅진주니어", "주니어김영사", "좋은책어린이", "팩토리나인",
            "지서연", "흔들의자", "더북컴퍼니", "상상앤미디어", "폭스코너", "앨리스북클럽", "흐름출판", "델피노",
            "문학동네", "문학수첩", "에듀윌", "심슨북스", "지식노마드", "더퀘스트", "민음사", "부크크(Bookk)",
            "전망", "스토리존", "창비"
        };
        
        Random random = new Random();
        int ran_num = random.nextInt(b_publisher_list.length);
        String b_publisher = b_publisher_list[ran_num];
        String b_writer = request.getParameter("b_writer");
        String String_b_year = request.getParameter("b_year");
		
        // 2015-12-07T00:00:00.000+09:00 나와서 분리 시켜서 DB에 넣어야합니다.
        StringTokenizer tokenizer = new StringTokenizer(String_b_year, "T");
        String firstToken = tokenizer.nextToken();
        
        // 연도를 추출하여 문자열로 저장
        java.sql.Date b_year = java.sql.Date.valueOf(firstToken);
        
        int b_price = Integer.parseInt(request.getParameter("b_price"));
        String b_image = request.getParameter("b_image");
        String b_detail = request.getParameter("b_detail");        
        
        System.out.println("값을 받아옵니다++" + b_detail);
        
        String b_index = "목차";
        int b_count = 10;
        
        // BookVO 생성
        BookVO b = new BookVO();
        b.setB_no(b_no);
        b.setB_title(b_title);
        b.setB_publisher(b_publisher);
        b.setB_writer(b_writer);
        b.setB_year(b_year); // 연도만 저장
        b.setB_price(b_price);
        b.setB_image(b_image);
        b.setB_detail(b_detail);
        b.setB_index(b_index);
        b.setB_count(b_count);
        b.setC_no(1);

        int re = book.insertBook(b);

        // JSON 응답 생성
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(new Message(re + ""));

        // JSON 응답을 클라이언트로 전송
        response.setContentType("application/json;charset=utf8");
        response.getWriter().write(jsonResponse);
		return null;
	}

}
