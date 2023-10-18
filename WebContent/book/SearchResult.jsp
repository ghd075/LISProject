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
<!-- sweetalert2 사용 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>	
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>	
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>

<!-- 카카오 도서 검색 API -->
<script type="text/javascript">
	$(function() {
		let booklist;
		const pathname = "/" + window.location.pathname.split("/")[1] + "/";
		const origin = window.location.origin;
		
		const contextPath = origin + pathname;
		
		let search = function(pageNUM) {
			if(pageNUM === undefined){
				pageNUM = 1;
			}
			
	        // 검색어 가져오기
	        const queryValue = $("#query").val();
	        if (queryValue == null || typeof queryValue !== "string" || queryValue.trim() === "") {
	            console.log("#query 값이 유효하지 않습니다.");
	            return;
	        }
	        
			let size = 48;
			console.log("8888====>", $("#query").val());
			$.ajax({
				method: "GET",
				url: "https://dapi.kakao.com/v3/search/book?target=title&size=" + size + "&page=" + pageNUM,
				data: { query:  $("#query").val() },
				headers: {Authorization: "KakaoAK 90602895a3a930f57dd671cea1c2e29b"}
			})
				.done(function(msg) {
					console.log('count : ' + msg.meta["pageable_count"]);

					if(msg.meta["pageable_count"] === 0) {
						let h3 = $('<h3></h3>').text('검색 결과가 없습니다.');
						h3.attr("style","margin: 20% 0% 0% 35%;");
						$('.searchResult-body').append(h3);
					}
					
					if(pageNUM == 1){
						booklist = msg;
					}
// 					alert(msg.documents[0].title);
					var ul = $('<ul></ul>').addClass('card-list');
					var totalPage;
	
					for(let i = 0; i < msg.documents.length; i++) {
						var li = $('<li></li>').addClass('card');
						var a = $('<a></a>').addClass('card-image')
						if (msg.documents[i].thumbnail) {
						    a.css('background-image', 'url(' + msg.documents[i].thumbnail + ')');
						} else {
						    // 대체 이미지 URL 또는 대체 텍스트를 설정합니다.
						    a.css('background-image', 'url(' + contextPath +'/images/noImage.png)');
						}
						//$(a).css('background-image', 'url(' + msg.documents[i].thumbnail + ')');
						$(a).attr('data-image-full', msg.documents[i].thumbnail);
						a.css("width", "120px");
						a.css("height","174px");

						<!-- 책 검색에서 제목 받아서 디테일북으로 옮기게 동적노드 생성 1단계 시작 -->
						var book_title = msg.documents[i].title;
						var a_href = $('<a href="'+ contextPath +'book/detailBook.do?b_no=1&query='+book_title+'"></a>');
						<!-- 책검색에서 제목 받아서 디테일북으로 옮기게 동적노드 생성 1단계 종료 -->

						var img = $('<img>').attr('src', msg.documents[i].thumbnail);
						var a2 = $('<a></a>');
						$(a2).addClass('card-description');
						$(a2).attr('target', '_blank');
						
						var h4 = $('<h4></h4>').text(msg.documents[i].title);
						var p = $('<p></p>').text(msg.documents[i].authors);
	
						$(a).append(img);
						$(li).append(a);
						
						<!-- 책검색에서 제목 받아서 디테일북으로 옮기게 동적노드 li에 넣기 시작 -->
						$(a_href).append(a);
						$(li).append(a_href);
						<!-- 책검색에서 제목 받아서 디테일북으로 옮기게 동적노드 li에 넣기 종료 -->
						
						$(a2).append(h4);
						$(a2).append(p);
						$(li).append(a2);
	
						$(ul).append(li);
						$('.searchResult-body').append(ul);
					}
					
					let totalCount = msg.meta["pageable_count"];
					if(pageNUM != 1){
						totalCount = booklist.meta["pageable_count"];
					}
					console.log(pageNUM);
					console.log(size);
					console.log(totalCount);
					const maxPage = 5; // 예를 들어, 최대 10 페이지까지만 표시하도록 설정
					totalPage = Math.min(Math.ceil(totalCount / size), maxPage);
					
					if(totalCount / size === 0){
						totalPage = totalCount / size;
					}
					
					for(let i = 1; i <= totalPage; i++) {
						$('.paging').append($('<a></a>').addClass('paging-num').text(i));
					}

					$('.paging-num').click(function() {
						let clickedPage = $(this).text();
						$('.searchResult-body').children().remove();
						$('.paging').children().remove();
						search(clickedPage);
					});
				});
		}

		search();
		
	    // 엔터 키를 눌렀을 때 search() 함수 호출
	    $('#bookName').keydown(function(event) {
	        if (event.keyCode === 13) { // 엔터 키를 눌렀을 때
	            triggerSearch();
	        }
	    });
		
		$('#search').click(function() {
			triggerSearch();
		})
		
		function triggerSearch() {
	        // 검색어 가져오기
	        const queryValue = $("#bookName").val();
	        if (queryValue == null || typeof queryValue !== "string" || queryValue.trim() === "") {
	            console.log("#query 값이 유효하지 않습니다.");
	            return;
	        }

	        // 검색어를 #query에 설정
	        $("#query").val(queryValue)
			
			$('.searchResult-body').children().remove();
			$('.paging').children().remove();
			search();
		}
	});
