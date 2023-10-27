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
<title>도서 통합 정보 시스템 - 도서 검색</title>
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
  <link rel="stylesheet" href="${ctx}/jquery-ui-1.12.1/jquery-ui.min.css">
<!-- sweetalert2 사용 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>	
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>	
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>
<script type="text/javascript">

	//전역변수
	var FOL_NO =1;
	let mno = '${mno}';
	//book for DB
	var b_image;
	var b_title;
	var b_writer="";
	var b_year;
	var b_price;
	var detail;
	//책소개 아코디안
	  function setDetailsHeight(selector, wrapper = document) {
	   
	   
	}
	/* Run it */
	setDetailsHeight('details');
	$(function(){
	   
	   
	   <!-- 홈화면에서 책 누르면 자동으로 검색되는 ajax (재성이 추가)-->
	   let search = function() {
	      $.ajax({
	         method: "GET",
	         url: "https://dapi.kakao.com/v3/search/book?target=title",
	         data: { query:  $("#query").val() },
	         headers: {Authorization: "KakaoAK 90602895a3a930f57dd671cea1c2e29b"}
	      })
	         .done(function(msg) {
	            
	        	 $('#b_image').attr("src", msg.documents[0].thumbnail);
	        	 $('#b_title').text("제목: " + msg.documents[0].title);
	        	 $('#b_writer').text("저자: " + msg.documents[0].authors);
	        	 $('#b_year').text("출간일: " + (msg.documents[0].datetime).substr(0, 10));
	        	 $('#b_price').text("가격: " + msg.documents[0].price + "원");
	            $('#detail').text(msg.documents[0].contents);
	            //변수처리
	            b_image = msg.documents[0].thumbnail
	            b_title = msg.documents[0].title
	            b_writer = msg.documents[0].authors
	            b_year = msg.documents[0].datetime
	            b_price = msg.documents[0].price
	            detail = msg.documents[0].contents
	         });
	   }
	   search();

		// 대여 누를 시 책으로 저장하게 함
	   var insertBook = function () {
	       /*
	       b_image
	       b_title
	       b_writer
	       b_year
	       b_price
	       detail
	       */
	       
	       //alert(detail);
	       b_writer2 = JSON.stringify(b_writer);
	       b_writer2 = b_writer2.slice(2, -2);
	       
	       // alert(typeof detail);
	       var data = {
	           "b_writer": b_writer2,
	           "b_image": b_image,
	           "b_title": b_title,
	           "b_year": b_year,
	           "b_price": b_price,
	           "b_detail": detail
	       };
	       
	       $.ajax({
	           url: "<c:url value='/book/insertBook.do'/>",
	           dataType: "json",
	           type: "POST",
	           data: data,
	           success: function (data) {
	               console.log(data);
	           },
	           error: function () {
	               console.log("에러 발생");
	           }
	       });
	   }

		// 대여 버튼 클릭 이벤트
	   $('#borrow').click(function () {
	       $('#dialog-borrow').dialog({
	           modal: true,
	           height: 250,
	           width: 340,
	           buttons: {
	               "대여": function () {
	                   var days = ${days}

	                   if (days > 0) {
	                       alert("연체일수 " + days + "입니다. 대여가 불가능합니다.")
	                   } else {
	                       var count = eval(${b.b_count});
	                       var count2 = eval(${sumbook});
	                       var b_no = eval(${b.b_no});
	                       var mno = '${mno}';
	                       var data = { "mno": mno };

	                       if (count2 >= 10) {
	                           alert("대여가능 도서권수를 초과하였습니다");
	                       } else {
	                            insertBook();
	                            
	                            var b_no = eval(${b.b_no });
	                            var mno = '${mno}';
	                    	   
	                           // 주석 처리된 AJAX 부분
	                           $.ajax({
	                               url: "<c:url value='/book/insertBorrow.do'/>",
	                               dataType: "Json",
	                               data: data,
	                               type: "POST",
	                               success: function (data) {
	                                   if (data.result === 1) {
	                                	   Swal.fire({
	                                    	   title: '대출완료',
	                                    	   text: '2층 제3열람실의 담당자에게서 대출 신청한 도서를 찾아가세요.',
	                                    	   imageUrl: "<%=request.getContextPath()%>/images/도서대여.png",
	                                    	   imageWidth: 1000,
	                                    	   imageHeight: 300,
	                                    	   imageAlt: 'Custom image',
	                                    	 })
	                                   } else {
	                                       alert("대출 실패");
	                                   }
	                               },
	                               error: function () {
	                                   alert("에러");
	                               }
	                           });
	                       }
	                   }
	                   $(this).dialog("close");
	               },
	               "취소": function () {
	                   $('.ui-icon-closethick').click();
	               }
	           },
	       });
	   });
	});
