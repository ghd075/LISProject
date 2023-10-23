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
<title>도서 통합 정보 시스템 - 자유게시판</title>
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
			<table width="100%" class="text-center" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td>
							<div class="section_t">
								<table width="100%" class="board-listheader" cellpadding="0"
									cellspacing="0">
									<thead>
										<tr>
											<th>No.</th>
											<th>제목</th>
											<th>등록일</th>
											<th>조회수</th>
										</tr>
									</thead>
									<tbody>
										<!--목록 뿌리기 -->
										<c:if test="${not empty searchList}">
											<!--변경 : el태그 - servlet이랑 맞추기 -->
											<c:forEach items="${searchList}" var="v" varStatus="s">
												<!--변경 : el태그 - servlet이랑 맞추기 -->
												<tr>
													<td>${v.nno}</td>
													<td><a
														href="${ctx}/community/cBoardDetail.do?nno=${v.nno}&pageNum=${s.count}">${v.ntitle}</a></td>
													<td><fmt:formatDate value="${v.ndate}"
															pattern="yyyy-MM-dd" var="date" /> ${date}</td>
													<td>${v.nview}</td>
												</tr>
											</c:forEach>
										</c:if>
										<c:if test="${empty searchList}">
										    <tr>
										        <td colspan="4">검색 결과가 없습니다.</td>
										    </tr>
										</c:if>										
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
			                <a href="${ctx}/community/cBoardSearch.do?pageNum=${prev}" class="layout-pagination-button layout-back"><</a>
			            </c:when>
			            <c:otherwise>
			                <span class="layout-pagination-button layout-back disabled"><</span>
			            </c:otherwise>
			        </c:choose>
			
			        <c:choose>
			            <c:when test="${pageCount eq 0}">
			                <span class="layout-pagination-button current">1</span>
			            </c:when>
			            <c:otherwise>
			                <c:forEach varStatus="s" begin="${startPage}" end="${endPage}" step="1">
			                    <c:choose>
			                        <c:when test="${s.current == PageNum}">
			                            <span class="layout-pagination-button current">${s.current}</span>
			                        </c:when>
			                        <c:otherwise>
			                            <a href="${ctx}/community/cBoardSearch.do?pageNum=${s.current}&nSearch=${nSearch}" class="layout-pagination-button">${s.current}</a>
			                        </c:otherwise>
			                    </c:choose>
			                </c:forEach>
			            </c:otherwise>
			        </c:choose>
			
			        <c:choose>
			            <c:when test="${next <= pageCount && pageCount > 1}">
			                <a href="${ctx}/community/cBoardSearch.do?pageNum=${next}&msearchbar=${msearchbar}" class="layout-pagination-button layout-next">></a>
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
										onclick="location.href='${ctx}/community/cBoardWrite.jsp'">글쓰기</button>
								</div>
							</c:if>
						</c:if></td>
					<td>
						<div class="search_bt">
							<form name="noticeSearch" action="${ctx}/community/cBoardSearch.do">
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