</script>
<style type="text/css">
	/* Lazy Load Styles */
	.card-image {
		display: block;
		background: #fff center center no-repeat;
		background-size: cover;
		margin: 0 auto;
		/* filter: blur(3px); /* blur the lowres image */ */
	}
	
	.card-image > img {
		display: block;
		width: 100%;
		opacity: 0; /* visually hide the img element */
		transition: opacity 0.5s;
	}
	
	.card-image.is-loaded img {
		opacity: 1;
	}
	
	.card-image.is-loaded {
		filter: none; /* remove the blur on fullres image */
		transition: filter 1s;
		margin: 0 auto;
	}
	
	/* Layout Styles */
	
	.card-list {
		display: block;
		padding: 0;
		font-size: 0;
		list-style: none;
		width: 825px;
	}
	
	.card-body {
		padding: 0;
	}
	
	.card {
		display: inline-block;
		width: 200px;
		height: 250px;
		margin: 1rem;
		font-size: 1rem;
		text-decoration: none;
		overflow: hidden;
		box-shadow: 0 0 3rem -1rem rgba(0, 0, 0, 0.5);
		transition: transform 0.1s ease-in-out, box-shadow 0.1s;
	}
	
	.card:hover {
		transform: translateY(-0.5rem) scale(1.0125);
		box-shadow: 0 0.5em 3rem -1rem rgba(0, 0, 0, 0.5);
	}
	
	.card-description {
		display: block;
		color: #515151;
		width: 200px;
		height: 100px;
		text-align: center;
	}
	
	.card-description > h4 {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		font-size: large;
		font-weight: bold;
	}
	
	.searchResult-body {
		float: left;
		width: 100%;
		margin-top: 20px;
	}
	
	.searchResult-options {
		margin-left: 150px;
		float: left;
		width: 20%;
		text-align: center;
	}
	
	.paging {
		margin: 20px auto;
		text-align: center;
		width: 100%;
		float: left;
	}
	
	.paging-num {
		margin: 0 10px;
	}
	
	.input-group {
		height: 26px;
		padding: 25px 5px 25px 5px;
		border: 1px; 
		float: left;
	}
	
	.searchResult-body {
		float: left;
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
						<h2>도서검색</h2>
					</div>
				</div>
			</div>
		</div>
	</header>


	<div id="c_main">
		<div id="c_nav">
			<h2 class="tit_c_nav">도서검색</h2>
			<div class="inner_nav">
				<ul class="list_menu">
					<li class="list-item active"><a href="${ctx}/book/SearchResult.do" style="background: #FFFDE4;">도서검색<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/book/recommendedBooks.do">사서추천도서<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/book/Newbooks.do">신착도서<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/popularBook.do">이달의 인기도서<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
				</ul>
			</div>

		</div>

		<div class="page_section">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<div class="input-group noto-serif">
							<input class="form-control searchbar" id="bookName" type="text"
								placeholder="검색어를 입력하세요." >
							<script>
							// 페이지가 로드될 때 URL에서 query 값을 가져와서 입력 필드에 설정
							window.addEventListener("load", function() {
							    // 현재 URL에서 query 문자열을 가져오기
							    var url = new URL(window.location.href);
							    var queryValue = url.searchParams.get("query");
							    
							    // 입력 필드에 query 값을 설정
							    document.getElementById("bookName").value = queryValue;
							});
							
							</script>
							<div class="input-group-append">
								<button class="btn btn-outline-success btn-r" type="button"
									id="search">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>도서검색</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
							</div>
						</div>
						<br><br><br>
						<!-- CARD COLUMNS -->
						<div class="searchResult-body">
							
						</div>
						<div class="layout-pagination">
						    <div class="pagediv">
								<div class="paging">
									
								</div>						    
						    </div>
						</div>
					</div>				
				</div>
			</div>
			
		</div>
		
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
	      <script type="text/javascript"   src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>