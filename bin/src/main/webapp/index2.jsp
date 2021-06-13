<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/commons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<title>Main Page</title>
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<script src="js/jQuery.js"></script>
<script src="js/webcafe.js"></script>
</head>
<body>
	<!-- �ǳʶٱ� ��ũ ���� -->
	<a id="skipNav" href="#contentsArea">���� �ٷΰ���</a>
	<!-- //�ǳʶٱ� ��ũ ���� -->
	<!-- #wrapper ���� -->
	<div id="wrapper">
		<!-- #header ���� -->
		<header id="header">
			<!-- ��ī�� �ΰ� ���� -->
			<h1 class="logo">
				<a href="index.html" id="moigil" >���̱�</a>
			</h1>
			<!-- //��ī�� �ΰ� ���� -->
			<!-- ��ī�� �ȳ� ��ũ ���� -->
			<ul class="infoLink">
				<li><a href="#">����������</a></li>
				<li><a href="#">ȸ������ ����</a></li>
				<li><a href="logout.do">�α׾ƿ�</a></li>
			</ul>
			<!-- //��ī�� �ȳ� ��ũ ���� -->
			<!-- ���� �޴� ���� -->
			<nav>
				<h1 class="hidden">���� �޴�</h1>
				<ul class="mainMenu">
					<li><a href="#">��������</a>
					</li>
					<li><a href="#">�Բ�����(����)</a>
						<ul class="aboutCss">
							<li><a href="#">������</a></li>
							<li><a href="#">���ɺ�</a></li>
							<li><a href="#">�ݷ������� �Բ�</a></li>
						</ul></li>
					<li><a href="#">������</a>
						<ul class="webStandard">
							<li><a href="#">�ֽż�</a></li>
							<li><a href="#">������</a></li>
						</ul></li>
					<li><a href="getBoardList.do">�����Խ���</a>
						<ul class="webAccessibility">
							<li><a href="#">������</a></li>
							<li><a href="#">���ɺ�</a></li>
							<li><a href="#">�ݷ������� �Բ�</a></li>
							<li><a href="#">�� ���ټ� ǰ����ũ</a></li>
						</ul></li>
					<li><a href="#">��������</a>
					</li>
					
				</ul>
			</nav>
			<!-- //���� �޴� ���� -->
		</header>
		<!-- //#header ���� -->
		<!-- #visual ���� -->
		<div id="visual">
			<p>
				Web Standard &amp; Accessibility				
			</p>
		</div>
		<!-- //#visual ���� -->
		<!-- #contentsArea ���� -->
		<div id="contentsArea"> 
		<!-- �α��� �� ���, ���� ���� ������ �÷� ���� -->
		<div id="usefulArea">
			<!-- �α��� ���� -->
			<section class="login">
				<h1>�α���</h1>
				<c:if test="${empty sessionScope.user.id}">
					<form action="login.do" method="post">
						<fieldset>
							<legend>ȸ�� �α��� ��</legend>
							<p>
								<label for="userId">���̵�</label> <input type="text" name="id" required placeholder="���̵�">
							</p>
							<p>
								<label for="userPw">��й�ȣ</label> <input type="password" name="pw" required placeholder="4���̻� 8������">
							</p>
							<p>
								<button type="submit">�α���</button>
							</p>
						</fieldset>
					</form>
				</c:if>
				<c:if test="${!empty sessionScope.user.id}">
					<h1>[${user.id}]�� ȯ���մϴ�!</h1>
				</c:if>
				<div class="memberLink">
					<a href="createUser.jsp" class="join">ȸ������</a>
					<a href="getPw.jsp" class="find">���̵�/��й�ȣ ã��</a>
					
				</div>
			</section>
			<!-- //�α��� ���� -->
		</div>
		<!-- //�α��� �� ���, ���� ���� ������ �÷� ���� -->
		<!-- #slogan ���� -->
		<section id="slogan">
			���ΰ� ����
		</section>
		<!-- //#slogan ���� -->
		<!-- #footer ���� -->
		<footer id="footer" role="contentinfo">
			<!-- #footerInner ���� -->
			<div id="footerInner">
				Ǫ�� ����
			</div>
			<!-- //#footerInner ���� -->
		</footer>
		<!-- //#footer ���� -->
		
		
	</div>
	<!-- //#wrapper ���� -->
</body>
</html>