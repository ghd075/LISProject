<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>도서 통합 정보 시스템 - 자주하는질문</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css" />
<!-- 구글폰트 전체 기본적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200;300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Noto+Serif+KR:wght@200;300&display=swap"
	rel="stylesheet">
<!-- 구글폰트 전체 기본적용 END -->
<link rel="stylesheet" type="text/css"
	href="${ctx}/css/noticeList.css" />
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>

</head>
<body>

	<!-- PAGE HEADER -->
	<header id="page-header" class="noto-serif">
		<div class="page-header-overlay">
			<div class="container pt-5">
				<div class="row">
					<div class="col-md-6 m-auto text-center page-header-top">
						<h2>자주하는질문</h2>
					</div>
				</div>
			</div>
		</div>
	</header>


	<div id="c_main">
		<div id="c_nav">
			<h2 class="tit_c_nav">도서관 소개</h2>
			<div class="inner_nav">
				<ul class="list_menu">
					<li class="list-item">
						<a href="${ctx}/intro/howtoInfo.do">대출/반납/연장<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/noticeList.do">공지사항<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item active"><a href="${ctx}/intro/faqList.do" style="background: #FFFDE4;">자주하는질문<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/qnaList.do">묻고 답하기<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/addrViewpageAPI.do">오시는길<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
				</ul>
			</div>

			<a href="${ctx}/intro/qnaList.do"
				class="link_inquire"> <span class="emph">도움이 필요하신가요 ?</span>
				1:1 문의하기
			</a>
		</div>

		<div class="page_section faq">

			<div class="faq-inner">
				<div class="head_aticle">
					<h2 class="tit_a">
						자주하는 질문 <span class="tit_sub"> 고객님들이 자주 찾으시는 질문을 모았습니다 </span>
					</h2>
				</div>
				<div class="accordion">
					<div class="accordion-item">
						<div class="title"> 
								Q : 회원가입을 하면 편리한 점이 무엇인가요?
						</div>
						<div class="content">
								도서관 홈페이지 이용시 반복되던 신분확인 절차가 회원가입시 한번의 인증으로 간소화 됩니다.<br>
								홈페이지에서 등록된 아이디로 간편하게 도서관 서비스 신청이 가능합니다.<br>
								회원가입시 입력하신 관심 주제분야의 추천도서를 제공 받을 수 있습니다.
						</div>
					</div>
					<div class="accordion-item">
							<div class="title">
									Q : 등록된 내 정보를 변경하고 싶습니다.
							</div>
							<div class="content">
									LIS의 회원정보 변경은 고객님께서 직접 홈페이지 로그인 후<br>
									<strong>[마이페이지 > 회원정보 > 회원 정보 조회/수정]</strong>에서 정보를 변경하실 수 있습니다.<br>
							</div>
					</div>
					<div class="accordion-item">
							<div class="title">
									Q : 도서를 분실했는데 어떻게 하나요?
							</div>
							<div class="content">
									동일도서로 변상하여야 합니다. 시중에 책이 없을 경우에는 시가상당 금액으로 변상하여야 합니다.
							</div>
					</div>
					<div class="accordion-item">
							<div class="title">
									Q : 도서를 연체한 경우에는 어떻게 되나요?
							</div>
							<div class="content">
									도서의 연체일수 만큼 대출이 정지됩니다. 한 권만 연체해도 그 연체일수 사용할 수 없습니다.
							</div>
					</div>
					<div class="accordion-item">
							<div class="title">
									Q : 이사를 했는데 주소 변경은 어디에서 하나요?
							</div>
							<div class="content">
									LIS 홈페이지 로그인 후 <strong>[나의도서 -> 개인정보수정]</strong>에서 변경하실 수 있습니다.
							</div>
					</div>
					<div class="accordion-item">
							<div class="title">
									Q : 희망도서 신청은 어떻게 하며, 도서구입은 얼마나 자주하나요?
							</div>
							<div class="content">
									홈페이지 ‘묻고 답하기’ 에서 신청 가능합니다.<br><br>
									자료선정시 수험서, 학습교재, 오락성이 강한 출판물, 소장에 적합하지 않은 형태<br>
									(스프링제본, 색칠놀이책 등),시리즈・전집류 등은 신청이 제한될 수 있습니다.<br>
									도서구입은 매년 도서구입계획에 의해 정기적으로 구입하고 있습니다.
							</div>
					</div>					
				</div>
			</div>

		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	<script src="${ctx}/js/fqa.js"></script>
</body>
</html>