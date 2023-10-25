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

     /* 추천도서 누르면 bookDetail 페이지로 이동 */
     $(function() {
        $('.card_image-holder').click(function() {
           location.href = "" + contextPath + "book/detailBook.do?b_no=1&query='" + $(this).find('#book-title').text();
        })
     });
        
  
<!-- 미로그인시 글쓰기 버튼 누르면 로그인페이지로 이동 -->
$(function(){

  /*************************************************************************
   * 관리 버튼 눌렀을때 체크박스 띄우면서 삭제할 부분 띄우기 *
   *************************************************************************/
  $("#manage_btn").click(function(){
     $("div.btn-front").toggle('fast');
     $("input.delete_check").toggle('fast');
     
     $(".delete_check").css('display','inline-block');
     $(".btn").css('display','inline-block');
     $(".btn-front").css('display','block');
     var btn = document.querySelector( '.btn' );
  
     var btnFront = btn.querySelector( '.btn-front' ),
         btnYes = btn.querySelector( '.btn-back .yes' ),
         btnNo = btn.querySelector( '.btn-back .no' );
  
     btnFront.addEventListener( 'click', function( event ) {
       var mx = event.clientX - btn.offsetLeft,
           my = event.clientY - btn.offsetTop;
  
       var w = btn.offsetWidth,
           h = btn.offsetHeight;
        
       var directions = [
         { id: 'top', x: w/2, y: 0 },
         { id: 'right', x: w, y: h/2 },
         { id: 'bottom', x: w/2, y: h },
         { id: 'left', x: 0, y: h/2 }
       ];
       
       directions.sort( function( a, b ) {
         return distance( mx, my, a.x, a.y ) - distance( mx, my, b.x, b.y );
       } );
       
       btn.setAttribute( 'data-direction', directions.shift().id );
       btn.classList.add( 'is-open' );
  
     } );

     btnYes.addEventListener( 'click', function( event ) {	
		  btn.classList.remove( 'is-open' );
	  } );
	
	  btnNo.addEventListener( 'click', function( event ) {
		  btn.classList.remove( 'is-open' );
	  } );
  
  
  
     function distance( x1, y1, x2, y2 ) {
       var dx = x1-x2;
       var dy = y1-y2;
       return Math.sqrt( dx*dx + dy*dy );
     }
  });   
  
  $(".yes").click(function(){
     var check_val_arr = [];
     
     $('input:checked').each(function(i){
        check_val_arr.push($(this).val());
     })      
     var data = {"fol_no_arr" : check_val_arr};
     
      $.ajax({
           url:"/update_borrow",
           data:data, type:"POST",
           success:function(res){
          if(res == 1) {
            location.href = "http://localhost:8088/borrowList.do";
             alert('반납처리에 완료하였습니다.');
          }
          else if(res == -1){
             alert('반납처리에 실패하였습니다.');
          }
          else if(res == -2){
           alert('반납이 완벽히 완료되지않았습니다. 폴더를 확인해주세요.');
             location.href = "http://localhost:8088/borrowList.do";
          }
        console.log(check_val_arr);
     }}); 
  });

  window.onload = function() {
      function onClick() {
          document.querySelector('.modal_wrap_fol').style.display ='block';
          document.querySelector('.black_bg_fol').style.display ='block';
      }   
      function offClick() {
          document.querySelector('.modal_wrap_fol').style.display ='none';
          document.querySelector('.black_bg_fol').style.display ='none';
      }
   
  };   

  $("#btn_fol_add").click(function(){
     var fol_title = $("#fol_title_text").val();
     console.log(fol_title);
  });

     
  
});

$(function(){
  var manage_btn = $(this).parent().find(button);
  $(manage_btn).click(function(){
     const check = confirm("반납하시겠습니까?");
     if(check){
        alert("완료되었습니다");
     }else{
        alert("취소되었습니다");
     };
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
						<h2>대출현황</h2>
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
					<li class="list-item active"><a href="${ctx}/mypage/borrowList.do" style="background: #FFFDE4;">대출현황<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/mypage/return_borrowList.do" >대출반납이력<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/mypage/MyPage_Info.do" >개인정보수정<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
				</ul>
			</div>
		</div>

		<div class="page_section">
			<button type="button" id="manage_btn" class="noto-serif">관리</button>
			<div class="btn" id="return_btn">
              <div class="btn-back">
                <p>정말 반납 하시겠습니까?</p>
                <button class="yes">Yes</button>
                <button class="no">No</button>
              </div>
              <div class="btn-front noto-serif">반납</div>			
			</div>
			
			<div class="cards">
			 	<c:if test="${empty b }">
			 		<h3> 대여목록이 없습니다.</h3><br>
			 	</c:if>
				<c:if test="${not empty b}">
				    <c:set var="now" value="<%=new java.util.Date()%>" />
				    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="now_date" />
				    <c:forEach var="b" items="${b}">
				        <input type="hidden" value="${b.return_date}" id="return_date_ok" />
				        <fmt:parseDate value="${now_date}" var="strPlanDate" pattern="yyyy-MM-dd" />
				        <fmt:parseNumber value="${strPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="strDate"></fmt:parseNumber>
				        <%-- ${now} --%>
				        <fmt:parseDate value="${b.return_date}" var="endPlanDate" pattern="yyyy-MM-dd" />
				        <fmt:parseNumber value="${endPlanDate.time / (1000*60*60*24)}" integerOnly="true" var="endDate"></fmt:parseNumber>
				        <%-- ${endDate} --%>
				        <div class="card">
				            <div class="card_image-holder">
				                <img class="card_image" src="${b.b_image}" alt="wave" />
				                <div class="card-text" id="book-title">${b.b_title}</div>
				            </div>
				            <div>
				                <div class="card-text">${b.b_writer}
				                    <c:if test="${b.return_ok eq 'P'}">
				                        <b class="btn btn-outline-warning btn-sm" style="width: 80px; display: inline-block;">반납 대기</b>
				                    </c:if>
				                    <c:if test="${b.return_ok != 'P' && now<=b.return_date}">
				                        <b class="btn btn-outline-success btn-sm" style="display: inline-block;">대여 중</b>
				                    </c:if>
				                    <p class="m-0">대여일: ${b.bor_date}</p>
				                    <p class="m-0">반납 예정일: ${b.return_date}</p>
				                    <input type="checkbox" name="delete_check_name" value="${b.bor_no}" style="display: none;" class="delete_check">
				                    <c:if test="${(endDate - strDate) < 0}">
				                        <p class="m-0" style="color: red;">연체일수: ${(endDate - strDate)*-1}일</p>
				                    </c:if>
				                    <c:if test="${(endDate - strDate) >= 0}">
				                        <p class="m-0">&nbsp;</p>
				                    </c:if>
				                </div>
				            </div>
				        </div>
				    </c:forEach>
				</c:if>
			 	
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