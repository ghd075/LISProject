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
<title>도서 통합 정보 시스템 - 대출현황</title>
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
<link rel="stylesheet" href="${ctx}/css/style.css">
<link rel="stylesheet" href="${ctx}/css/BookCart.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/wang_hw.css">
<link rel="stylesheet" type="text/css" href="${ctx}/css/return_btn_YT.css">
  <link rel="stylesheet" href="${ctx}/jquery-ui-1.12.1/jquery-ui.min.css">
<!-- sweetalert2 사용 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>	
	
<script type="text/javascript"   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>

<script type="text/javascript">
const pathname = "/" + window.location.pathname.split("/")[1] + "/";
const origin = window.location.origin;

const contextPath = origin + pathname;
	$(function() {
	  $(document).ready(function() {
	    var zindex = 10;

	    $("div.card").click(function(e) {
	      e.preventDefault();

	      var isShowing = false;

	      if ($(this).hasClass("show")) {
	        isShowing = true;
	      }

	      if ($("div.cards").hasClass("showing")) {
	        // a card is already in view
	        $("div.card.show").removeClass("show");

	        if (isShowing) {
	          // this card was showing - reset the grid
	          $("div.cards").removeClass("showing");
	        } else {
	          // this card isn't showing - get in with it
	          $(this).css({
	            zIndex: zindex
	          }).addClass("show");
	        }

	        zindex++;
	      } else {
	        // no cards in view
	        $("div.cards").addClass("showing");
	        $(this).css({
	          zIndex: zindex
	        }).addClass("show");
	        zindex++;
	      }
	    });
	  });

	  /* 추천도서 누르면 bookDetail 페이지로 이동 */
	  $(function() {
	    $('.card_image-holder').click(function() {
	      location.href = contextPath + "book/detailBook.do?b_no=1&query=" + $(this).find('#book-title').text();
	    });
	  });
	});


</script>

</head>
<body>

	<!-- PAGE HEADER -->
	<header id="page-header" class="noto-serif">
		<div class="page-header-overlay">
			<div class="container pt-5">
				<div class="row">
					<div class="col-md-6 m-auto text-center page-header-top">
						<h2>대출반납이력</h2>
					</div>
				</div>
			</div>
		</div>
	</header>


	<div id="c_main">
		<div id="c_nav">
			<h2 class="tit_c_nav">마이페이지</h2>
			<div class="inner_nav">
				<ul class="list_menu">
					<li class="list-item"><a href="${ctx}/mypage/borrowList.do" >대출현황<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item active"><a href="${ctx}/mypage/return_borrowList.do" style="background: #FFFDE4;">대출반납이력<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/mypage/MyPage_Info.do" >개인정보수정<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
				</ul>
			</div>
		</div>

		<div class="page_section">
			<!-- 메인내용 -->
			<div class="col-md-9">
			  <div class="p-4">
			    <!-- CARD WITH NAV -->
			    <section id="contact" class="py-3">
			      <div class="cards">
			        <c:if test="${empty b}">
			          <h2>대여목록이 없습니다.</h2><br>
			        </c:if>
			        <c:if test="${not empty b}">
			          <c:forEach var="b" items="${b}">
			            <div class="card">
			              <div class="card_image-holder">
			                <img class="card_image" src="${b.b_image}" alt="wave" />
			                <div class="card-text" id="book-title">${b.b_title}</div>
			              </div>
			              <div>
			                <div class="card-text">${b.b_writer}
			                  <p class="m-0">대여일 : ${b.bor_date}</p>
			                  <p>반납일 : ${b.return_date}</p>
			                </div>
			              </div>
			            </div>
			          </c:forEach>
			        </c:if>
			      </div>
			    </section>
			  </div>
			</div>
			
			<div class="container mt-5">
			  <ul class="pagination justify-content-center">
			    <c:if test="${startPage > 1}">
			      <li class="page-item">
			        <a class="page-link" id="page-link" href="return_borrowList.do?pageNUM=${startPage-1}">&laquo;</a>
			      </li>
			    </c:if>
			    <c:if test="${startPage == 1}">
			      <li class="page-item disabled">
			        <a class="page-link" id="page-link" href="return_borrowList.do?pageNUM=${startPage-1}">&laquo;</a>
			      </li>
			    </c:if>
			    <c:forEach var="i" begin="${startPage}" end="${endPage}">
			      <li class="page-item">
			        <a class="page-link" id="page-link" href="return_borrowList.do?pageNUM=${i}">${i}</a>
			      </li>
			    </c:forEach>
			    <c:if test="${endPage < totalPage}">
			      <li class="page-item">
			        <a class="page-link" id="page-link" href="return_borrowList.do?pageNUM=${endPage+1}">&raquo;</a>
			      </li>
			    </c:if>
			    <c:if test="${endPage == totalPage}">
			      <li class="page-item disabled">
			        <a class="page-link" id="page-link" href="return_borrowList.do?pageNUM=${endPage+1}">&raquo;</a>
			      </li>
			    </c:if>
			  </ul>
			</div>
			
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	<script type="text/javascript"   src="${ctx}/jquery-ui-1.12.1/jquery-ui.min.js"></script>
</body>
</html>