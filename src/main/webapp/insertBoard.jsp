<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>새글등록</title>
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jquery.js"></script>
<script src="js/webcafe.js"></script>
</head>
<body>
<div id="wrapper">
		<!-- #header 시작 -->
			<jsp:include page="WEB-INF/header.jsp" />
		<!-- //#header 종료 -->
		
		<div id="contentsArea" class="container"> 
		<section id="contents" class="qnaBoard">
		
		<form action="insertBoard.do" method="post">
		<input type="text" name="userCode" style="display: none" value="${user.userCode}"/>
			<table class="table table-hover" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="table-primary" width="70">제목</td>
					<td align="left"><input class="form-control" type="text" size="120" name="boardTitle" /></td>
				</tr>
				<tr>
					<td class="table-primary" bgcolor="orange">지역</td>
					<td align="left">
					<select class="form-select" style="width: 100px" name="areaCode">
						<option value="전체">전체</option>
						<option value="서울">서울</option>
						<option value="경기도">경기도</option>
					</select></td>
				</tr>
				<tr>
					<td class="table-primary" bgcolor="orange">내용</td>
					<td align="left"><textarea class="form-control" name="boardContents" cols="120" rows="10"></textarea></td>
				</tr>
				<tr>
				<td class="table-primary"></td>
					<td colspan="2" align="center">
					<button type="submit" class ="btn btn-primary">새글등록</button>
					<input class="btn btn-primary" type="button" onclick="history.back(-1);" value="뒤로">	
					</td>
				</tr>
			</table>
		</form>
		<hr>
		
	
	</section>
	</div>
		<!-- #footer 시작 -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
	</div>
	<!-- //#wrapper 종료 -->
</body>
</html>