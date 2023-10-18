<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" type="text/css" href="${ctx}/css/reset.css" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<style>
* {
	margin: 0;
	outline: none;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	letter-spacing: -0.4px;
	width: 100%;
	position: relative;
	color: #333333;
	line-height: 24px;
}

a {
	color: #333333;
	text-decoration: none;
}

.Header {
	position:relative;
	z-index:999;	
	width: 100%;
	height: 190px;
	box-shadow: 0px 0px 7px #D5D5D5;
}

table, td {
	border-collapse: collapse;
}
/* 메인_회원가입 */
#mHeader1 {
	position: relative;
	width: 100%;
	height: 35px;
	background-color: #fff;
}

.mSubnav {
	position: relative;
	width: 1080px;
	margin: 0 auto;
}

.mSubnav ul {
	float: right;
	margin-top: 10px;
}

.mSubnav ul li {
	float: left;
	padding: 0px 5px 0px 5px;
	font-size: 14px;
	letter-spacing: -.3px;
}

ul.navi li a {
	color: #000;
	font-weight: 500;
}

ul.navi li a:hover {
	color: #38ef7d;
}

/* 로고 */
#mHeader2 {
	position: relative;
	width: 100%;
	height: 90px;
}

.mLogoWrap {
	position: relative;
	width: 1080px;
	margin: 0 auto;
}

#mLogo {
	position: absolute;
	width: 150px;
	height: 74px;
	margin: 0 40%;
}

/* 메인_네비 */
#mHeader3 {
	position: relative;
	width: 100%;
	height: 60px;
	background-color: white;
}

#mHeader3.fixed {
	position: fixed;
	height: 60px;
	z-index: 1;
	box-shadow: 0px 1px 3px #D5D5D5;
	top: 0;
}

.mMainnav_wrap {
	position: relative;
	width: 1080px;
	margin: 0 auto;
	z-index: 9999;
}

.mMainnav_wrap ul {
	width: 70%;
	height: 60px;
	line-height: 60px;
	float: left;
	list-style: none;
}

.mMainnav_wrap ul li {
	float: left;
	padding: 0 22px 0 22px;
}

.mMainnav_wrap ul li a:hover {
	color: #38ef7d;
}
/* 드롭다운 */
.mMainnav_wrap li ul {
	display: none;
	width: auto;
	height: auto;
	position: absolute;
	padding: 10px;
	line-height: 250%;
}

.mMainnav_wrap li:hover ul {
	clear: both;
	display: block;
	width: 180px; 
	background-color: rgba(253, 253, 253, 0.9);
}

.mMainnav_wrap ul li a {
	line-height: 20px;
	font-size: 15px;
	font-weight: 500;
}

.menu_line {
	color: #DCDCDC;
	font-size: 3px;
}


</style>
<script>
	$(document).ready(function() {
		var Mnav = $("#mHeader3").offset().top;
		$(window).scroll(function() {
			var window = $(this).scrollTop();
			if (Mnav <= window) {
				$("#mHeader3").addClass("fixed");
			} else {
				$("#mHeader3").removeClass("fixed");
			}
		});
		$(".mSubnav_cs").click(function(){
			$(".mSubnav_dropdown").toggle();
		});
	});
	
</script>
</head>
<body>
	<div class="Header">
		<div id="mHeader1">
			<div class="mSubnav">
				<c:if test="${empty member}">
					<ul class="navi">
						<li><a href="${ctx}/member/memberRegister.do" >회원가입</a></li>
						<li class="menu_line">|</li>
						<li><a href="${ctx}/member/memberLogin.do" >로그인</a></li>
					</ul>
				</c:if>

				<c:if test="${not empty member}">
					<c:if test="${member.authority eq 0}">
						<ul>
							<li><a href="${ctx}/MyOrderList.do">마이페이지</a></li>
							<li><a href="${ctx}/memberLogout.do">로그아웃</a></li>
						</ul>
					</c:if>
					<c:if test="${member.authority eq 1}">
						<ul>
							<li><a href="${ctx}/memberList.do">회원관리</a></li>
							<li><a href="${ctx}/memberLogout.do">로그아웃</a></li>
						</ul>
					</c:if>
				</c:if>
			</div>
		</div>
		<div id="mHeader2">
			<div class="mLogoWrap">
				<a href="${ctx}/LisMain.do"><img
					src="${ctx}/images/LIS_logo_darkGreen.png;" id="mLogo"
					width="350px" height="74px"></a>
			</div>
		</div>
		<div id="mHeader3">
			<div class="mMainnav_wrap">
				<nav>
					<ul>
						<li>
							<a href="${ctx}/intro/howtoInfo.do">도서관소개&nbsp;&nbsp;<i class="fas fa-caret-down"></i></a>
							<ul id="mMainnav_dropdown fade-down">
								<li><a href="${ctx}/intro/howtoInfo.do">대출/반납/연장</a></li>
								<li><a href="${ctx}/intro/noticeList.do">공지사항</a></li>
								<li><a href="${ctx}/intro/faqList.do">자주묻는질문</a></li>
								<li><a href="#">1:1 문의</a></li>
								<li><a href="${ctx}/intro/addrViewpageAPI.do">오시는길</a></li>
							</ul>
						</li>

						<li class="menu_line">|</li>
						<li>
							<a href="${ctx}/book/SearchResult.do">도서정보&nbsp;&nbsp;<i class="fas fa-caret-down"></i></a>
							<ul id="mMainnav_dropdown fade-down">
								<li><a href="${ctx}/book/SearchResult.do">자료검색</a></li>
								<li><a href="#">사서추천도서</a></li>
								<li><a href="#">신착도서</a></li>
								<li><a href="#">이달의인기도서</a></li>
							</ul>
						</li>
						<li class="menu_line">|</li>
						<li>
							<a href="${ctx}/bookCategory.do">커뮤니티&nbsp;&nbsp;<i class="fas fa-caret-down"></i></a>
							<ul id="mMainnav_dropdown">
								<li><a href="${ctx}/bookCategory.do">창작물게시판</a></li>
								<li><a href="#">중고장터</a></li>
								<li><a href="#">자유게시판</a></li>
							</ul>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>