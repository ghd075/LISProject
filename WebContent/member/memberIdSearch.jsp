<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<%=request.getContextPath()%>/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/memberSearch.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>도서 통합 정보 시스템</title>
<script>
 function goIdSearch(){
	 var frm=document.idSearchfrm;
	 frm.action="<%=request.getContextPath()%>
	/memberIdSearch.do";
		frm.method = "post";
		frm.submit();
	}
</script>
</head>
<body>

	<form class="form_wrap" name="idSearchfrm">
		<div class="id_search_res">
			<c:if test="${not empty id_search_error}">
				${id_search_error }
			</c:if>

		</div>
		<!-- 타이틀 -->
		<h1 class="heroTitle">
			<span class="heroTitle_dot"><i class="fas fa-book-open"></i></span>&nbsp;&nbsp; <span class="heroTitle_kor">아이디 찾기</span>
		</h1>
		<table id="id_search_tbl">
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td colspan="4"><input type="text" id="mname"
					class="input_id_search" name="mname"
					placeholder="가입 시 등록했던 이름을 입력해주세요"></td>

			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td colspan="4"><input type="text" id="memail"
					class="input_id_search" name="memail"
					placeholder="가입 시 등록했던 이메일을 입력해주세요"></td>
			</tr>
			<tr>
				<td colspan="5" class="form_login_btn"><button
						class="form_btn1" onclick="goIdSearch();">찾기</button></td>
			</tr>


		</table>
		<br><br><br><br><br>
	</form>
</body>
</html>