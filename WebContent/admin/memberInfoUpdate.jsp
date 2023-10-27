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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"crossorigin="anonymous"></script>

<link href="${ctx}/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${ctx}/css/memberregister.css" rel="stylesheet" type="text/css">

<script type="text/javascript">



function goUpdate(){

	pw = $("#mpw").val();
	pwre =$("#pwre").val();
	memail=$("#memail").val();
	mphone=$("#mphone").val();
	mzip_code=$("#mzip_code").val();
	m_first_addr=$("#m_first_addr").val();
	m_second_addr = $("#m_second_addr").val();
	
	if(pw === "" || pwre ==="" || memail==="" ||mphone==="" || mzip_code==="" || m_first_addr==="" || m_second_addr==="")
	{
		alert("필수 항목을 모두 입력하세요");
		return;
	}
	
	
		var frm = document.register_frm;
			frm.action="<%=request.getContextPath()%>/admin/memberInfoUpdateDone.do?";
			frm.method = "post";
			frm.submit();
		};
		
</script>
<style>
#login
{
		padding-left : "200px";
	margin-left : "200px";

}
table
{
	padding-left : "200px";
	margin-left : "200px";

}
#register_frm
{

	padding-left : "200px";
	margin-left : "200px";

}


.form_btn2 {
	border: 1px solid #425c5a;
	background-color: #fff;
	color: #425c5a;
	display: inline-block;
	width: 100px;
	margin: 10px 5px;
	vertical-align: top;
	margin-top: 5px;
	height: 32px;
	border-radius: 3px;
	font-weight: 700;
	font-size: 12px;
	line-height: 30px;
	text-align: center;
	height: 44px;
	transition: background-color 0.3s; /* 마우스 오버 시 배경색 전환 효과 */
}

.form_btn2:hover {
  background-color: #425c5a; /* 마우스 오버 시 배경색 변경 */
  color: #fff; /* 마우스 오버 시 글자색 변경 */
}



