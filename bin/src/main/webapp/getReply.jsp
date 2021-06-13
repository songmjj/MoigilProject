<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
    table{margin: auto;}
    </style>
</head>
<body>
	<form action="insertReply.do" method="post">
			<input name="boardNo" type="hidden" value="${reply.boardNo}" />
			<input name="userCode" type="hidden" value="${reply.userCode}" />
			<input name="replyDate" type="hidden" value="${reply.replyDate}" />
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td bgcolor="orange">댓글 번호</td>
					<td align="left"><input type="text" name="userReplyNo"  value="${reply.userReplyNo}" readonly/>
				<tr>
				<tr>
					<td bgcolor="orange">아이디</td>
					<td align="left"><input type="text" name="id"  value="${reply.id}" readonly/>
				<tr>
				<tr>
					<td bgcolor="orange">내용</td>
					<td align="left"><textarea name="userReply" cols="40" rows="10">
						${reply.userReply }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="글 수정" /></td>
				</tr>
				
			</table>
		</form>
	</body>
	</html>