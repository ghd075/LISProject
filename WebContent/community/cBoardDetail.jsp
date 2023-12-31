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
<title>도서 통합 정보 시스템 - 창작물게시판</title>
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
<script type="text/javascript">
function goSearch(){
	var frm = document.noticeSearch;
		frm.action="<%=request.getContextPath()%>/community/cBoardSearch.do";
		frm.method = "post";
		frm.submit();
	};
	
function goDelete() {
		var frm = document.noticeDetail;
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			frm.method = "post";
			frm.action = "<%=request.getContextPath()%>/community/cBoardDelete.do";
			frm.submit();
		}else{   //취소
		    return;
		}
	}	
	
function startUpdate() {
	var frm = document.noticeDetail;
	frm.method = "get";
	frm.action = "<%=request.getContextPath()%>/community/cBoardUpdate.jsp";
	frm.submit();
}
</script>
</head>
<body>

	<!-- PAGE HEADER -->
	<header id="page-header" class="noto-serif">
		<div class="page-header-overlay">
			<div class="container pt-5">
				<div class="row">
					<div class="col-md-6 m-auto text-center page-header-top">
						<h2>창작물게시판</h2>
					</div>
				</div>
			</div>
		</div>
	</header>

	<div id="c_main">
		<div id="c_nav">
			<h2 class="tit_c_nav">커뮤니티</h2>
			<div class="inner_nav">
				<ul class="list_menu">
					<li class="list-item active">
						<a href="${ctx}/community/cBoardList.do" style="background: #FFFDE4;">창작물게시판<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/community/uBoardList.do">중고장터<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/community/fBoardList.do" >자유게시판<span
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
			<div class="head_aticle">
				<h2 class="tit">
					창작물게시판 <span class="tit_sub"> 직접 글을 투고 하거나 다른 회원의 글을 열람할 수 있습니다. </span>
				</h2>
			</div>
			<form name="noticeDetail">
				<div class="CSq1_cont_board">
					<input type="hidden" name="nno" value="${cBdetail.nno}">
					<table>
						<tr>
							<td class="qna_ctg qna_box">제목</td>
							<td colspan="3" id="ntitle" name="ntitle"
								style="padding-left: 8px;"><input type="hidden"
								name="ntitle" value="${cBdetail.ntitle}">
								${cBdetail.ntitle}</td>
						</tr>
						<tr>
							<td class="qna_onum qna_box">작성자</td>
							<td colspan="3" id="mid" name="mid" style="padding-left: 8px;">
								<input type="hidden" name="mid" value="${cBdetail.mid}">
								${cBdetail.mid}
							</td>
						</tr>
						<tr>
							<td class="qna_title qna_box">작성일</td>
							<td style="padding-left: 8px;" id="ndate"  name="ndate"><fmt:formatDate
									value="${cBdetail.ndate}" pattern="yyyy-MM-dd" var="date" /> <input
								type="hidden" name="ndate" value="${date}"> ${date}</td>
							<td class="qna_title2 qna_box">조회수</td>
							<td id="nview" name="nview">
							<input type="hidden" name="nview" value="${cBdetail.nview}"> ${cBdetail.nview}
							</td>

						</tr>
						<tr>
							<td colspan="4" id="ncontent" name="ncontent"
								style="height: 350px;"><input type="hidden" name="ncontent"
								value="${cBdetail.ncontent}">
								<p style="white-space: pre-line;">&nbsp;&nbsp;&nbsp;&nbsp; ${cBdetail.ncontent}</p>
								</td>
						</tr>
					</table>
					<div class="b_button2">
						<c:if test="${not empty member}">
							<c:if test="${member.authority eq 1 || (member.authority eq 0 && cBdetail.mid == member.mid)}">
								<button type="button" class="b_button" onclick="startUpdate()">수정</button>
								<button type="button" class="b_button" onclick="goDelete()">삭제</button>
							</c:if>
						</c:if>
						<button type="button" class="b_button" onclick="location.href='<%=request.getContextPath()%>/community/cBoardList.do'">글목록</button>
					</div>
				</div>
			</form>			
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>