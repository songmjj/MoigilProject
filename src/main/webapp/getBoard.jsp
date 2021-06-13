<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
 <!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/commons.css">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jQuery.js"></script>
<script src="js/webcafe.js"></script>
<title>글 상세</title>
<style type="text/css">
 .Rating{
 	display: inline;}
 .boardview > td{border:1px solid; width: 50px; font-size:12px; font-color:blue;padding:5px 5px; }
 .boardview > th{border:1px solid; width: 50px; font-size:12px; font-color:blue;padding:5px 5px; }
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
	
	<!-- #wrapper 시작 -->
	<div id="wrapper">
	
		<!-- #header 시작 -->
		<jsp:include page="WEB-INF/header.jsp" />
		<!-- //#header 종료 -->
		
		<!-- #contentsArea 시작 -->
		<div id="contentsArea" class="container"> 
		
		<!--   콘텐츠 컬럼 시작 -->
		
		<section id="contents" class="qnaBoard">
        		<!-- 현재위치 시작 -->
        		<p class="location">모이길 &gt; 함께가요(모임) &gt; <strong>자유 게시판</strong></p> 
        		<!-- //현재위치 종료 -->
        		<h1>전체 게시판</h1>
		
		<center>
			<section id="boardview" class="container">
				<table class="table table-bordered" border="1">
				<tbody>
					<tr>
						<th class="table-primary">제목</th>
						<td colspan="11" align="left">${board.boardTitle }</td>
						
					</tr>
					<tr>
						<th class="table-primary">번호</th>
						<td  align="left">${board.boardNo }</td>
						<th class="table-primary">아이디</th>
						<td  align="left">${user.id }</td>
						<th class="table-primary">지역</th>
						<td align="left">${board.areaCode }</td>
						<th class="table-primary">조회수</th>
						<td  align="left">${board.boardHits }</td>
						<th class="table-primary">등록일</th>
						<td  align="left">${board.boardDate }</td>
						<th class="table-primary">좋아요</th>
						<td align="left">${board.boardRatingLike }</td>
						</tr>
					</tbody>
					<tfoot>
					<tr>
						<th class="table-primary">내용</th>
						<td colspan="11" align="left"><textarea rows="20" cols="95" readonly="readonly">${board.boardContents}</textarea>
						</td>
					</tr>
					</tfoot>
				</table>
				</section>
		
		<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.userCode eq board.userCode)}">
		 <a href="editBoard.do?boardNo=${board.boardNo}"><button class="btn btn-primary">글수정</button></a>&nbsp;&nbsp;&nbsp; 
		</c:if>					
		<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.userCode eq board.userCode)}">
		<a href="deleteBoard.do?boardNo=${board.boardNo }"><button type="button" class="btn btn-primary">글삭제</button></a>&nbsp;&nbsp;&nbsp; 
		</c:if>
		<c:if test="${!empty sessionScope.user.id}">
		<a href="insertBoard.jsp"><button type="button" class="btn btn-primary">글등록</button></a>&nbsp;&nbsp;&nbsp;
		</c:if> 
		<button type="button" class="btn btn-primary" onclick="history.back(-1);">글목록</button>&nbsp;&nbsp;&nbsp; 
		<br><br>
		
		<form class="Rating" id="mark" action="MarkRatingLike.do" method="POST">		
		<input type="text" id="boardNo" name="boardNo" style="display: none" value="${board.boardNo}" />
		<input type="text" id="userCode" name="userCode" style="display: none" value="${user.userCode}" />
		<button type="submit" class="btn btn-success btn-sm" style="font-size:12px">좋아요 <i class="fa fa-thumbs-o-up"></i></button>
		</form>&nbsp;&nbsp;
		
		<form class="Rating" action="MarkRatingHate.do"  method="POST">
		<input type="text" name="boardNo"  style="display: none" value="${board.boardNo}" />
		<input type="text" name="userCode"  style="display: none" value="${user.userCode}" />
		<button type="submit" class="btn btn-danger btn-sm" style="font-size:12px">싫어요 <i class="fa fa-thumbs-o-down"></i></button>
		</form>
	</center>
		<hr>
	<br>
<div class="container">	
<c:if test="${!empty sessionScope.user.id}">
	<form action="insertReply.do" method="post">
		<input type="text" name="userCode" style="display: none"  value="${user.userCode}"/>
		<input type="text" name="id" style="display: none"  value="${user.id}"/>
		<input type="text"  name="boardNo" style="display: none"  value="${board.boardNo}"/>
		<input type="text" class="form-control" name="userReply" placeholder="댓글을 입력해주세요"/>
				<p align="right"><button type="submit" style="margin: 7px;" type="button" class="btn btn-primary btn-sm"> 댓글 등록</button></p>
		</form>
</c:if>
		</div>
	<div class="container">	
		<form action="getReplyList.do" method="post">
		<p align="right">
			<table class="table table-bordered">
					
				<c:forEach items="${ReplyList}" var="reply">
					<input type="text" name="userCode" style="display: none"  value="${reply.userCode}"/>
					<input type="text"  name="boardNo" style="display: none"  value="${reply.boardNo}"/>
					<input type="text" name="userReplyNo" style="display: none"  value="${reply.userReplyNo}"/>
					<input type="text" name="replyDate" style="display: none"  value="${reply.replyDate}"/>
					
					<tr>
					<td style="width: 745px;">
					<p>${reply.id} : ${reply.userReply}</p></td>
					<td>
					<c:if test="${reply.userCode == user.userCode}">
						<button class="btn btn-outline-primary btn-sm" type="button" onclick="location.href='editReply.do?userReplyNo=${reply.userReplyNo}'">수정</button>
						<button class="btn btn-outline-dark btn-sm" type="button" onclick="location.href='deleteReply.do?userReplyNo=${reply.userReplyNo}&boardNo=${reply.boardNo}'">삭제</button>
 					</c:if>
					</td></tr>
					
				</c:forEach>
			</table>
		</form>
	</div>
	</section>
		<!-- 콘텐츠 컬럼 종료 -->
		
		
		
		</div>
		<!-- #footer 시작 -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
		
	</div>
	<!-- //#wrapper 종료 -->
	
	
</body>
</html>



