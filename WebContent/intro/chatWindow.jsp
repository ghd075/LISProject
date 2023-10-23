<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>도서 통합 정보 시스템 - 묻고 답하기</title>
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
<title>웹소켓 채팅</title>
<script>
var webSocket
    = new WebSocket("<%= application.getInitParameter("CHAT_ADDR") %>/ChatingServer");
var chatWindow, chatMessage, chatId;

// 채팅창이 열리면 대화창, 메시지 입력창, 대화명 표시란으로 사용할 DOM 객체 저장
window.onload = function() {
    chatWindow = document.getElementById("chatWindow");
    chatWindow.style.border = "1px solid lightgrey";
    chatWindow.style.width = "400px";
    chatWindow.style.height = "600px";
    chatWindow.style.marginLeft = "300px";
    chatMessage = document.getElementById("chatMessage");
    chatId = document.getElementById('chatId').value;    
}

// 메시지 전송
function sendMessage() {
	// 대화창에 표
    chatWindow.innerHTML += "<div class='chatMessageContainer user' style='text-align: right;'><div style='display:inline-block;'><span class='sender'>You:</span><div class='message'>" + chatMessage.value + "</div></div></div>";
    webSocket.send(chatId + '|' + chatMessage.value);// 서버로 전송
    chatMessage.value = "";// 메시지 입력창 내용 지우기
    chatWindow.scrollTop = chatWindow.scrollHeight;// 대화창 스크롤
}

// 서버와의 연결 종료
function disconnect() {
    webSocket.close();
}

// 엔터 키 입력 처리
function enterKey() {
    if (window.event.keyCode == 13) {  // 13은 'Enter' 키의 코드값
        sendMessage();
    }
}

// 웹소켓 서버에 연결됐을 때 실행
webSocket.onopen = function(event) {   
    chatWindow.innerHTML += "실시간 1:1 문의 화면 입니다.<br/>";
};

// 웹소켓이 닫혔을 때(서버와의 연결이 끊겼을 때) 실행
webSocket.onclose = function(event) {
    chatWindow.innerHTML += "채팅이 종료 되었습니다.<br/>";
};

// 에러 발생 시 실행
webSocket.onerror = function(event) { 
    alert(event.data);
    chatWindow.innerHTML += "채팅 중 에러가 발생하였습니다.<br/>";
}; 

// 메시지를 받았을 때 실행
webSocket.onmessage = function(event) { 
    var message = event.data.split("|");
    var sender = message[0];
    var content = message[1];
    if (content != "") {
        if (content.match("/")) {
            if (content.match(("/" + chatId))) {
                var temp = content.replace(("/" + chatId), "[귓속말] : ");
                chatWindow.innerHTML += "<div class='chatMessageContainer admin' style='text-align: left;'><div style='display:inline-block;'><span class='sender'>" + sender + ":</span><div class='message'>" + temp + "</div></div></div>";
            }
        }
        else {
            chatWindow.innerHTML += "<div class='chatMessageContainer admin' style='text-align: left;'><div style='display:inline-block;'><span class='sender'>" + sender + ":</span><div class='message'>" + content + "</div></div></div>";
        }
    }
    chatWindow.scrollTop = chatWindow.scrollHeight; 
};

</script>
<style>  <!-- 대화창 스타일 지정 -->  
    #chatWindow {
        border: 1px solid lightgrey;
        width: 400px;
        height: 600px;
        margin-left: 300px;
        background-color: #f4f4f4;
        border-radius: 10px;
        padding: 10px;
        overflow-y: auto;
    }

     .chatMessageContainer {
       text-align: right;
/*         display: flex;
        justify-content: flex-end; /* 자신의 메시지를 오른쪽에 정렬 */ */
        margin: 10px 0;
    }

    .chatMessageContainer .sender {
        font-weight: bold;
        margin-right: 10px;
    }

    .chatMessageContainer .message {
        background-color: #007bff;
        color: #fff;
        padding: 10px;
        border-radius: 5px;
        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
    }

    .receivedMessageContainer {
        display: flex;
        justify-content: flex-start; /* 받은 메시지를 왼쪽에 정렬 */
        margin: 10px 0;
    }

    .receivedMessageContainer .sender {
        font-weight: bold;
        margin-right: 10px;
    }

    .receivedMessageContainer .message {
        background-color: #f4f4f4; /* 상대방 메시지의 배경색을 변경 */
        color: #000;
        padding: 10px;
        border-radius: 5px;
        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
    }


    .receivedMessageContainer {
        display: flex;
        justify-content: flex-start; /* 받은 메시지를 왼쪽에 정렬 */
        margin: 10px 0;
    }

    .receivedMessageContainer .sender {
        font-weight: bold;
        margin-right: 10px;
    }

   .receivedMessageContainer .message {
        background-color: #fff;
        color: #000;
        padding: 10px;
        border-radius: 5px;
        box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
    }

    #chatMessage {
        width: 186px;
        height: 30px;
        padding: 5px;
        border: 1px solid lightgrey;
        border-radius: 5px;
    }

    #sendBtn {
        height: 30px;
        width: 50px;
        line-height: 30px;
        font-size: 12px;
        text-align: center;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

</style>
</head>

<body>  <!-- 대화창 UI 구조 정의 --> 
<!-- PAGE HEADER -->
	<header id="page-header" class="noto-serif">
		<div class="page-header-overlay">
			<div class="container pt-5">
				<div class="row">
					<div class="col-md-6 m-auto text-center page-header-top">
						<h2>1:1 문의</h2>
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
					<li class="list-item "><a href="${ctx}/intro/noticeList.do" >공지사항<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/faqList.do">자주하는질문<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item active"><a href="${ctx}/intro/qnaList.do" style="background: #FFFDE4;">묻고 답하기<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
					<li class="list-item"><a href="${ctx}/intro/addrViewpageAPI.do">오시는길<span
							class="aside_arrow"><i class="fa fa-caret-right"></i></span></a></li>
				</ul>
			</div>

			<a href="${ctx}/intro/chatWindow.do"
				class="link_inquire"> <span class="emph">도움이 필요하신가요 ?</span>
				1:1 문의하기
			</a>
		</div>

		<div class="page_section">
			<div class="head_aticle">
				<h2 class="tit">
					1:1 문의 <span class="tit_sub"> 실시간 1:1 문의 화면 입니다. </span>
				</h2>
			</div>
			<table width="100%" class="text-center" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td>
							<div class="section_t">
								<table width="100%" class="board-listheader" cellpadding="0"
									cellspacing="0">
									<tbody>
									 <input type="hidden" id="chatId" value="${ loginId }" readonly />
    										&nbsp;&nbsp;
    										<br><br>
											<div id="chatWindow"></div>
											<br>
											<div>
											     &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="chatMessage" onkeyup="enterKey();">
											&nbsp;&nbsp; <button id="sendBtn" onclick="sendMessage();">전송</button>
											
											</div>   
											<br><br> 
									</tbody>
								</table>
							</div>
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
			
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
 
</body>
</html>