package kr.or.lis.controller.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.lis.common.Controller;
import kr.or.lis.service.BorrowService;
import kr.or.lis.service.BorrowServiceImpl;

public class UpdateBorrowController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BorrowService borrow = BorrowServiceImpl.getInstance();
		
        String[] folNoArr = request.getParameterValues("fol_no_arr[]");
        System.out.println("folNoArr : " + folNoArr);
        int[] result = new int[folNoArr.length];
        int re = -1;

        for (int i = 0; i < folNoArr.length; i++) {
            result[i] = borrow.updateBorrow(Integer.parseInt(folNoArr[i])); // {1, 1, 1, -1}
        }

        boolean allDeleted = true;
        boolean someDeleted = false;

        for (int i = 0; i < result.length; i++) {
            if (result[i] == -1) {
                allDeleted = false;
                break;
            } else if (result[i] == 1) {
                someDeleted = true;
            }
        }

        if (allDeleted) {
            re = 1;
        } else if (someDeleted) {
            re = -2;
        }

        response.setContentType("text/plain");
        response.getWriter().write(String.valueOf(re));
		return null;
	}
}
