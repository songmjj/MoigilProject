<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/jquery.form.js"></script>
<script type="text/javascript">

$(function(){
			
		if($("#pwForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 4) {
				alert("비밀번호는 4자 이상 입력해주세요.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		}));
	})
	
	
function goPopup(){
	
	var pop = window.open("/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		
		document.form.zipNo.value = zipNo;
		document.form.roadFullAddr.value = roadFullAddr;
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
<title>Update User</title>
</head>
<body>
			
<div id="wrapper">
<jsp:include page="WEB-INF/header.jsp" />

<div id="contentsArea"> 
      		<!-- #contents 시작 -->
      		<!-- 회원가입 시작 -->
      	<section id="contents" class="memberJoin">
        		<!-- 현재위치 시작 -->
        		<p class="location">Home &gt; <strong>회원수정</strong></p> 
        		<!-- //현재위치 종료 -->
        		<h1>회원수정</h1>
        		<p class="formSign"><strong class="require">필수</strong> 는 반드시 입력하여야 하는 항목입니다.</p>
	
	<form action="updateUser.do" name="userInfo" id="joinForm" method="post" >
		<fieldset>
			<legend>회원수정 정보 입력 폼</legend>
			<p>
			<label for="id">아이디</label>
			<input type="text"  style="width:100px;" name="id"  id="id" onkeydown="inputIdChk()" value="${ user.id }" readonly="readonly" />
			<p>
			<label for="password">비밀번호<strong class="require">필수</strong></label>
			<input type="password"  style="width:100px;" name="pw" id="pw" value="${ user.pw }"/>
			<p>
			<label for="name">이름<strong class="require">필수</strong></label>
			<input type="text"  style="width:50px;" name="name" id="name" value="${ user.name }"/>
			<p>
			<label for="birth">생일</label>
			<input type="date" name="birth" id="birth" value="${ user.birth }"/>
			<p>
			<label for="email">이메일</label>
			<input type="text"  style="width:200px;" name="email" id="email" value="${ user.email }"/>
			<p>
			<label for="tel">번호</label>
			<input type="text"  style="width:100px;" name="phoneNum" value="${ user.phoneNum }"/>
			<p>
			<label for="address" class="labelAddress">도로명주소</label>
			우편번호 <input type="text"  style="width:100px;" id="zipNo"  name="postNum" value="${ user.postNum }"readonly>
			<button onClick="goPopup()">주소검색</button>
			<br>
			<input type="text" style="width:400px;" id="roadFullAddr"  name="address" value="${ user.address }" readonly/>
					
			<input type="hidden" id="userImage" name="userImage" value="userImg">
			
		</fieldset>
			<!-- 	<input type="submit" value="수정하기 " /> -->
			<center><button type="submit" class ="btn">수정하기</button></center>
				
	</form>
			
		</section>

	</div>
	
		<!-- #footer 시작 -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
		
	</div>
	<!-- //#wrapper 종료 -->
</body>
</html>
