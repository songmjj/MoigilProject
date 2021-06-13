<%@page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">

<title>로그인</title>
</head>
<body>
	<center>
		<div class="login">
			<h1 id="login">Login</h1>
			  <form action="login.do" method="post">
				<input type="text" name="id" placeholder="id" required="required"  />
				  <input type="password" name="pw" placeholder="pw" required="required"  />
				  <button type="submit" class="btn btn-primary btn-block btn-large" value = "로그인">로그인</button>
			  </form>
		  </div>
	</center>
</body>
</html>