<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ID중복체크</title>
</head>
<script>
function load(){
	document.getElementById("userId").value = opener.document.userInfo.id.value;
	var result = ${result};
	if(result == 0){
		document.getElementById("cancelBtn").style.visibility='visible';
		document.getElementById("useBtn").style.visibility='hidden';
	}else{
		document.getElementById("cancelBtn").style.visibility='hidden';
		document.getElementById("useBtn").style.visibility='visible';
	}
}

function sendCheckValue(){
	// 중복체크 결과인 idCheck 값을 전달한다.
	opener.document.userInfo.idDuplication.value ="idCheck";
	// 회원가입 화면의 ID입력란에 값을 전달
	opener.document.userInfo.id.value = document.getElementById("userId").value;
	
	if (opener != null) {
    	self.close();
	}	
}	
</script>
<body onload="load()">

<input type="text" name="id" id="userId" readonly>
<br>
<h3>${msg}</h3>
<input id="cancelBtn" type="button" value="사용하기" onclick="sendCheckValue()">
<input id="useBtn" type="button" value="취소" onclick="window.close()">
</body>
</html>