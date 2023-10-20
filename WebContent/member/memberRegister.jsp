<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도서 통합 정보 시스템 - 회원가입</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- 카카오 주소 API사용 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<link href="${ctx}/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${ctx}/css/memberregister.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- sweetalert2 사용 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>	
</head>

<body>
	<div class="register_res">
		<c:if test="${not empty register_fail}">
			<script>  
			Swal.fire('${register_fail}', '', 'error');
			</script>
		</c:if>
	</div>
	<div class="form_wrap">
		<!-- 타이틀 -->
		<h1 class="heroTitle">
			<span class="heroTitle_dot"><i class="fas fa-book-open"></i></span>&nbsp;&nbsp; <span class="heroTitle_kor">회원가입</span>
		</h1>	
		<p id="required_sub">
			<span id="ico">*</span>필수 입력사항
		</p>
		<p id="title_bottom"></p>
		<form name="register_frm">
			<table id="login">
				<tbody>
					<tr>
						<th>아이디<span id="ico">*</span></th>
						<td><input type="text" class="form_input" name="mid" id="mid"
							placeholder="5~20자 영문,숫자 입력" required>
							<button type="button" class="form_btn" id="idDoubleChk">중복확인</button></td>
					</tr>
					<tr>
						<th></th>
						<td><span id="id_res"></span></td>
					</tr>
					<script type="text/javascript">
						//아이디
						var idreg = false;
						var iddbchk = 0;
						$("#mid").on("input", function() {
							var a = $("#mid").val();
							var regex = /[A-Za-z0-9]{5,20}/;
							if (!regex.exec(a)) {
								idreg = false;
								$("#id_res").html("아이디 형식이 맞지 않습니다");
								return;
							} else {
								idreg = true;
								$("#id_res").html("아이디 형식이 맞습니다.");
							}
						});
						
						$("#idDoubleChk").on("click", function() {
						    var midValue = $("#mid").val();

						    if (midValue === "") {
						        Swal.fire('아이디를 입력해주세요.', '', 'warning');
						        return; // 아이디가 비어있을 때 처리 중단
						    }							
							
							$.ajax({
								type : 'post',
								url : "<c:url value='/member/CheckId.do'/>",
								data : {
									mid : midValue
								},
								success : function(res) {
									if(res == 1){
										//사용가능
										iddbchk = 1;
										Swal.fire('사용가능한 아이디입니다.', '', 'success');
									}else if(res == 0){
										iddbchk = 2;
										Swal.fire('이미 사용중인 아이디입니다.', '', 'warning');
									}else{
										Swal.fire(res, '', 'warning');
									}
								},
								error : function(jqXHR,textStatus, errorThrown) {
									//alert('오류가 발생했습니다');
									Swal.fire('오류가 발생했습니다', '', 'error');
									console.log(jqXHR.status);
									console.log(textStatus);
									console.log(errorThrown);
								}
							});
						});								
					</script>
					<tr>
						<th>비밀번호<span id="ico">*</span></th>
						<td><input type="password" class="form_input" name="mpw"
							id="mpw" placeholder="8자 이상, 대문자/소문자/숫자/특수문자  모두 포함." required>
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
							if (!regex.exec(a)) {
								pwreg = false;
								$("#pw_res").html('비밀번호 형식이 맞지않습니다.');
								return;
							} else {
								pwreg = true;
								$("#pw_res").html('비밀번호 형식이 맞습니다.');
							}});

						$("#pwre").focusout(function() {
							var pw1 = $("#mpw").val();
							var pw2 = $("#pwre").val();
							if (pw1 != "" && pw2 != "") {
								{
									if (pw1 != pw2) {
										Swal.fire('비밀번호를 동일하게 입력해주세요', '', 'warning');/
										/alert('비밀번호 동일하게 입력해주세요');
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
							id="memail" required>
							<button type="button" class="form_btn" id="emailDoubleChk">중복확인</button></td>
					</tr>
					<tr>
						<th></th>
						<td><span id="email_res"></span></td>
					</tr>
					<script type="text/javascript">
						var emailreg = false;
						var emaildbchk = 0;
						$("#memail").on("input",function() {
							var a = $("#memail").val();
							var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
							if (!regex.exec(a)) {
								emailreg = false;
								$("#email_res").html("이메일 형식이 맞지 않습니다");
								return;} 
							else{ 
								emailreg = true;
								$("#email_res").html("이메일 형식이 맞습니다.");
								}
							});

						$("#emailDoubleChk").on("click", function() {
						    var memailValue = $("#memail").val();

						    if (memailValue === "") {
						        Swal.fire('이메일을 입력해주세요.', '', 'warning');
						        return; // 이메일이 비어있을 때 처리 중단
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
										Swal.fire('이미 사용중인 이메일입니다.', '', 'warning');
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
							id="mname" required></td>
					</tr>
					<tr>
						<th><label for="tel">휴대전화<span id="ico">*</span></label></th>
						<td><input type="text" class="form_input" name="mphone"
							id="mphone" placeholder="숫자만 입력해주세요" required></td>
					</tr>
					<tr>
						<th>우편번호<span id="ico">*</span></th>
						<td><input type="text" id="mzip_code" name="mzip_code"
							class="form_input" placeholder="우편번호">
							<button type="button" class="form_btn"
								onclick="sample4_execDaumPostcode();">우편번호 찾기</button></td>
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
							class="form_input"></td>
						<td><span id="guide" style="color: #999; display: none"></span></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="text" id="m_second_addr"
							name="m_second_addr" class="form_input" placeholder="상세주소"></td>
						<td><input type="text" id="sample4_jibunAddress"
							class="form_input"></td>
						<td><input type="text" id="sample4_extraAddress"
							class="form_input"></td>

					</tr>

					<tr>
						<th class="mgender_wrap">성별</th>
						<td><span class="mgender_label"><input type="radio"
								name="mgender" id="m" value="1"> <label for="m">남자</label></span><span
							class="mgender_label"> <input type="radio" name="mgender"
								id="f" value="2"> <label for="f">여자</label></span><span
							class="mgender_label"><input type="radio" name="mgender"
								id="n" value="3"><label for="n">선택안함</label></span></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="text" class="form_input" id="mbirthday"
							name="mbirthday" placeholder="YYYY/MM/DD"></td>
					</tr>
					<tr>
						<th>이용약관동의</th>
						<td><input type="checkbox" class="form_input_chk" id="f_chk1"
							required> <label for="f_chk1">이용약관 동의(필수)</label></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="checkbox" class="form_input_chk" id="f_chk2"
							required> <label for="f_chk2">개인정보 수집 및 이용(필수)</label></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="checkbox" class="form_input_chk" id="f_chk3">
							<label for="f_chk3">이벤트, 혜택 알림 수신 동의(선택)</label></td>
					</tr>

				</tbody>

				<tfoot>
					<tr>
						<td colspan="3" id="footer"><button type="submit"
								id="register_ok" onclick="goRegister();">회원가입</button>
					</tr>
				</tfoot>

			</table>
		</form>
		<p id="required_sub"></p>
	</div>
	<br><br><br>
	<script>
	function goRegister(){
		if(iddbchk == 0){
			//alert('아이디 중복체크를 해주세요.');
			Swal.fire('아이디 중복체크를 해주세요.', '', 'info');
		}else if(iddbchk == 2){
			Swal.fire('사용중인 아이디 입니다. 변경해주세요.', '', 'info');
			//alert('사용중인 아이디 입니다. 변경해주세요.');
		}else if(emaildbchk == 0){
			Swal.fire('이메일 중복체크를 해주세요.', '', 'info');
			//alert('이메일 중복체크를 해주세요.');
		}else if(emaildbchk == 2){
			Swal.fire('사용중인 이메일입니다. 변경해주세요.', '', 'info');
			//alert('사용중인 이메일입니다. 변경해주세요.');
		}
		else{ 
			if(idreg == false){
				console.log(idreg);
				Swal.fire('아이디 형식을 바르게 입력해주세요.', '', 'info');
				//alert('아이디 형식을 바르게 입력해주세요');
			}else if(pwreg == false){
				console.log(pwreg);
				Swal.fire('비밀번호 형식을 바르게 입력해주세요.', '', 'info');
				//alert('비밀번호 형식을 바르게 입력해주세요');
			}else if(emailreg == false){
				Swal.fire('이메일 형식을 바르게 입력해주세요.', '', 'info');
				//alert('이메일 형식을 바르게 입력해주세요');
			}else if($('#f_chk1').prop('checked') == false || $('#f_chk2').prop('checked') == false){
				Swal.fire('필수 약관에 동의 하셔야 합니다.', '', 'info');
				//alert('필수 약관에 동의 하셔야 합니다.');
			}else{
				var frm=document.register_frm;
				frm.action="<c:url value='/member/memberJoin.do'/>";
				frm.method = "post";
				frm.submit();
			}
		}
	}
	</script>

</body>

</html>