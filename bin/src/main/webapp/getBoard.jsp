<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
 <!-- Bootstrap -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
<title>글 상세</title>
<style type="text/css">
 .Rating{
 	display: inline;}
 th,td{border:1px solid; width: 50px; font-size:12px; font-color:blue;padding:5px 5px; }
 h1{font-family: 'Noto Sans KR', sans-serif;}
 p.logout{font-family: 'Noto Sans KR', sans-serif;}
 
.size{
    height:30px;
    width:70px;
}
.reply{
border : 0px solid;}


</style>
</head>

<script type="text/javascript">
function fn_createRating(paramBoardNo){
	location.href = "${context}/work/board/updateBoardRating.do?boardNo=" + paramBoardNo;
}
function like(){
	var param = {};

	param["boardNo"] = paramBoardNo;
	$.ajax({
	    async : true, // true면 비동기방식을 사용하겠다는 의미. 
	    type : 'POST', // post방식으로 보낼 건데,
	    data: param, // memberId라는 데이터를 보낼 것이다.
	    url: "/MarkRatingLike.do", // 컨트롤러의 /idCheck를 탈 것이다.
	    dataType: "json",  // json형식의 데이터를 보낼 것이다.
	    contentType: "application/json", // json형태로 보낼때는 application/json를 붙여줘야한다.
	    success:function(result){
	    	console.log(result)
	    } // 통신이 성공했을때 보여줄 내용, ()에는 데이터를 보낸 곳의 리턴값이 들어온다.
	});
}
</script>

<body>
	<center>
		<div class="container">
		<h1>게시판</h1>
		<p class="logout" align="right">
		<a href="logout.do">Log-out</a></p>
				<table class="table table-bordered" border="1">
				<tbody>
					<tr>
					
						<th bgcolor="#dfefff">번호</th>
						<td colspan="1" align="left">${board.boardNo }</td>
						<th bgcolor="#dfefff">제목</th>
						<td colspan="5" align="left">${board.boardTitle }</td>
					</tr>
					<tr>	
						<th bgcolor="#dfefff">아이디</th>
						<td colspan="1" align="left">${user.id }</td>
						<th bgcolor="#dfefff">등급</th>
						<td colspan="1" align="left">${board.grade }</td>
						<th bgcolor="#dfefff">조회수</th>
						<td colspan="1" align="left">${board.boardHits }</td>
						<th bgcolor="#dfefff">등록일</th>
						<td colspan="1" align="left">${board.boardDate }</td>
						<th bgcolor="#dfefff">좋아요</th>
						<td align="left">${board.boardRatingLike }</td>
						</tr>
					</tbody>
					<tfoot>
					<tr>
						<th bgcolor="#dfefff">내용</th>
						<td colspan="9" align="left">${board.boardContents}</td>
					</tr>
					</tfoot>
				</table>
		</div>
		<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.userCode eq board.userCode)}">
		<a class="btn btn-primary" href="editBoard.do?boardNo=${board.boardNo}">글수정</a>&nbsp;&nbsp;&nbsp; 
		</c:if>					
		<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.userCode eq board.userCode)}">
		<a href="deleteBoard.do?boardNo=${board.boardNo }"><button type="button" class="btn btn-primary">글삭제</button></a>&nbsp;&nbsp;&nbsp; 
		</c:if>
		
		<a href="insertBoard.jsp"><button type="button" class="btn btn-primary">글등록</button></a>&nbsp;&nbsp;&nbsp; 
		<a href="getBoardList.do"><button type="button" class="btn btn-primary">글목록</button></a>&nbsp;&nbsp;&nbsp; 
		<br><br>
		
		<form class="Rating" id="mark" action="MarkRatingLike.do" method="POST">		
		<input type="text" id="boardNo" name="boardNo" style="display: none" value="${board.boardNo}" />
		<input type="text" id="userCode" name="userCode" style="display: none" value="${user.userCode}" />
		<button type="submit" style="font-size:12px">좋어요 <i class="fa fa-thumbs-o-up"></i></button>
		</form>&nbsp;&nbsp;
		
		<form class="Rating" action="MarkRatingHate.do"  method="POST">
		<input type="text" name="boardNo"  style="display: none" value="${board.boardNo}" />
		<input type="text" name="userCode"  style="display: none" value="${user.userCode}" />
		<button type="submit" style="font-size:12px">싫어요 <i class="fa fa-thumbs-o-down"></i></button>
		</form>
	</center>
		<hr>
	<br>
<div class="container">	
	<form action="insertReply.do" method="post">
		<input type="text" name="userCode" style="display: none"  value="${user.userCode}"/>
		<input type="text" name="id" style="display: none"  value="${user.id}"/>
		<input type="text"  name="boardNo" style="display: none"  value="${board.boardNo}"/>
		<input type="text" class="form-control" name="userReply" placeholder="댓글을 입력해주세요"/>
				<p align="right"><button type="submit" type="button" class="btn btn-default"> 댓글 등록</button></p>
		</form>
		</div>
	<div class="container">	
		<form action="getReplyList.do" method="post">
		<p align="right">
			<table class="table table-bordered">
					<tr>
						<th colspan="2" bgcolor="#dfefff" width="100">댓글</th>
						<th bgcolor="#dfefff" width="200">수정/삭제</th>
					</tr>
				<c:forEach items="${ReplyList}" var="reply">
					<input type="text" name="userCode" style="display: none"  value="${reply.userCode}"/>
					<input type="text"  name="boardNo" style="display: none"  value="${reply.boardNo}"/>
					<input type="text" name="userReplyNo" style="display: none"  value="${reply.userReplyNo}"/>
					<input type="text" name="replyDate" style="display: none"  value="${reply.replyDate}"/>
					<tr>
					<td colspan="2">
					<p><b>아이디 : ${reply.id}</b><br>
					내용 : ${reply.userReply}</p>
					<td align="center">
					<c:if test="${reply.userCode == user.userCode}">
						<button class="size" type="button" onclick="location.href='editReply.do?userReplyNo=${reply.userReplyNo}'">수정</button><br>
						<button class="size" type="button" onclick="location.href='deleteReply.do?userReplyNo=${reply.userReplyNo}&boardNo=${reply.boardNo}'">삭제</button>
 						</c:if>
					</td>
					</tr>
					</c:forEach>
			</table>
			</form>
			</div>
</body>
</html>
