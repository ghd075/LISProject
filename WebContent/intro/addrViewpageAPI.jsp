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
<title>도서 통합 정보 시스템 - 오시는길</title>
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
<!--네이버 지도 API-->
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=892i529vls"></script>
</head>
<body>

	<!--도서관소개 PAGE HEADER -->
	<header id="page-header" class="noto-serif">
		<div class="page-header-overlay">
			<div class="container pt-5">
				<div class="row">
					<div class="col-md-6 m-auto text-center page-header-top">
						<h2>오시는길</h2>
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
					<li class="list-item"><a href="${ctx}/intro/noticeList.do" >공지사항<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/faqList.do">자주묻는질문<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/qnaList.do">묻고 답하기<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item active"><a href="${ctx}/intro/addrViewpageAPI.do" style="background: #FFFDE4;">오시는길<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/libarayInfo.do"">시설 안내도<span
					class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
				</ul>
			</div>

			<c:if test="${not empty member}">
			<a href="${ctx}/intro/chatWindow.do"
				class="link_inquire"> <span class="emph">도움이 필요하신가요 ?</span>
				1:1 문의하기
			</a>
		</c:if>
		</div>

		<div class="page_section">
			<div id="map" style="width: 100%; height: 300px;"></div>
			<code id="snippet" class="snippet"></code>
	
			<!-- 각자 발급받은 Client ID 값 넣기 -->

			<script id="code">
				var map = new naver.maps.Map('map', {
					center: new naver.maps.LatLng(36.32507, 127.4089), //지도의 초기 중심 좌표
					zoom: 17, //지도의 초기 줌 레벨
					minZoom: 8, //지도의 최소 줌 레벨
					zoomControl: true, //줌 컨트롤의 표시 여부
					zoomControlOptions: { //줌 컨트롤의 옵션
          position: naver.maps.Position.TOP_RIGHT
        }});
        var marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(36.32507, 127.4089),
            map: map
        });
			</script>

			<ul class="lis_info">
				<li class="addr"><i class="fas fa-map-marker-alt" ></i>대전광역시 중구 계룡로 846, 3층</li>
				<li class="tel"><i class="fas fa-phone-volume"></i>042-222-8202</li>
				<li class="subway"><i class="fas fa-subway"></i>서대전네거리역 4번출구, 오룡역 1번출구 </li>
				<li class="bus"><i class="fas fa-bus"></i>101, 103, 315, 603, 614, 618</li>
			</ul>

		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

</body>
</html>