<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>비밀번호 찾기</title>
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
</head>
<body>
	<form action="getPw.do" method="post">
		<legend>비밀번호 찾기</legend>
			<p>
				<label for="name">아이디<strong class="require">필수</strong></label> <input
					type="text" id="id" name="id" required placeholder="아이디를 입력하세요.">
			</p>
			<p>
				<label for="email">이메일<strong class="require">필수</strong></label> <input
					type="text" id="email" name="email" required placeholder="example@gamil.com">
			</p>
			<p>
				<td colspan="2" align="center"><input type="submit" value="비밀번호 찾기 " /></td>
			</p>
	</form>
</body>
</html>