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


<title>getGallery</title>
</head>
<body>
	<div class="container">
			<section id="boardview">
				<table class="table table-bordered" border="1">
				<tbody>
					<tr>
						<th class="table-primary">제목</th>
						<td colspan="11" align="left">${gallery.galleryTitle }</td>
						
					</tr>
					<tr>
						<th class="table-primary">번호</th>
						<td  align="left">${gallery.galleryNo }</td>
						
					</tr>
					</tbody>
					<tfoot>
					<tr>
						<th class="table-primary">내용</th>
						<td colspan="11" align="left"><textarea rows="20" cols="130" readonly="readonly">${gallery.galleryContents}</textarea>
						</td>
					</tr>
					</tfoot>
				</table>
				<div>
			<img id="pic" style="margin-left: 15px;" height="180px" width="150px" src="/galleryImg/${gallery.filenames}" onerror="this.style.display='none'" alt='' /><br/>
			</div>
				</section>
		</div>
		
		<a class="btn btn-primary" href="editGallery.do?galleryNo=${gallery.galleryNo}">글수정</a>&nbsp;&nbsp;&nbsp; 
		<a href="deleteGallery.do?galleryNo=${gallery.galleryNo}"><button type="button" class="btn btn-primary">글삭제</button></a>&nbsp;&nbsp;&nbsp; 
		<a href="createGallery.jsp"><button type="button" class="btn btn-primary">글등록</button></a>&nbsp;&nbsp;&nbsp; 
		<a href="getGalleryList.do"><button type="button" class="btn btn-primary">글목록</button></a>&nbsp;&nbsp;&nbsp; 
		<br><br>
		
		</fieldset>
</body>
</html>