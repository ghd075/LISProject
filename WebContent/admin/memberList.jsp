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
<title>도서 통합 정보 시스템 - 관리자</title>
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
		frm.action="<%=request.getContextPath()%>/intro/noticeSearch.do";
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
						<h2>관리자 메뉴</h2>
					</div>
				</div>
			</div>
		</div>
	</header>


	<div id="c_main">
		<div id="c_nav">
			<h2 class="tit_c_nav">관리자 메뉴</h2>
			<div class="inner_nav">
				<ul class="list_menu">
					<li class="list-item active">
						<a href="${ctx}/admin/memberList.do" style="background: #FFFDE4;">회원 정보 조회 및 수정<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/admin/borrowList.do">도서 대출 정보 조회<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
				</ul>
			</div>

	
		</div>

	

		<div class="page_section">
			<div class="head_aticle">
				<h2 class="tit">
					회원 정보 조회 및 수정 <span class="tit_sub"> 아이디를 눌러 해당 회원의 정보를 수정할 수 있습니다. </span>
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
										<td>아이디</td>
										<td>비밀번호</td>
										<td>이름</td>
										<td>이메일</td>
										<td>휴대폰번호</td>
										<td>우편번호</td>
										<td>기본 주소</td>
										<td>상세주소</td>
										</tr>
									</thead>
									<tbody>
										<!--목록 뿌리기 -->
										<c:if test="${not empty memberList}">
											<!--변경 : el태그 - servlet이랑 맞추기 -->
											<c:forEach items="${memberList}" var="v" varStatus="s">
												<!--변경 : el태그 - servlet이랑 맞추기 -->
												<tr>
													<td>
													<a href="${ctx}/admin/memberInfoUpdate.do?mid=${v.mid}">${v.mid}</a></td>
													<td>${v.mpw}</td>
													<td>${v.mname}</td>
													<td>${v.memail}</td>
													<td>${v.mphone}</td>
													<td>${v.mzip_code}</td>
													<td>${v.m_first_addr}</td>
													<td>${v.m_second_addr}</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>

			<br><br>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>
