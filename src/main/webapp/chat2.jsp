<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://fonts.googleapis.com/css?family=Lato:400,700"></script>
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
<link rel="stylesheet" href="css/new2.css">
<script src="js/jQuery.js"></script>
<script src="js/webcafe.js"></script>
<title>채팅방</title>
	
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
		
<div class="container">
  <div class="chatbox">
    <div class="top-bar">
      <div class="avatar"><p>V</p></div>
      <div class="name">Voldemort</div>
      <div class="icons">
        <i class="fas fa-phone"></i>
        <i class="fas fa-video"></i>
      </div>
      <div class="menu">
        <div class="dots"></div>
      </div>
    </div>
    <div class="middle">
      <div class="voldemort">
        <div class="incoming">
          <div class="bubble">Hey, Father's Day is coming up..</div>
          <div class="bubble">What are you getting.. Oh, oops sorry dude.</div>
        </div>
        <div class="outgoing">
          <div class="bubble lower">Nah, it's cool.</div>
          <div class="bubble">Well you should get your Dad a cologne. Here smell it. Oh wait! ...</div>
        </div>
        <div class="typing">
          <div class="bubble">
            <div class="ellipsis one"></div>
            <div class="ellipsis two"></div>
            <div class="ellipsis three"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="bottom-bar">
      <div class="chat">
        <input type="text" placeholder="Type a message..." />
        <button type="submit"><i class="fas fa-paper-plane"></i></button>
      </div>
    </div>
  </div>
  <div class="messages"></div>
  <div class="profile">
    <div class="avatar"><p>H</p></div>
    <div class="name2">Harry<p class="email">Harry@potter.com</p></div>
  </div>
  <ul class="people">
    <li class="person focus">
      <span class="title">Voldemort </span>
      <span class="time">2:50pm</span><br>
      <span class="preview">What are you getting... Oh, oops...</span>
    </li>
     <li class="person">
      <span class="title">Ron</span>
      <span class="time">2:25pm</span><br>
      <span class="preview">Meet me at Hogsmeade and bring...</span>
    </li>
    <li class="person">
      <span class="title">Hermione</span>
      <span class="time">2:12pm</span><br>
      <span class="preview">Have you and Ron done your hom...</span>
    </li>
  </ul>
</div>
</div>

		===============================================================
		
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
	  
        <div id="chat" class="container">
			<table class="inputTable">
				<tr>
					<!-- <th>메시지</th>-->
<!-- 					<th><input id="chatting" row="10" placeholder="보내실 메시지를 입력하세요."></th>-->
					
					<td align="left"><textarea class="form-control" name="boardContents" cols="140" rows="5" placeholder="보내실 메시지를 입력하세요."></textarea></td>
							
					<th><button onclick="send()" id="sendBtn" style="height:140px">보내기</button></th>
				</tr>
			</table>
		</div>
		</div>
	</div>
	</div>
	<jsp:include page="WEB-INF/footer.jsp" />
	</div>
</body>
</html>