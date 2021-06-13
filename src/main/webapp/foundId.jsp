<%@page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<title>아이디 찾기</title>
</head>
<body>

<jsp:include page="WEB-INF/header.jsp" />
	<center>
		<h3>아이디는 ${id} 입니다. </h3>
		<a href="login.jsp">로그인</a>
		<a href="index.jsp">홈으로</a>
		<a href="createUser.jsp">회원가입</a>
	</center>
</body>
</html>