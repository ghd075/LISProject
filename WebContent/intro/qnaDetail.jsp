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
<title>도서 통합 정보 시스템 - 묻고 답하기</title>
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
	var frm = document.qnaSearch;
		frm.action="<%=request.getContextPath()%>/intro/qnaSearch.do";
		frm.method = "post";
		frm.submit();
	};
	
function goDelete() {
		var frm = document.qnaDetail;
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			frm.method = "post";
			frm.action = "<%=request.getContextPath()%>/intro/qnaDelete.do";
			frm.submit();
		}else{   //취소
		    return;
		}
	}	

function goReply() {
		var frm = document.qnaDetail;
			frm.method = "post";
			frm.action = "<%=request.getContextPath()%>/intro/qnaReply.do";
			frm.submit();
	
	}	
	
function goDeleteReply(rno) {
	var frm = document.qnaReply;
	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		frm.method = "post";
		 frm.action = "<%= request.getContextPath() %>/intro/qnaReplyDelete.do?rno=" + rno;
		frm.submit();
	}else{   //취소
	    return;
	}
}	

function goUpdateReply(rno,nno,mid,ndate,ncontent) {
	var frm = document.qnaReply
		frm.method = "post";
		 frm.action = "<%= request.getContextPath() %>/intro/qnaReplyUpdate.do?rno=" + rno + "&nno=" +nno+ "&mid=" + mid + "&ndate=" + ndate + "&ncontent" + ncontent;
		frm.submit();

}	
		
	
function startUpdate() {
	var frm = document.qnaDetail;
	frm.method = "get";
	frm.action = "<%=request.getContextPath()%>/intro/qnaUpdate.jsp";
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
						<h2>묻고 답하기</h2>
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
					<li class="list-item"><a href="${ctx}/intro/faqList.do">자주하는질문<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item active"><a href="${ctx}/intro/qnaList.do" style="background: #FFFDE4;">묻고 답하기<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/addrViewpageAPI.do">오시는길<span
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
					묻고 답하기 <span class="tit_sub"> 묻고 답할 수 있는 공간입니다. </span>
				</h2>
			</div>
			<form name="qnaDetail">
				<div class="CSq1_cont_board">
					<input type="hidden" name="nno" value="${ndetail.nno}">
					<table>
						<tr>
							<td class="qna_ctg qna_box">제목</td>
							<td colspan="3" id="ntitle" name="ntitle"
								style="padding-left: 8px;"><input type="hidden"
								name="ntitle" value="${ndetail.ntitle}">
								${ndetail.ntitle}</td>
						</tr>
						<tr>
							<td class="qna_onum qna_box">작성자</td>
							<td colspan="3" id="mid" name="mid" style="padding-left: 8px;">
								<input type="hidden" name="mid" value="${ndetail.mid}">
								${ndetail.mid}
							</td>
						</tr>
						<tr>
							<td class="qna_title qna_box">작성일</td>
							<td style="padding-left: 8px;" id="ndate"  name="ndate"><fmt:formatDate
									value="${ndetail.ndate}" pattern="yyyy-MM-dd" var="date" /> <input
								type="hidden" name="ndate" value="${date}"> ${date}</td>
							<td class="qna_title2 qna_box">조회수</td>
							<td id="nview" name="nview">
							<input type="hidden" name="nview" value="${ndetail.nview}"> ${ndetail.nview}
							</td>
						</tr>
						<tr>
							<td colspan="4" id="ncontent" name="ncontent"
								style="height: 350px;"><input type="hidden" name="ncontent"
								value="${ndetail.ncontent}">
								<p style="white-space: pre-line;">&nbsp;&nbsp;&nbsp;&nbsp; ${ndetail.ncontent}</p>
								</td>
						</tr>		
					</table>
					<br>
					<div class="b_button2">
						<c:if test="${not empty member}">
							<c:if test="${member.authority eq 1 || (member.authority eq 0 && ndetail.mid == member.mid)}">
								<button type="button" class="b_button" onclick="goReply()">답글쓰기</button>		
								<button type="button" class="b_button" onclick="startUpdate()">수정</button>
								<button type="button" class="b_button" onclick="goDelete()">삭제</button>	
							</c:if>
						</c:if>
						<button type="button" class="b_button"  onclick="location.href='<%=request.getContextPath()%>/intro/qnaList.do'">글목록</button>
					</div>
				</div>
			</form>	
				<c:if test="${not empty qreplyList}">
				<form name="qnaReply">
				
					  <c:forEach items="${qreplyList}" var="v" varStatus="s"><br>
					  	<div class="CSq1_cont_board">
					  	<input type="hidden" name="nno" value="${v.nno}">
						<br>
						<table style = "height : 40px; vertical-align : middle; border : 2px solid #425c5a">
						<tr>
							
							<td style = "vertical-align : middle">작성자</td>
							<td name="mid" class="replyId" style=" padding-left : 20px; vertical-align: middle;">
							<input type="hidden" name="mid" value="${v.mid}">${v.mid}
							</td>
							<td style = "vertical-align : middle">작성일</td>
							<td name="ndate" class="replyDate" style = "vertical-align: middle">
							<fmt:formatDate value="${v.ndate}" pattern="yyyy-MM-dd" var="date" />
							<input type="hidden" name="ndate" value="${date}"> ${date}</td>
						</tr>
						<tr>
							<td  style = "vertical-align : middle">댓글</td>
							<td colspan="5" name="ncontent" class="replyComment" style="height: 10px; padding-left : 20px; vertical-align: middle;">
							<input type="hidden" name="ncontent" value="${v.ncontent}">
						    <p style="white-space: pre-line;">${v.ncontent}</p>
						    
						    <c:if test="${not empty member}">
							<c:if test="${member.authority eq 1 || (member.authority eq 0 && ndetail.mid == member.mid)}">
								  <button type="button" class="b_button" style="margin-right : 10px; margin-top: -30px" onclick="goUpdateReply(${v.rno},${v.nno}${v.mid},${v.ndate},${v.ncontent})" >댓글 수정</button>
						    <button type="button" class="b_button" style="margin-top: -30px" onclick="goDeleteReply(${v.rno})">댓글 삭제</button>
							</c:if>
							</c:if>
	
							</td>
						</tr>
						</table>
						</div>
				</c:forEach>
				</form>
				<br>
		</c:if>	
						
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>