</script>
<style>
/* 마우스 갖다대면 효과*/
.reverse {
	color: white;
	background-color: #58ACFA;
	border-radius: 10px;
}

/* 내서재 추가 / 바로대여*/
.buttonadd {
	border-radius: 4px;
	background-color: #F2F2F2;
	color: black;
	text-align: center;
	font-size: 20px;
	width: 30%;
	height: 20%;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}
/* 내서재 추가 / 바로대여*/
.buttonadd span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}
/* 내서재 버튼 효과/ 바로대여*/
.buttonadd span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.buttonadd:hover span {
	padding-right: 25px;
}

.buttonadd:hover span:after {
	opacity: 1;
	right: 0;
}

#card-no-border {
	border: none;
	border-right: 1px solid #DFDFDF;
}

details[open] {
  background-color: #DCDCDC; /* 원하는 배경 색상으로 변경하세요. */
}

summary {
   margin: 0!important;
}
</style>
 <style>
    /* 아코디안
Add a fold-out icon to any element, by adding a data-attribute:
`data-css-icon` with one of the following values:
- cross
- dots
- down
- equals
- menu
- plus
- right
AND a blank <i></i>-tag.
_Example:_
<span data-css-icon="cross">Title here<i></i><span>.
Extra modifiers are `fill`, `outline` and `square`.
_Example:_
<span data-css-icon="square cross outline">Title here<i></i><span>.
*/
[data-css-icon] {
   --animdur: .3s;
  --loading-animdur: 0.8s;
   --animtf: ease-in;
   --bdw: 2px;
  --bdrs: 50%;
  --bgc: transparent;
   --c: currentcolor;
  --dots-bgc: silver;
  --dots-size: 0.5rem;
  --icon-size: 1rem;
   --size: 3.0rem;
   align-items: center;
  cursor: pointer;
   display: flex;
   justify-content: space-between;
}
[data-css-icon] i {
  align-items: center;
  background-color: var(--bgc);
  border-radius: var(--bdrs);
  box-sizing: border-box;
  display: inline-flex;
  height: var(--size);
  justify-content: center;
  position: relative;
  transition: background-color var(--animdur) var(--animtf);
  width: var(--size);
}
[data-css-icon] i::after,
[data-css-icon] i::before {
  transform-origin: 50% 50%;
   transition: all var(--animdur) var(--animtf);
}
[data-css-icon*="down"] i::after,
[data-css-icon*="right"] i::after {
  background: transparent;
   border-color: var(--c);
   border-style: solid;
  box-sizing: border-box;
   content: '';
   display: inline-block;
   height: var(--icon-size) ;
   margin: 0;
  position: relative;
   width: var(--icon-size);
}
[data-css-icon*="down"] i::after {
   border-width: 0 var(--bdw) var(--bdw) 0;
  top: calc(0px - (var(--icon-size) / 4));
  transform: rotate(45deg);
}
[data-css-icon*="right"] i::after {
   border-width: var(--bdw) var(--bdw) 0 0;
  right: calc((var(--icon-size) / 4));
  top: 0;
   transform: rotate(45deg);
}
[data-css-icon*="equals"] i::after,
[data-css-icon*="equals"] i::before,
[data-css-icon*="cross"] i::after,
[data-css-icon*="cross"] i::before,
[data-css-icon*="menu"] i,
[data-css-icon*="menu"] i::after,
[data-css-icon*="menu"] i::before,
[data-css-icon*="plus"] i::after,
[data-css-icon*="plus"] i::before {
  /* Width need to be the diagonal of the down-arrow side-length (--size): sqrt(2) * --size. */
   --w: calc(var(--icon-size) * 1.4142135623730950488016887242097);
   background: var(--c);
   content: '';
   height: var(--bdw);
   position: absolute;
   width: var(--w);
}
[data-css-icon*="cross"] i::before,
[data-css-icon*="plus"] i::before {
   transform: rotate(90deg);
}
[data-css-icon*="equals"] i {
  --m: 4px;
}
[data-css-icon*="equals"] i::after {
  transform: translateY(var(--m));
}
[data-css-icon*="equals"] i::before {
  transform: translateY(calc(0px - var(--m)));
}
[data-css-icon*="dots"],
[data-css-icon*="menu"] {
  height: var(--size);
}
[data-css-icon*="menu"] i {
  --bdrs: 0;
  --m: 7px;
  position: relative;
  right: calc((var(--size) - var(--w)) / 2);
}
[data-css-icon*="menu"] i::after {
  top: var(--m);
}
[data-css-icon*="menu"] i::before {
  top: calc(0px - var(--m));
}
[data-css-icon*="dots"] i,
[data-css-icon*="dots"] i::after,
[data-css-icon*="dots"] i::before {
  animation: dots var(--loading-animdur) infinite alternate;
  background-color: var(--c);
  border-radius: 50%;
  content: "";
  display: inline-block;
  height: var(--dots-size);
  width: var(--dots-size);
}
[data-css-icon*="dots"] i {
  animation-delay: var(--loading-animdur);
  position: relative;
  right: calc((var(--size) - var(--dots-size)) / 4);
}
[data-css-icon*="dots"] i::after {
  animation-delay: 0s;
  left: calc(0px - (var(--dots-size) * 3));
  position: absolute;
}
[data-css-icon*="dots"] i::before {
  animation-delay: calc(var(--loading-animdur) / 2);
  left: calc(0px - (var(--dots-size) * 1.5));
  position: absolute;
}
[data-css-icon*="spin"] i::after {
  animation: spin var(--loading-animdur) infinite linear;
  border-radius: 50%;
  border: var(--bdw) solid var(--dots-bgc);
  border-left: var(--bdw) solid var(--c);
  content: "";
  height: var(--icon-size);
  transform: translateZ(0);
  width: var(--icon-size);
}
/* STATE */
[open] > summary > [data-css-icon*="cross"] i::after {
   transform: rotate(45deg);
}
[open] > summary > [data-css-icon*="cross"] i::before {
  transform: rotate(135deg);
}
[open] > summary > [data-css-icon*="down"] i::after {
  top: var(--bdw);
   transform: rotate(45deg) scale(-1) ;
}
[open] > summary > [data-css-icon*="right"] i::after {
  right: 0;
  top: calc(0px - (var(--icon-size) / 4));
   transform: rotate(135deg);
}
[open] > summary > [data-css-icon*="plus"] i::after {
   transform: rotate(180deg);
}
[open] > summary > [data-css-icon*="plus"] i::before {
   transform: rotate(-0deg);
}
[open] > summary > [data-css-icon*="equals"] i::after { transform: rotate(-45deg); }
[open] > summary > [data-css-icon*="equals"] i::before { transform: rotate(45deg); }
[open] > summary > [data-css-icon*="menu"] i { background-color: transparent; }
[open] > summary > [data-css-icon*="menu"] i::after { transform: translateY(calc(0px - var(--m))) rotate(-45deg); }
[open] > summary > [data-css-icon*="menu"] i::before { transform: translateY(var(--m)) rotate(45deg); }
/* RTL: inset-block-end fails */
[dir="rtl"] [data-css-icon*="right"] i::after {
   left: calc((var(--icon-size) / 4));
}
[dir="rtl"] [data-css-icon*="menu"] i {
   left: 0.5rem;
  right: auto;
}
/* MODIFIERS */
[data-css-icon*="outline"] i {
  border: var(--bdw) solid var(--c);
}
[data-css-icon*="fill"] {
  --bgc: hsl(196, 64%, 39%);
  --c: hsl(195, 10%, 95%);
}
[data-css-icon*="square"] {
  --bdrs: 5px;
}
/* For this demo only */
body { font-family: system-ui, sans-serif; }
/*버튼크기 
button, details { width: 6rem; }*/
button { font-family: inherit; font-size: inherit; }
details {
  height: var(--collapsed);
  overflow: hidden;
  transition: height 300ms cubic-bezier(0.4, 0.01, 0.165, 0.99);
}
details[open] {
  height: var(--expanded);
}
button,
summary { 
  background-color: var(--bgc);
  border: 0;
  border-radius: 5px;
  color: var(--c, inherit);
  list-style-type: none;
  margin: 0.5rem 0;
  outline: none;
  padding-bottom: 0.5rem;
  padding-top: 0.5rem;
  padding-inline-end: 0.5rem;
  padding-inline-start: 1rem;
  user-select: none;
}
summary::marker { display: none; }
summary::-webkit-details-marker { display: none; }
/* 4 States of summary */
button,
summary {
  --bgc: hsl(195, 10%, 90%);
}
[open] > summary {
  --bgc: hsl(195, 10%, 20%);
  --c: hsl(195, 10%, 92%);
}
button:focus,
summary:focus {
  --bgc: hsl(195, 10%, 75%);
}
[open] > summary:focus {
  --bgc: hsl(195, 10%, 10%);
    --c: hsl(195, 10%, 99%);
}
[open] > summary:focus > [data-css-icon*="fill"],
[open] > summary > [data-css-icon*="fill"] {
  --bgc: hsl(195, 10%, 80%);
  --c: hsl(195, 10%, 10%);
}
summary + * {
  color: #777;
  line-height: 1.6;
  padding: 0.5rem;
}
@keyframes dots {
  0% {
    background-color: var(--c);
  }
  50%,
  100% {
    background-color: var(--dots-bgc);
  }
}
@keyframes spin {
  0% {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(1turn);
  }
}
</style>
</head>
<body>
	<input type="hidden" value="${query}" id="query">
	<!-- PAGE HEADER -->
	<header id="page-header" class="noto-serif">
		<div class="page-header-overlay">
			<div class="container pt-5">
				<div class="row">
					<div class="col-md-6 m-auto text-center page-header-top">
						<h2>책 상세보기</h2>
					</div>
				</div>
			</div>
		</div>
	</header>


	<div id="c_main">
		<div class="col">
			<div class="p-4">

				<div class="card-body">
					<!-- CARD GROUPS -->
					<div class="card-group">
						<div class="card" id="card-no-border">
							<img id="b_image" class="img" src="${b.b_image }" alt=""
								style="margin-left: auto; margin-right: auto; display: block; height: 100%;" />
						</div>
						<div class="card noto-serif">
							<div class="card-body">
								<h4 class="card-title" id="b_title" name="f"></h4>
								<p class="card-text m-1" id="b_writer"></p>
								<p class="card-text m-1" id="b_year"></p>
								<p class="card-text m-1" id="b_price">가격</p>
								<p class="card-text m-1 pb-2">구입가능 링크</p>
								<div class="ml-3">
									<p class="card-text d-inline pr-3">
										<a
											href="https://search.kyobobook.co.kr/web/search?vPstrKeyWord=${query}"><img
											alt="교보문고" src="${ctx}/images/kyobo.png" height="30px"></a>
									</p>
									<p class="card-text d-inline pr-3">
										<a
											href="https://www.aladin.co.kr/search/wsearchresult.aspx?SearchTarget=All&SearchWord=${query}"><img
											alt="알라딘" src="${ctx}/images/aladin.jpg" height="30px"></a>
									</p>
									<p class="card-text d-inline pr-3">
										<a
											href="https://search.shopping.naver.com/book/search?bookTabType=ALL&pageIndex=1&pageSize=40&query=${query}"><img
											alt="네이버 책" src="${ctx}/images/naver_book.png" height="30px"></a>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- HOVERABLE -->
				<div class="row pb-2">
					<div class="col">
						<details style="margin-top: 70px;">
							<summary>
								<span data-css-icon="down fill">책소개<i></i></span>
							</summary>
							<div id="detail"></div>
						</details>
						<br><br>
		                <c:if test="${not empty mno }">     
		                	<button id=borrow class="buttonadd" style="float: right; margin-left: 50px;">
		                  		<span>도서 대여</span>
		                	</button>
		                </c:if>
		                
             			<!-- 모달 다이얼로그 모음 -->
             			<!-- 도서대여 클릭시 첫화면 -->
             			<div id="dialog-borrow" title="도서대여" style='display: none'>
					    	<img width="85px" height="70px" alt="book image" src="${ctx}/images/borrow.png" style="cursor: default;">
					        <span style='color: green; font-size: 15pt;'> 대출하시겠습니까? </span>             			
             			</div>
             			
					</div>
				</div>
			</div>
		</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
		integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script type="text/javascript"   src="${ctx}/jquery-ui-1.12.1/jquery-ui.min.js"></script>
</body>
</html>
