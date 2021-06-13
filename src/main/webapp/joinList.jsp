<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<script type="text/javascript">


</script>
<body>
		<c:if test="${(sessionScope.user) != null}">
		<c:if test="${Meeting.count > 0}">
		<form id="join" action="insertJoin.do" method="POST">
		<input type="text" id="meetingNo" name="meetingNo" style=display:none value="${Meeting.meetingNo}" />
		<input type="text" id="userCode" name="userCode" style=display:none value="${user.userCode}" />
		<input type="text" id="id" name="id" style=display:none value="${user.id}" />
		<input type="submit" value="참가하기">
		</form>
		</c:if>
		</c:if>
		<table>
		<tr>
		<th>참여자</th>
		</tr>
		 <c:forEach items="${Join}" var="join">
		<tr>
			<td style="text-align: center;">아이디 : ${join.id}</td>
			<td>
		<c:if test="${join.userCode == user.userCode}">
		<form id="join" action="deleteJoin.do" method="POST">
		<input type="text" id="meetingNo" name="meetingNo" style=display:none value="${Meeting.meetingNo}" />
		<input type="text" id="no" name="no" style=display:none value="${join.no}" />
		<input type="submit" value="취소">
		</form>
 		</c:if>
 		</td>
		</tr>
		</c:forEach>
		</table>
		
		

		
</body>
</html>