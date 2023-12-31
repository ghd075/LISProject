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
function goSearch(){
	var frm = document.noticeSearch;
		frm.action="<c:url value='/intro/noticeSearch.do'/>";
		frm.method = "post";
		frm.submit();
	};
</script>
</head>
<body>
	<c:if test="${not empty param.search_error}">
	    <script>
	        const Toast = Swal.mixin({
	            toast: true,
	            position: 'center-center',
	            showConfirmButton: false,
	            timer: 3000,
	            timerProgressBar: true,
	            didOpen: (toast) => {
	                toast.addEventListener('mouseenter', Swal.stopTimer)
	                toast.addEventListener('mouseleave', Swal.resumeTimer)
	            }
	        })
	
	        Toast.fire({
	            icon: 'error', // 변경: 에러 아이콘을 사용하여 에러 메시지를 나타냅니다.
	            //title: '${sessionScope.search_error}' // 세션에서 메시지를 가져옵니다.
	            title: '${param.search_error}' // 세션에서 메시지를 가져옵니다.
	        })
	    </script>
	</c:if>

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


	<div id="c_main">
		<div id="c_nav">
			<h2 class="tit_c_nav">도서관 소개</h2>
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
							<li class="list-item"><a href="${ctx}/intro/libarayInfo.do"">시설 안내도<span
					class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
				</ul>
			</div>
			<c:if test="${not empty member}">
				<a href="${ctx}/intro/chatWindow.do""
					class="link_inquire"> <span class="emph">도움이 필요하신가요 ?</span>
					1:1 문의하기
				</a>
			</c:if>
		</div>

		<div class="page_section">
			<div class="head_aticle">
				<h2 class="tit">
					공지사항 <span class="tit_sub"> 최신 LIS의 소식을 보실 수 있습니다. </span>
				</h2>
			</div>
			
			<table width="100%" class="text-center" cellpadding="0" cellspacing="0">
			    <tbody>
			        <tr>
			            <td>
			                <div class="section_t">
			                    <table width="100%" class="board-listheader" cellpadding="0" cellspacing="0">
			                        <thead>
			                            <tr>
			                                <th>No.</th>
			                                <th>제목</th>
			                                <th>등록일</th>
			                                <th>조회수</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <c:choose>
			                                <c:when test="${empty noticeList}">
			                                    <tr>
			                                        <td colspan="4">검색결과가 없습니다.</td>
			                                    </tr>
			                                </c:when>
			                                <c:otherwise>
			                                    <c:forEach items="${noticeList}" var="v" varStatus="s">
			                                        <tr>
			                                            <td>${v.nno}</td>
			                                            <td><a href="${ctx}/intro/noticeDetail.do?nno=${v.nno}&pageNum=${s.count}">${v.ntitle}</a></td>
			                                            <td><fmt:formatDate value="${v.ndate}" pattern="yyyy-MM-dd" var="date" /> ${date}</td>
			                                            <td>${v.nview}</td>
			                                        </tr>
			                                    </c:forEach>
			                                </c:otherwise>
			                            </c:choose>
			                        </tbody>
			                    </table>
			                </div>
			            </td>
			            <td></td>
			        </tr>
			    </tbody>
			</table>

			<!--페이징 아래 숫자-->
			<div class="layout-pagination">
			    <div class="pagediv">
			        <c:choose>
			            <c:when test="${startPage != 1}">
			                <a href="${ctx}/intro/noticeList.do?pageNum=${prev}"
			                    class="layout-pagination-button layout-back"><</a>
			            </c:when>
			            <c:otherwise>
			                <span class="layout-pagination-button layout-back disabled"><</span>
			            </c:otherwise>
			        </c:choose>
			
			        <c:forEach varStatus="s" begin="${startPage}" end="${endPage}" step="1">
			            <c:choose>
			                <c:when test="${s.current == PageNum}">
			                    <span class="layout-pagination-button current">${s.current}</span>
			                </c:when>
			                <c:otherwise>
			                    <a href="${ctx}/intro/noticeList.do?pageNum=${s.current}"
			                        class="layout-pagination-button">${s.current}</a>
			                </c:otherwise>
			            </c:choose>
			        </c:forEach>
			
			        <c:choose>
			            <c:when test="${next <= pageCount && pageCount > 1}">
			                <a href="${ctx}/intro/noticeList.do?pageNum=${next}"
			                    class="layout-pagination-button layout-next">></a>
			            </c:when>
			            <c:otherwise>
			                <span class="layout-pagination-button layout-next disabled">></span>
			            </c:otherwise>
			        </c:choose>
			    </div>
			</div>


			
		</div>
		
		<table class="board-search board-search2">
			<tbody>
				<tr>
					<td><c:if test="${not empty member}">
							<c:if test="${member.authority eq 1}">
								<div id="nWritebtn">
									<button type="button" id="nWrite" name="nWrite"
										onclick="location.href='${ctx}/intro/noticeWriteF.do'">글쓰기</button>
								</div>
							</c:if>
						</c:if></td>
					<td>
						<div class="search_bt">
							<form name="noticeSearch" action="${ctx}/intro/noticeSearch.do">
								<input type="text" id="nSearch" name="nSearch"
									placeholder="검색어를 입력해주세요">
								<button type="button" id="nSearchbtn" name="nSearchbtn"
									onclick="goSearch()">
									<img src="${ctx}/images/Search_white.png"
										style="width: 15px; height: 15px;">
								</button>
							</form>
						</div>
					</td>
				</tr>
			</tbody>
		</table>		
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>