</style>
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
					<li class="list-item"><a href="${ctx}/admin/borrowList.do">도서 예약 정보 조회<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
				</ul>
			</div>

	
		</div>
		<div class="page_section">
			<div class="head_aticle">
				<h2 class="tit">
					회원 정보 조회 및 수정 <span class="tit_sub"> 회원 정보 조회 및 수정 화면 입니다. </span>
				</h2>
			</div>

		<c:if test="${not empty memberInfo}">
		<form id = "register_frm" name="register_frm">
			<table id = "login" width="120%" class="board-listheader" cellpadding="0"
									cellspacing="0">
				<tbody>
					<tr>
						<th>아이디<span id="ico">*</span></th>
						<td><input type="text" class="form_input" name="mid" id="mid"
							placeholder="5~20자 영문,숫자 입력" value="${memberInfo.mid}" readonly>
							
					</tr>
					<tr>
						<th></th>
						<td><span id="id_res"></span></td>
					</tr>
					
					<tr>
						<th>비밀번호<span id="ico">*</span></th>
						<td><input type="password" class="form_input" name="mpw"
							id="mpw" placeholder="8자 이상, 대문자/소문자/숫자/특수문자  모두 포함."  required >
						</td>
					</tr>
					<tr>
						<th></th>
						<td><span id="pw_res"> </span></td>
					</tr>
					<tr>
						<th>비밀번호확인<span id="ico">*</span></th>
						<td><input type="password" class="form_input" name="pwre"
							id="pwre" placeholder="비밀번호를 한번 더 입력해주세요" required></td>
					</tr>

					<script type="text/javascript">
						var pwreg=false;
						$("#mpw").on("input",
						function() {
							var a = $("#mpw").val();
							var regex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
							if (!regex.test(a)) {
								pwreg = false;
								$("#pw_res").html('비밀번호 형식이 맞지않습니다.').css("color", "red");
								return;
							} else {
								pwreg = true;
								$("#pw_res").html('비밀번호 형식이 맞습니다.').css("color", "blue");
							}});

						$("#pwre").focusout(function() {
							var pw1 = $("#mpw").val();
							var pw2 = $("#pwre").val();
							if (pw1 != "" && pw2 != "") {
								{
									if (pw1 != pw2) {
										Swal.fire('비밀번호를 동일하게 입력해주세요', '', 'info');
										//alert('비밀번호 동일하게 입력해주세요');
										$("#mpw").focus();
										$("#mpw").val('');
										$("#pwre").val('');
										return false;
									}
								}
							}
						});
					</script>
					<tr>
						<th>이메일 주소<span id="ico">*</span></th>
						<td><input type="text" class="form_input" name="memail"
							id="memail" required value="${memberInfo.memail}">
							<button type="button" id="emailDoubleChk" class="form_btn2" required>중복확인</button></td>
					</tr>
					<tr>
						<th></th>
						<td><span id="email_res"></span></td>
					</tr>
					<script type="text/javascript">
						var emailreg = false;
						var emaildbchk = 0;
						
						$("#memail").on("click",function() {
							var a = $("#memail").val();
							var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							if (!regex.test(a)) {
								emailreg = false;
								$("#email_res").html("이메일 형식이 맞지 않습니다").css("color", "red");
								return;} 
							else{ 
								emailreg = true;
								$("#email_res").html("이메일 형식이 맞습니다.").css("color", "blue");
								}
							});
						

						$("#memail").on("input",function() {
							var a = $("#memail").val();
							var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							if (!regex.test(a)) {
								emailreg = false;
								$("#email_res").html("이메일 형식이 맞지 않습니다").css("color", "red");
								return;} 
							else{ 
								emailreg = true;
								$("#email_res").html("이메일 형식이 맞습니다.").css("color", "blue");
								}
							});

						$("#emailDoubleChk").on("click", function() {
						    var memailValue = $("#memail").val();

						    if (memailValue === "") {
						        Swal.fire('이메일을 입력해주세요.', '', 'info');
						        return; // 이메일이 비어있을 때 처리 중단
						    }

						    if (!emailreg) {
						        Swal.fire('이메일 형식을 맞추어 주세요.', '', 'info');
						        return; // 이메일 형식이 맞지 않을 때 처리 중단
						    }
							
							$.ajax({
								url : "<c:url value='/member/CheckEmail.do'/>",
								data : {
									memail: memailValue
								},
								success : function(res) {
									if(res == 1){
										//alert('사용가능한 이메일입니다');
										Swal.fire('사용가능한 이메일입니다.', '', 'success');
										emaildbchk = 1;
									} else if(res == 0){
										//alert('이미 사용중인 이메일입니다');
										Swal.fire('이미 사용중인 이메일입니다.', '', 'info');
										emaildbchk = 2;
									}else{
										Swal.fire(res, '', 'warning');
										//alert(res);
									}
								},
								error : function() {
									//alert('오류가 발생했습니다');
									Swal.fire('오류가 발생했습니다', '', 'error');
								}
							});
						});
					</script>

					<tr>
						<th>이름<span id="ico">*</span></th>
						<td><input type="text" class="form_input" name="mname"
							id="mname" value="${memberInfo.mname}" readonly></td>
					</tr>
					<tr>
						<th><label for="tel">휴대전화<span id="ico">*</span></label></th>
						<td><input type="text" class="form_input" name="mphone"
							id="mphone" placeholder="숫자만 입력해주세요" required value="${memberInfo.mphone}"></td>
					</tr>
					<tr>
						<th>우편번호<span id="ico">*</span></th>
						<td><input type="text" id="mzip_code" name="mzip_code"
							class="form_input" placeholder="우편번호" required>
							<button type="button" class="form_btn2"
								onclick="sample4_execDaumPostcode();" value="${memberInfo.mzip_code}" >우편번호 찾기</button></td>
					</tr>

					<script type="text/javascript">
						function sample4_execDaumPostcode() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var roadAddr = data.roadAddress; // 도로명 주소 변수
											var extraRoadAddr = ''; // 참고 항목 변수

											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if (data.bname !== ''
													&& /[동|로|가]$/g
															.test(data.bname)) {
												extraRoadAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if (data.buildingName !== ''
													&& data.apartment === 'Y') {
												extraRoadAddr += (extraRoadAddr !== '' ? ', '
														+ data.buildingName
														: data.buildingName);
											}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if (extraRoadAddr !== '') {
												extraRoadAddr = ' ('
														+ extraRoadAddr + ')';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document
													.getElementById('mzip_code').value = data.zonecode;
											document
													.getElementById("m_first_addr").value = roadAddr;
											document
													.getElementById("sample4_jibunAddress").value = data.jibunAddress;

											// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
											if (roadAddr !== '') {
												document
														.getElementById("sample4_extraAddress").value = extraRoadAddr;
											} else {
												document
														.getElementById("sample4_extraAddress").value = '';
											}

											var guideTextBox = document
													.getElementById("guide");
											// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
											if (data.autoRoadAddress) {
												var expRoadAddr = data.autoRoadAddress
														+ extraRoadAddr;
												guideTextBox.innerHTML = '(예상 도로명 주소 : '
														+ expRoadAddr + ')';
												guideTextBox.style.display = 'block';

											} else if (data.autoJibunAddress) {
												var expJibunAddr = data.autoJibunAddress;
												guideTextBox.innerHTML = '(예상 지번 주소 : '
														+ expJibunAddr + ')';
												// guideTextBox.style.display = 'block';
											} else {
												guideTextBox.innerHTML = '';
												guideTextBox.style.display = 'none';
											}
										}
									}).open();
						}
					</script>
					<tr>
						<th>주소<span id="ico">*</span></th>
						<td><input type="text" id="m_first_addr" name="m_first_addr"
							class="form_input" value="${memberInfo.m_first_addr}" required></td>
						<td><span id="guide" style="color: #999; display: none"></span></td>
					</tr>
					<tr>
						<th>상세주소 1<span id="ico">*</span></th>
						<td><input type="text" id="m_second_addr"
							name="m_second_addr" class="form_input" placeholder="상세주소" value="${memberInfo.m_second_addr}" required></td>
						<td><input type="text" id="sample4_extraAddress"
						class="form_input"></td>
					</tr>
					
					<tr>
						<td><input type="text" id="sample4_jibunAddress"
							class="form_input"></td>
					</tr>

				</tbody>

				<tfoot>
					<tr>
						<td colspan="3" id="footer"><button type="submit"
								id="register_ok" onclick="goUpdate();">회원정보 수정</button>
					</tr>
				</tfoot>

			</table>
		</form>
		</c:if>
	<br><br>
	</div>
	
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
</body>
</html>
