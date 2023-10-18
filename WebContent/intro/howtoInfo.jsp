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
<title>도서 통합 정보 시스템 - 대출/반납/연장</title>
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
						<h2>대출/반납/연장</h2>
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
					<li class="list-item active">
						<a href="${ctx}/intro/howtoInfo.do" style="background: #FFFDE4;">대출/반납/연장<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/noticeList.do">공지사항<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/faqList.do">자주하는질문<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/qnaList.do">묻고 답하기<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/addrViewpageAPI.do">오시는길<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
				</ul>
			</div>

			<a href="${ctx}/qnaList.do"
				class="link_inquire"> <span class="emph">도움이 필요하신가요 ?</span>
				1:1 문의하기
			</a>
		</div>

		<div class="page_section">
			<div class="card">
				<div class="card-header">
					<ul class="nav nav-tabs card-header-tabs" id="info-list" role="tablist">
						<li class="nav-item">
							<a class="nav-link active siteMapAnchor" href="#borrow" href="#description" role="tab" aria-controls="borrow" aria-selected="true">대출안내</a>
						</li>
						<li class="nav-item">
							<a class="nav-link siteMapAnchor" href="#return" role="tab" aria-controls="return" aria-selected="false">반납안내</a>
						</li>
						<li class="nav-item">
							<a class="nav-link siteMapAnchor" href="#delay"role="tab" aria-controls="delay" aria-selected="false">연장안내</a>
						</li>
					</ul>
				</div>
				
				<div class="card-body" style="height: 400px">
					<div class="tab-content mt-3">
						<div class="tab-pane active" id="borrow" role="tabpanel">	
							<div class="pb-4">
								<h5 class="card-title">대출권수</h5>
								<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;1인 5권까지</p>
								<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;대출도서에 포함된 부록은 권수에 포함 안됨</p>
							</div>	
							<div class="pb-4">
								<h5 class="card-title">대출기간</h5>
								<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;대출일로부터 14일까지</p>
								<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;연체시 연체된 날짜만큼 대출 제한 </p>
							</div>
							<div class="pb-4">
								<h5 class="card-title">재대출</h5>
								<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;대출도서 반납 승인 후 재대출 가능</p>
								<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;본인이 연체자인 경우에는 연장이나 재대출 제한</p>
							</div>	
						</div>
	
						<div class="tab-pane" id="return" role="tabpanel" aria-labelledby="return-tab">  
							<h5 class="card-title">도서반납</h5> 
							<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;반납신청</p>
							<p class="card-text howtoText pl-4">LIS 홈페이지 [나의도서 > 대출현황] 에서 반납할 자료를 선택한 후 [반납신청] 버튼을 클릭합니다.</p>	
							<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;택배접수(반납)</p>
							<p class="card-text howtoText  pl-4">담당자가 반납신청을 확인하여 반납택배를 예약해드립니다. [택배접수(반납) 단계]</p>
							<p class="card-text howtoText m-2"><i class="fas fa-angle-right"></i>&nbsp;&nbsp;반납완료</p>
							<p class="card-text howtoText pl-4">반납자료가 LIS에 도착한 후 담당자가 확인처리하면 반납완료됩니다.</p>
						</div>
	
						<div class="tab-pane" id="delay" role="tabpanel" aria-labelledby="delay-tab">  
							<h5 class="card-title">반납연장</h5> 
							<p class="card-text howtoText m-2">LIS 서비스는 참여도서관의 협력으로 이루어지고 있으며,</p>
							<p class="card-text howtoText m-2">각 도서관 시스템에서 별도로 대출처리 후 서비스를 제공하기 때문에</p>
							<p class="card-text howtoText m-2">LIS 홈페이지에서 바로 대출기간 연장처리가 불가능합니다.</p>
							<p class="card-text howtoText m-2">대출기간 연장은 해당도서관으로 문의해주시기 바랍니다.</p>
							<p class="card-text howtoText m-2">(LIS 반납예정일은 택배반납 신청을 위한 참고사항이고,</p>
							<p class="card-text howtoText m-2">실제 대출자료의 연기 또는 연체는 해당 도서관에서 처리합니다.)</p>	  
						</div>					
					</div>
				</div>
				
			</div>



			<script>
				$('#info-list a').on('click', function (e) {
					e.preventDefault()
					$(this).tab('show')
				})
			</script>

		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>