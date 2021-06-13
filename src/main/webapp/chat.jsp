<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
 <!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/commons.css">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jQuery.js"></script>
<script src="js/webcafe.js"></script>
<title>채팅방</title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		#chat{
		margin: 0 auto;
 		width: 600px;
 		background:#F9FBFF;
		border-radius: 5px;
		}
		
		#chat2{
		margin: 0 auto;
 		width: 500px;
 		background:#F9FBFF;
		border-radius: 5px;
		}
		
		
		#chatinput {
    	border-radius: 3px;
    	border: none;
    	padding: 14px;
    	color: black;
    	background: #6A6C75;
    	width: 90%;
    	font-size: 14px;
  }
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		
		.container {
 	 	 margin: 0 auto;
 		 width: 650px;
 		 background: #444753;
 	 	 background: linear-gradient(to bottom left, #0f5132 40%, #F9FBFF 100%);
  		border-radius: 10px 10px 10px 10px;
}		
		
	
		.container h1{
			font-family:"Nanum";
			font-size:15px;
			font-weight:bold;
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #0f5132;
			border-left: 3px solid #0f5132;
			margin-bottom: 20px;
		}
		.chating{
		/*	background-color: #C5DDEB;*/
			background-color: #F9FBFF;
			font: 14px/20px
			width: 500px;
			height: 500px;
			overflow: auto;
			border-radius: 10px 10px 10px 10px;
		}
		.chating .me{
			color: #0f5132;
			text-align: right;
			font-weight:bold;
		}
		.chating .others{
			color: #FFE400;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		
	</style>
</head>

<script type="text/javascript">
	window.onload = wsOpen;
	var ws;
	
	function wsOpen(){
		//웹소켓 전송시 현재 방의 번호를 넘겨서 보낸다.
		ws = new WebSocket("ws://" + location.host + "/chating/"+$("#roomNumber").val());
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			if(msg != null && msg.trim() != ''){
				var d = JSON.parse(msg);
				if(d.type == "getId"){
					var si = d.sessionId != null ? d.sessionId : "";
					if(si != ''){
						$("#sessionId").val(si); 
					}
				}else if(d.type == "message"){
					if(d.sessionId == $("#sessionId").val()){
						$("#chating").append("<p class='me'>나 :" + d.msg + "</p>");	
					}else{
						$("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
					}
						
				}else{
					console.warn("unknown type!")
				}
			}
		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

	function send() {
		var option ={
			type: "message",
			roomNumber: $("#roomNumber").val(),
			sessionId : $("#sessionId").val(),
			userName : $("#id").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
</script>
<body>
<!-- #wrapper 시작 -->
	<div id="wrapper">
	
		<!-- #header 시작 -->
		<jsp:include page="WEB-INF/header.jsp" />
		<!-- //#header 종료 -->
		<!-- #visual 시작 -->
		<!-- //#visual 종료 -->
		
		<!-- #contentsArea 시작 -->
		<div id="contentsArea"> 
		
	<div id="container" class="container">
	<div id="chat" class="container">
		<h1>${roomName}의 채팅방</h1>
		<input type="hidden" id="sessionId" value="">
		<input type="hidden" id="roomNumber" value="${roomNumber}">
		<input type="hidden"  name="id" id="id" value="${user.id}"/>
		<div id="chating" class="chating">
		</div>
		
		
	 <div class="chat-message clearfix">
	  
        <div id="chat2" class="container">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" row="10" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
		</div>
	</div>
	</div></div>
	<jsp:include page="WEB-INF/footer.jsp" />
	</div>
</body>
</html>