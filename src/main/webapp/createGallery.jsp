<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/commons.css">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jQuery.js"></script>
<script src="js/webcafe.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="/js/jquery.form.js"></script>
<script type="text/javascript">

function upload() { 
	
	$("#ajaxform").ajaxSubmit({ 
		type : "POST", 
		dataType : 'text',
		url : $("#ajaxform").attr("action"), //전송할 페이지 ==> 여기서 upload.do로 보내는건가?
		data : $("#ajaxform").serialize(), // 데이터의 전송 방식을 쿼리스트링 형식의 데이터로 변환해 반환한다.
		success : function(data) { // 데이터 전송에 성공한 후 실행되는 부분
			data2 = data.replace(/"/gi, ""); 
			// ??? 
			var imageUrl = "${context}/galleryImg/" + data2; // 이미지경로를 절대경로로 설정하여 가져오는 방식
			$("#pic").attr("src", imageUrl); // 미리보기를 설정하는 부분 => id속성값으로 pic인 요소의 src속성에 imageUrl을 대입시킨다. => 회원이 업로드한 사진의 경로로 설정한다	 
			$("#filenames").val(data2); // userImage에 값을 data2로 설정한다.
		},
		error : function(xhr, status, error) {
			alert(error);
		}
	});
}

</script>


<title>file upload</title>
</head>
<body>
	<!-- #wrapper 시작 -->
		<div id="wrapper">
		<!-- #header 시작 -->
			<jsp:include page="WEB-INF/header.jsp" />
		<!-- //#header 종료 -->
		
		<!-- #contentsArea 시작 -->
		<div id="contentsArea" class="container"> 
		  <!-- #contents 시작 -->
		  <!-- 이미지 갤러리 시작 -->
		  <section id="contents">
			  <!-- 현재위치 시작 -->
			  <p class="location">Home &gt; 자료실 &gt; <strong>이미지 자료실</strong></p> 
			  <!-- //현재위치 종료 -->            
		      <h1>이미지 갤러리</h1> 
				<form action="galleryUpload.do" name="userInfo" id="joinForm" method="post" >
					<fieldset>
				<legend>갤러리 입력 폼</legend>
				<p>
					<label for="galleryTitle">글제목</label><input type="text" style="width: 700px;" name="galleryTitle" id="galleryTitle" />
				<p>
				<p>
					<label for="galleryContents">글내용<br><br><br></label><input type="text" style="width: 700px; height:50px" name="galleryContents" id="galleryContents" />
				<p>
					
				<div class="form-group">
					<p>
						<label for="filenames" class="filenames">미리보기       
						<br><br><br><br><br><br><br><br><br><br><br>
						
						</label> <img id="pic"
					    style="margin-left: 15px;" height="180px" width="150px"
						src="${context}/backgroundImage/defaultpic.png"><br />
						<input type="hidden" style="width: 200px;" name="filenames" id="filenames" />
				<!-- 																		
					<div class="col-md-6">
						<input  id="filenames" name="filenames"	required="required">
					</div>
				 -->		
				</div>
				<input type="hidden" id="flag" name="flag" value="false"><br>

		</form>
		
		<!-- upload()함수가 먼저 실행면서 upload.do가 실행되는듯하다.-->
		<!-- form 태그의 id속성값으로 ajaxform을 설정하여 전송할 데이터를 묶어준고 action속성으로 upload.do를 설정하여 사진,프로필 이미지를 저장하게 된다. -->		
		<form id="ajaxform" method="post" action="imageUpload.do"
			enctype="multipart/form-data">
			<p>                                 
				<label for="tel">이미지 파일 업로드</label> <br>
				                  <!-- imageFile => usercontroller로 보내지는 파라미터 값으로 name을 맞춰준다.  -->
				<input type="file" style="width: 200px; height:22px;" id="imageFile" name="imageFile" onchange="upload()" />  
				<input type="hidden" id="galleryImg" name="galleryImg" value="galleryImg">
			</p>
		</form>
		
		
		<div class="btnJoinArea">
						<button type="submit" class="btn btn-primary">글 등록</button>
						<button type="button" class="btn btn-primary">취소</button>
		</div>
	
	

		</fieldset>
		      		</section>
</body>
</html>