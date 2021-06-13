<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 
	이 파일은 JSP만들때 기본 틀로 쓰기 위함
 -->
<title>Main Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/commons.css">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<!-- 
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/sub.css">
	css 상황에 맞게 넣어야함
 -->
<script src="js/jQuery.js"></script>
<script src="js/webcafe.js"></script>
</head>

<body>
	<!-- #wrapper 시작 -->
	<div id="wrapper"><!-- 이걸해줘야 페이전 전체에 회색 배경이 생김 -->
	
		<!-- #header 시작 -->
		<jsp:include page="WEB-INF/header.jsp" />
		<!-- //#header 종료 -->
		<!-- #visual 시작 -->
		<!-- //#visual 종료 -->
		
		<!-- #contentsArea 시작 -->
		<div id="contentsArea" class="container"> <!-- 이걸 해줘야 페이지 중앙에 콘텐츠 공간이 생겨서 홈페이지 처럼됨 -->
		
		<!--   콘텐츠 컬럼 시작 -->
		
		
		
		<!-- 콘텐츠 컬럼 종료 -->
		
		
		
		</div>
		<!-- #footer 시작 -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
		
	</div>
	<!-- //#wrapper 종료 -->
</body>
</html>