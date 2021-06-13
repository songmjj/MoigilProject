<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script language="javascript">
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.zipNo.value = zipNo;
		document.form.roadFullAddr.value = roadFullAddr;

		
}

</script>
<title>정보수정</title>
</head>
<body>
<form action="updateUser.do" name="form" id="form" method="post">
		<table>
			<tr><td><input type="hidden" name="userCode" value="${user.userCode}" /></td></tr>
			<tr><td><input type="hidden" name="grade" value="${user.grade}" /></td></tr>
			<tr><td><input type="hidden" name="entDate" value="${user.entDate}" /></td></tr>
			<tr><td>아이디</td><td><input type="text"  style="width:100px;" name="id" value="${user.id}" readonly /></td></tr>
			<tr><td>비밀번호</td><td><input type="password"  style="width:100px;" name="pw" id="pw" value="${user.pw}" /></td></tr>
			<tr><td>이름</td><td><input type="text"  style="width:50px;" name="name" value="${user.name}" /></td></tr>
			<tr><td>생일</td><td><input type="date" name="birth" value="${user.birth}" /></td></tr>
			<tr><td>이메일</td><td><input type="text"  style="width:200px;" name="email" value="${user.email}" /></td></tr>
			<tr><td>번호</td><td><select name="phoneCd">
						<option value="010">010</option>
						<option value="011">011</option>					
					</select>
			<input type="text"  style="width:100px;" name="phoneNum" value="${user.phoneNum}" /></td></tr>
			<tr><td>우편번호 </td><td><input type="text"  style="width:100px;" id="zipNo"  name="postNum" value="${user.postNum}" readonly/><input type="button" onClick="goPopup();" value="주소검색"/></td>
			<tr><td>도로명주소</td><td><input type="text"  style="width:500px;" id="roadFullAddr"  name="address" value="${user.address}" readonly/></td></tr>
			<tr><td>포로필</td><td>
			<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="/Upload/${user.userImage}"><br/>
			<tr><td><input type="submit" value="수정하기 " /></td><td><input type="button" value="회원탈퇴" onClick="location.href='deleteUser.do?userCode=${user.userCode}'"></td></tr>
		</table>

</form>
</body>
</html>