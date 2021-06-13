<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
    table{margin: auto;}
    </style>
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
rel="stylesheet"
integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
crossorigin="anonymous">
</head>
<body>
	<div class="container">
	<form action="insertReply.do" method="post">
			<input name="boardNo" type="hidden" value="${reply.boardNo}" />
			<input name="userCode" type="hidden" value="${reply.userCode}" />
			<input name="replyDate" type="hidden" value="${reply.replyDate}" />
			<input name="id" type="hidden" value="${reply.id}"/>
			<input name="userReplyNo" type="hidden" value="${reply.userReplyNo}" />
			<table class="table table-bordered" border="1" cellpadding="0" cellspacing="0">
				<tr bgcolor="#dfefff">
					<td>댓글 번호</td>
					<td align="left">${reply.userReplyNo}</td>
				<tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="userReply" cols="40" rows="10">${reply.userReply }</textarea></td>
				</tr>
				<tr bgcolor="#dfefff">
					<td colspan="2" align="center"><input type="submit"
						value="글 수정" /></td>
				</tr>
				
			</table>
		</form>
		</div>
	</body>
	</html>