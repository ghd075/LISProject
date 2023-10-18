<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
footer {
	clear:both;
	position: relative;
	width: 1080px;
	margin: 0 auto;
	background-color: white;
	letter-spacing: -0.4px;
	
}

#mSsakInfo {
	width: 1080px;
	margin: 0 auto;
}

hr {
	height: 1px;
	background-color: #425c5a;
	clear: both;
}

#mSsakInfo ul {
	width: 100%;
	margin-left: 10px;
	left: 0;
}

#mSsakInfo ul li {
	font-size: 14px;
	float: left;
	padding: 5px 30px 5px 0;
	float: left;
}

.footer_cont {
	position: relative;
	width: 1080px;
	height: 250px;
	margin: 0 auto;
	margin-top: 20px;
	color: #777777;
}
/* footer left */
#mSsakInfo_text {
	width: 50%;
	font-size: 14px;
	line-height: 20px;
	float: left;
	margin-top: 20px;
}
/* footer right */
#mCS {
	position: relative;
	margin-left: 650px;
}

#mCS_title {
	font-size: 16px;
	padding-top: 30px;
}

#mCS_phone {
	font-size: 30px;
	padding: 5px 0 30px 0;
	font-weight: 600;
}

.mCS_opertime1 {
	font-size: 14px;
	line-height: 18px; 
	float : left;
	padding-right: 60px;
	float: left;
}

.mCS_opertime2 {
	font-size: 14px;
	line-height: 18px;
}
</style>
</head>
<body>
	<footer>
		<hr>
		<div id="mSsakInfo">
			<ul>
				<li><a href="#">LIS 소개</a></li>
				<li><a href="#">이용약관</a></li>
				<li><a href="#">개인정보처리방침</a></li>
				<li><a href="#">이용안내</a></li>
			</ul>
		</div>
		<hr style="top: 50px;">
		<div class="footer_cont">
			<div id="mSsakInfo_text">
				<img src="<%=request.getContextPath() %>/images/LIS_Logo.png" width="80px"> <br>
				<br> 환영합니다 LIS입니다 &nbsp;&nbsp; | &nbsp;&nbsp;대전광역시 중구 계룡로 846, 3-4층
				<br> 이메일 주소 lisofficial@gmail.com 
				<br> 팀원 : 홍창용, 김선욱, 김지호, 김영진
				<br><br>Copyright © 2023 lis
				All Rights Reserved.
			</div>
			<div id="mCS">
				<div id="mCS_title">고객센터</div>
				<div class="mCS_info">
					<div id="mCS_info_left">
						<p id="mCS_phone">1544-1000</p>
					</div>
					<div id="mCS_info_right">
						<div class="mCS_opertime1">
							고객센터 운영시간<br> 평일 오전 9시 ~ 오후 6시<br> 주말 및 공휴일 상담불가<br>
						</div>
						<div class="mCS_opertime2">
							온라인문의<br> 24시간 접수 가능<br> 친절히 상담해드리겠습니다!<br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>