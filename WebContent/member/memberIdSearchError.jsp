<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link href="${ctx}/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${ctx}/css/memberSearch.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>도서 통합 정보 시스템</title>
</head>
<body>
	<form class="form_wrap">
		<h1 class="heroTitle">
			<span class="heroTitle_dot"><i class="fas fa-book-open"></i></span>&nbsp;&nbsp; <span class="heroTitle_kor">아이디 찾기</span>
		</h1>
		<table id="id_search_end_tbl">
			<tr>
				<td class="id_search_title"><svg width="50px" height="50px"
						viewBox="0 0 16 16" class="bi bi-file-person-fill"
						fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
							d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm-1 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm-3 4c2.623 0 4.146.826 5 1.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-1.245C3.854 11.825 5.377 11 8 11z" />
                      </svg></td>
			</tr>
			<tr>
				<td class="id_search_title">고객님께서 입력하신 정보가<br> 정확한지 확인 후
					다시 시도해주세요
				</td>
			</tr>


			<tr>
				<td class="form_login_btn"><input type="button"
					class="form_btn1" onclick="location.href='<c:url value="/member/memberIdSearch.do"/>'"
					value="아이디 다시 찾기"></td>
			</tr>
		</table>
			<br><br><br><br>
	</form>
</body>
</html>