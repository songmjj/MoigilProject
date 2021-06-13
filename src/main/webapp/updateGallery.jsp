<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	
	<h2>gallery 파일업로드</h2>
	<form action="galleryUpload.do" name="userInfo" id="joinForm" method="post" >
			<fieldset>
				<legend>갤러리 입력 폼</legend>
				<p>
				<p>
					<label for="galleryNo">글번호</label><input type="text" style="width: 200px;" name="galleryNo" id="galleryNo" value="${gallery.galleryNo}" readonly="readonly"/>
				<p>
				<p>
					<label for="galleryTitle">글제목</label><input type="text" style="width: 200px;" name="galleryTitle" id="galleryTitle" value="${gallery.galleryTitle}"/>
				<p>
				<p>
					<label for="galleryContents">글내용</label><input type="text" style="width: 200px;" name="galleryContents" id="galleryContents" value="${gallery.galleryTitle}"/>
				<p>
				
				<p>
					<label for="filenames">이미지 파일명</label><input style="width: 200px;" name="filenames" id="filenames" value="${gallery.filenames}" />
				<p>
				
				<!-- 갤러리 이미지가 미리보기로 보여지는 곳 -->	
				<div class="form-group">
					<p>
						<label for="filenames" class="filenames"><b>이미지 파일명</b></label> <img id="pic"
																							   style="margin-left: 15px;" height="180px" width="150px"
																							   src="/galleryImg/${gallery.filenames}"><br />
																												
				</div>
				<input type="hidden" id="flag" name="flag" value="false"><br>

		</form>
		
		<!-- upload()함수가 먼저 실행면서 upload.do가 실행되는듯하다.-->
		<!-- form 태그의 id속성값으로 ajaxform을 설정하여 전송할 데이터를 묶어준고 action속성으로 upload.do를 설정하여 사진,프로필 이미지를 저장하게 된다. -->		
		<form id="ajaxform" method="post" action="imageUpload.do"
			enctype="multipart/form-data">
			<p>                                 
				<label for="tel">프로필</label> 
				                  <!-- imageFile => usercontroller로 보내지는 파라미터 값으로 name을 맞춰준다.  -->
				<input type="file" style="width: 200px;" id="imageFile" name="imageFile" onchange="upload()" />  
				<input type="hidden" id="galleryImg" name="galleryImg" value="galleryImg">
			</p>
		</form>
		
		
		<div class="btnJoinArea">
						<button type="submit" class="btnOk">글 등록</button>
		</div>
		<a href="getGalleryList.do"><button type="button" class="btn btn-primary">글목록</button></a>&nbsp;&nbsp;&nbsp; 
		
	

		</fieldset>
</body>
</html>