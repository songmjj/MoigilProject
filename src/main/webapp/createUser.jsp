<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/jquery.form.js"></script>
<script type="text/javascript">
	var imageFolder;

	$(document).ready(function() {

		imageFolder = "userImg";
	});

	
	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("/jusoPopup.jsp", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.userInfo.roadFullAddr.value = roadFullAddr;
		document.userInfo.zipNo.value = zipNo;
	}
	function idchk() {
		var id = document.getElementById("id").value;
		window.open("/idChk.do?id=" + id, "pop",
				"width=400,height=300, scrollbars=no, resizable=no");
	}
	// 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
	// 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
	// 다시 중복체크를 하도록 한다.
	function inputIdChk() {
		document.userInfo.idDuplication.value = "uncheck";
	}

	function checkValue() {
		var form = document.userInfo;
		if (!form.id.value) {
			alert("아이디을 입력해주세요");
			return false;
		}
		if (form.idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		if (!form.pw.value) {
			alert("비번을 입력해주세요");
			return false;
		}

	}

	function upload() {
		$("#ajaxform").ajaxSubmit({
			type : "POST",
			dataType : 'text',
			url : $("#ajaxform").attr("action"),
			data : $("#ajaxform").serialize(),
			success : function(data) {
				data2 = data.replace(/"/gi, "");
				var imageUrl = "${context}/userImg/" + data2;
				$("#pic").attr("src", imageUrl);
				$("#userImage").val(data2);
			},
			error : function(xhr, status, error) {
				alert(error);
			}
		});
	}
</script>
<title>회원가입</title>
</head>
<body>
<div id="wrapper">
<jsp:include page="WEB-INF/header.jsp" />

<div id="contentsArea"> 
      		<!-- #contents 시작 -->
      		<!-- 회원가입 시작 -->
      	<section id="contents" class="memberJoin">
        		<!-- 현재위치 시작 -->
        		<p class="location">Home &gt; <strong>회원가입</strong></p> 
        		<!-- //현재위치 종료 -->
        		<h1>회원가입</h1>
        		<p class="formSign"><strong class="require">필수</strong> 는 반드시 입력하여야 하는 항목입니다.</p>
		</section>

		<form action="createUser.do" name="userInfo" id="joinForm"
			method="post" onsubmit="return checkValue()">
			<fieldset>
				<legend>회원가입 정보 입력 폼</legend>
				<p>
					<label for="id">아이디<strong class="require">필수</strong></label>
					<input type="text" style="width: 100px;" name="id" id="id" onkeydown="inputIdChk()" /> 
					<input type="button" onClick="idchk();" value="중복체크" /> 
					<input type="hidden" name="idDuplication" value="uncheck">
				<p>
					<label for="password">비밀번호<strong class="require">필수</strong></label><input
						type="password" style="width: 100px;" name="pw" id="pw" />
				<p>
					<label for="name">이름<strong class="require">필수</strong></label><input
						type="text" style="width: 50px;" name="name" id="name" />
				<p>
					<label for="birth">생일</label><input type="date" name="birth"
						id="birth" />
				<p>
					<label for="email">이메일</label><input type="text"
						style="width: 200px;" name="email" id="email" />
				<p>
					<label for="tel">번호</label><select name="phoneCd" id="phoneCd">
						<option value="010">010</option>
						<option value="011">011</option>
					</select><input type="text" style="width: 100px;" name="phoneNum" />
				<p>
					<label for="postNum">우편번호 </label><input type="text"  style="width:100px;" id="zipNo"  name="postNum" readonly/>
					<input type="button" onClick="goPopup();" value="주소검색"/><br>
				</p>
				<p>
					<label for="address">도로명주소</label><input type="text"  style="width:600px;" id="roadFullAddr"  name="address" readonly/>
				</p>
				
				<p>
					<label for="grade">등급</label><select name="grade" id="grade">
						<option value="USER">USER</option>
						<option value="ADMIN">ADMIN</option>
					</select>
				</p>
				
				<div class="form-group">
					<p>
						<label for="image" class="image"><b>사진</b></label> <img id="pic"
							style="margin-left: 15px;" height="180px" width="150px"
							src="${context}/backgroundImage/defaultpic.png"><br />
					<div class="col-md-6">
						<input type="hidden" id="userImage" name="userImage"
							required="required">
					</div>
				</div>
				<input type="hidden" id="flag" name="flag" value="false"><br>

		</form>

		<form id="ajaxform" method="post" action="upload.do"
			enctype="multipart/form-data">
			<p>
				<label for="tel">프로필</label> 
				<input type="file" style="width: 200px;" id="imageFile" name="imageFile"
					onchange="upload()" /> 
				<input type="hidden" id="imageFolder" name="imageFolder" value="userImg">
			</p>
		</form>
			
					<div class="btnJoinArea">
						<button type="submit" class="btnOk">회원가입</button>
						<button type="button" class="btnCancel">취소</button>
					</div>
			
			</fieldset>


		</section>
		</div>
		<jsp:include page="WEB-INF/footer.jsp" />
		</div>
		
</body>
</html>