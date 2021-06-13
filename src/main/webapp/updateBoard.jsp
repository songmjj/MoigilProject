<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body{
	margin-top: 10%;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 상세</title>
</head>
<body>
<div class="container">
	<center>
		<hr>
		<form class="form-inline" action="insertBoard.do" method="post">
			<input type="hidden" name="boardNo" value="${board.boardNo}">
			<input type="hidden" name="userCode" value="${board.userCode}">
			<input type="hidden" name="grade" value="${board.grade}">
			<input type="hidden" name="boardDate" value="${board.boardDate}">
			<input type="hidden" name="boardHits" value="${board.boardHits}">
			<input type="hidden" name="boardRatingLike" value="${board.boardRatingLike}">  
				<p align="left"><b> 게시글 번호 :</b> ${board.boardNo} </p>
				<br>
			<div class="form-group">
					<label for="exampleInputName2">제목 </label>
					<input type="text" name="boardTitle" value="${board.boardTitle}" class="form-control" style="width: 500px">
			</div>
			<br>
			<select class="form-select" style="width: 100px" name="areaCode">
						<option value="전체">전체</option>
						<option value="서울">서울</option>
						<option value="경기도">경기도</option>
					</select>
			<br>
			<div class="form-group">
					<label for="exampleInputName2">내용</label>
					<textarea class="form-control" name="boardContents" rows="5" cols="30" 
						style="width: 500px; height: 300px">${board.boardContents}</textarea>
			</div>
			<br>
			<br>
			<input class="btn btn-default" type="submit" value="수정">
			<input class="btn btn-default" type="button" onclick="history.back(-1);" value="취소">
		</form>
	</center>
	</div>
	<hr>
</body>
</html>
	