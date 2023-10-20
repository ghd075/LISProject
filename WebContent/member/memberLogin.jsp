
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${ctx}/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${ctx}/css/memberLogin.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 구글폰트 전체 기본적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>도서 통합 정보 시스템 - 로그인</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>	
<script>
 function goLogin(){
	 
		var frm=document.login_frm;
			frm.action="<c:url value='/member/memberLoginF.do'/>";
			frm.method = "post";
			frm.submit();
		}
 </script>
</head>
<body>

	<form name="login_frm" class="form_wrap">
		<c:if test="${not empty login_error}">
			<script type="text/javascript">
				Swal.fire('${login_error}', '', 'error');
			</script>
		</c:if>
		<!-- 타이틀 -->
		<h1 class="heroTitle">
			<span class="heroTitle_dot"><i class="fas fa-book-open"></i></span>&nbsp;&nbsp; <span class="heroTitle_kor">로그인</span>
		</h1>
		<table id="login_tbl">

			<tr class="login_input_border">
				<td colspan="5" class="input_login_wrap"><input type="text"
					name="mid" id="mid" class="input_login" size="20" tabindex="1"
					placeholder="아이디를 입력해주세요"></td>

			</tr>
			<tr class="login_input_border">
				<td colspan="5"><input type="password" id="mpw"
					class="input_login" name="mpw" size="20" tabindex="1"
					placeholder="비밀번호를 입력해주세요"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="checkbox" id="login_keep"
					name="login_keep" width="20px"> <label for="login_keep"
					class="login_font_size">로그인 상태 유지</label></td>
				<td colspan="2"><p id="login_search">
						<a href="${ctx}/member/memberIdSearch.do" class="login_font_size">아이디 찾기</a>&nbsp;
						| &nbsp; <a href="${ctx}/member/memberPwSearch.do" class="login_font_size">비밀번호
							찾기</a>
					</p></td>
			</tr>
			<tr>
				<td colspan="5" class="form_login_btn"><button
						class="form_btn1" onclick="goLogin();">로그인</button></td>
			</tr>
			<tr>
				<td colspan="5" class="form_login_btn"><button type="button"
						class="form_btn2" onclick="location.href='${ctx}/member/memberRegister.do'">회원가입</button></td>
			</tr>

		</table>
	</form>
	<br><br><br><br><br>
</body>
</html>