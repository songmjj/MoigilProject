<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/jquery.form.js"></script>
<script type="text/javascript">
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.userInfo.roadFullAddr.value = roadFullAddr;
		document.userInfo.zipNo.value = zipNo;
}
function idchk(){
	var id = document.getElementById("id").value;
	window.open("/idChk.do?id="+id,"pop","width=400,height=300, scrollbars=no, resizable=no"); 
}
// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
// 다시 중복체크를 하도록 한다.
function inputIdChk(){
	document.userInfo.idDuplication.value ="uncheck";
}


function checkValue(){
	var form = document.userInfo;
	if(!form.id.value){
		alert("아이디을 입력해주세요");
		return false;
	}		
	if(form.idDuplication.value != "idCheck"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	if(!form.pw.value){
		alert("비번을 입력해주세요");
		return false;
	}	
}


function upload(){
	$("#ajaxform").ajaxSubmit({
        type: "POST",
        dataType: 'text',
        url: $("#ajaxform").attr("action"),
        data: $("#ajaxform").serialize(),
        success: function (data) {
        	data2 = data.replace(/"/gi, "");
        	var imageUrl = "/Upload/" + data2;
        	$("#pic").attr("src", imageUrl);
        	$("#userImage").val(data2);
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
    });
}
	
</script>
<title>회원가입</title>
</head>
<body>
	<form id="ajaxform" method="post" action="upload.do" enctype="multipart/form-data">
	<table>
	<tr><td>프로필</td><td><input type="file"  style="width:200px;" name="Image" onchange="upload();" /></td></tr>
	<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src=""><br/>
	</table>
	</form>
<form action="createUser.do" name="userInfo" method="post" onsubmit="return checkValue()">
		<table>
			<tr><td>아이디</td><td><input type="text"  style="width:100px;" name="id"  id="id" onkeydown="inputIdChk()"/>
			<input type="button" onClick="idchk();" value="중복체크"/></td></tr>
			<tr><td><input type="hidden" name="idDuplication" value="uncheck" ></td></tr>
			<tr><td>비밀번호</td><td><input type="password"  style="width:100px;" name="pw" id="pw" /></td></tr>
			<tr><td>이름</td><td><input type="text"  style="width:50px;" name="name" id="name" /></td></tr>
			<tr><td>생일</td><td><input type="date" name="birth" id="birth"/></td></tr>
			<tr><td>이메일</td><td><input type="text"  style="width:200px;" name="email" id="email" /></td></tr>
			<tr><td>번호</td><td><select name="phoneCd" id="phoneCd">
						<option value="010">010</option>
						<option value="011">011</option>					
					</select><input type="text"  style="width:100px;" name="phoneNum" /></td></tr>
						<tr><td>등급</td><td>
						<select name="grade">
						<option value="USER">USER</option>
						<option value="ADMIN">ADMIN</option>					
					</select></td></tr>
			<tr><td>우편번호 </td><td><input type="text"  style="width:100px;" id="zipNo"  name="postNum" readonly/>
			<input type="button" onClick="goPopup();" value="주소검색"/></td></tr>
			<tr><td>도로명주소</td><td><input type="text"  style="width:600px;" id="roadFullAddr"  name="address" readonly/></td></tr>
			<input type="hidden" id="userImage" name="userImage" value="userImg">
			<tr><td><input type="submit" value="가입하기 " /></td></tr>
			</table>
			</form>
</body>
</html>