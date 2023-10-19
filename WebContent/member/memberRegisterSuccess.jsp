
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
<link href="${ctx}/css/success.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
  
<title>도서 통합 정보 시스템</title>
<style>
   .display-4, .lead {
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 300;
    margin: 20px 0;
    letter-spacing: 2px; /* 글자 간격 조정 */
  }

   .btn.btn-outline-success.btn-lg {
    transition: background-color 0.3s;
  	padding: 15px 30px; /* 버튼 크기 조정 */
    background: linear-gradient(45deg, #4CAF50, #FFD700); /* 초록색과 연두색 섞인 배경 */
    border: none;
    color: #fff;
  	 font-size: 2em;
  }

  .btn.btn-outline-success.btn-lg:hover {
    background-color: #28a745; /* 호버 시 배경색 변경 */
    color: #fff; /* 호버 시 글자색 변경 */
  	 
  }
   .lead {
    margin-bottom: 30px; /* 아래 여백 추가 */
  }
  .display-4 {
    font-size: 2em; /* 크기 조정 */
  }
</style>
</head>
<body>
	 <div id="insertCustomerOk">
		<img class="img-fluid insertCustomerImg"
			src="${ctx}/images/insertCustomerOk.gif"
			width="250px" />
		<h1 class="display-4"
			style="font-family: 'Noto Sans KR'; font-weight: 300"><b>회원가입을
			환영합니다.</b></h1>
		<p class="lead" style="font-family: 'Noto Sans KR' font-weight : 300">
			지금부터 LIS 서비스 이용이 가능합니다.</p>
		<hr />
		<a class="button button--tamaya button--border-thick" data-text="로그인" href="${ctx}/member/memberLogin.do"
			role="button"><span>로그인</span></a>
	</div>
	<br><br><br><br><br>
</body>
</html>