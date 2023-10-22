<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath	}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>도서 통합 정보 시스템 - 공지사항</title>
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
<!-- sweetalert2 사용 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>	
	
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>
<script type="text/javascript">
	function goRegister(){
		var frm = document.noticeWrite;
			frm.action="<c:url value='/intro/noticeWrite.do'/>";
			frm.method = "post";
			frm.submit();
		}	
	
</script>
</head>
<body>

	<div class="register_res">
		<c:if test="${not empty register_fail}">
			<span>${register_fail}</span>
		</c:if>
	</div>


	<!-- PAGE HEADER -->
	<header id="page-header" class="noto-serif">
		<div class="page-header-overlay">
			<div class="container pt-5">
				<div class="row">
					<div class="col-md-6 m-auto text-center page-header-top">
						<h2>공지사항</h2>
					</div>
				</div>
			</div>
		</div>
	</header>

	
	<div id="wrap">
		<div id="c_main">
			<div id="c_nav">
				<h2 class="tit_c_nav">고객센터</h2>
				<div class="inner_nav">
				<ul class="list_menu">
					<li class="list-item">
						<a href="${ctx}/intro/howtoInfo.do">대출/반납/연장<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item active"><a href="${ctx}/intro/noticeList.do" style="background: #FFFDE4;">공지사항<span
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
				<div class="head_aticle">
					<h2 class="tit">
						공지사항 <span class="tit_sub"> 공지사항을 등록합니다. </span>
					</h2>
				</div>
				<div class="CSq1_cont_board">
					<form name="noticeWrite">
						<table style="margin-top: 34px;">
							<tr>
								<td class="qna_title qna_box">제목</td>
								<td colspan="2" style="padding-left: 8px;"><input
									type="text" name="ntitle" placeholder="제목을 입력해주세요."
									style="width: 640px; height: 30px; border: 1px solid #e8e8e8;">
								</td>
							</tr>
							<tr>
								<td class="qna_desc qna_box">내용</td>
								<td colspan="2" style="padding-left: 8px;"><textarea
										name="ncontent"
										style="resize: none; width: 640px; height: 350px; border: 1px solid #e8e8e8;"></textarea>
								</td>
							</tr>
						</table>
						<div class="subM">
							<button type="submit" onclick="goRegister();" class="b_button">등록하기</button>
						</div>
					</form>
				</div>
			</div>
			<p></p>
		</div>
	</div>
</body>
</html>