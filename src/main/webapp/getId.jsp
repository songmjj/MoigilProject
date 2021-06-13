<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>���̵� ã��</title>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jquery.js"></script>
<script src="js/webcafe.js"></script>

</head>
<body>
	
<div id="wrapper">
	<jsp:include page="WEB-INF/header.jsp" />

<div id="contentsArea"> 
      		<!-- #contents ���� -->
      		<!-- ȸ������ ���� -->
      	<section id="contents" class="memberJoin">
        		<!-- ������ġ ���� -->
        		<p class="location">Home &gt; <strong>ȸ�����̵�&��й�ȣ ã��</strong></p> 
        		<!-- //������ġ ���� -->
        		<a href="index.jsp">Ȩ����</a>
        		<h1>ȸ�����̵�&��й�ȣ ã��</h1>
				
        		<p class="formSign"><strong class="require">�ʼ�</strong> �� �ݵ�� �Է��Ͽ��� �ϴ� �׸��Դϴ�.</p>
	
	<form action="getId.do" id="joinForm" method="post" >
		<fieldset>
			<legend>ȸ�����̵�&��й�ȣ ã�� ���� �Է� ��</legend>
			<p>
			<label for="name">����<strong class="require">�ʼ�</strong></label> 
			<input type="text" id="name" name="name" required placeholder="ȫ�浿">
			<p>
			<label for="email">�̸���<strong class="require">�ʼ�</strong></label> 
			<input type="text" id="email" name="email" required placeholder="jang@gamil.com">				
			<p>
			<div class="btnJoinArea"> <button type="submit" class="btnOk">���̵�ã��</button></div>
			</fieldset>
		</form>
		<form action="getPw.do" id="joinForm" method="post">
			<legend>��й�ȣ ã��</legend>
			<p>
			<label for="id">���̵�<strong class="require">�ʼ�</strong></label>
			<input type="text" id="id" name="id" required placeholder="ȫ�浿">
			<p>
			<label for="email">�̸���<strong class="require">�ʼ�</strong></label> 
			<input type="text" id="email" name="email" required placeholder="jang@gamil.com">
			<p>
			
				 <div class="btnJoinArea"> <button type="submit" class="btnOk">��й�ȣã��</button></div>
				
		</form>
		
		</section>
	</div>
		<!-- //#contentsArea ���� -->
	
		
		<!-- #footer ���� -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer ���� -->
		
	</div>
	<!-- //#wrapper ���� -->
</body>
</html>