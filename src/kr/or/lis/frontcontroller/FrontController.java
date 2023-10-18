package kr.or.lis.frontcontroller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 한글 깨짐방지
		request.setCharacterEncoding("utf-8");
		
		// uri : /Lib/RegisterForm.do
		String url = request.getRequestURI();
		System.out.println(url);
		
		// contextPath 구하기(/Lib)
		String ctx = request.getContextPath();
		System.out.println(ctx);
		
		// 경로 구하기
		String path=url.substring(ctx.length());
		System.out.println(path); // /RegisterForm.do
		
		Controller controller = null;
		String nextPage = null;
		
		// 핸들러매핑->HandlerMapping
	    HandlerMapping mapping = new HandlerMapping();
	    controller = mapping.getController(path);
	    nextPage = controller.requestHandler(request, response);
		// forward, redirect
		if(nextPage != null) {
			if(nextPage.indexOf("redirect:")!=-1) {
				//            redirect:/MVC04/memberList.do
				String searchError = request.getAttribute("search_error").toString();
//				response.sendRedirect(nextPage.split(":")[1]+"?search_error=" + searchError); // redirect
				
				if (searchError != null && !searchError.isEmpty()) {
				    String encodedSearchError = URLEncoder.encode(searchError, "UTF-8");
				    response.sendRedirect(nextPage.split(":")[1] + "?search_error=" + encodedSearchError);
				} else {
				    response.sendRedirect(nextPage.split(":")[1]);
				}
				
			}else {
				RequestDispatcher rd=request.getRequestDispatcher(ViewResolver.makeView(nextPage)); // forward
				rd.forward(request, response);
			}
		}	
	}

}
