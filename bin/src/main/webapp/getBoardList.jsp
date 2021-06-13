<%@page contentType="text/html; charset=EUC-KR"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- 
	<meta name="viewport" content="width=device-width,initial-scale=1">
 -->
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/commons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">



<title>글 목록</title>
</head>
<body>
	<center>
		<div class="container">
			<h1 class="index">글 목록</h1>
			<h3 class="index">${user.name}님! 환영합니다.</h3>
			
			<p align="left">
				<button type="button" class="btn btn-outline-warning" onclick="location.href='index2.jsp' ">뒤로</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-info" onclick="location.href='logout.do' ">Log-out</button>
				</p>
				
			
			
			<div class="row">
				<table border="1" cellpadding="0" cellspacing="0" width="700"
					class="table table-hover fw-bold">
					<thead class="table" bgcolor="#dfefff">
						
						<tr>
							<th width="100" style="text-align: center;">번호</th>
							<th width="700" style="text-align: center;">제목</th>
							<th width="150">등급</th>
							<th>등록일</th>
						</tr>
					</thead>

					<tbody class="table">
						<c:forEach items="${page.content}" var="board">
							<tr>
								<td style="text-align: center;">${board.boardNo}</td>
								<td align="left" style="text-align: center;"><a
									href="getBoard.do?boardNo=${board.boardNo}">
										${board.boardTitle}</a></td>
								<td>${board.grade}</td>
								<td>${board.boardDate}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td></td>
							<td align="center"><a href="insertBoard.jsp">새글 등록</a></td>
							<td></td>
							<!-- 검색 시작 -->
							<td>
								<form action="getBoardList.do" method="post">
									<select name="searchCondition">
										<option value="TITLE">제목
										<option value="CONTENT">내용
									</select> <input name="searchKeyword" type="text" /> <input
										type="submit" value="검색" />
								</form>
							</td>
							<!-- 검색 종료 -->
						</tr>
				</table>
			</div>
			<div>
				<nav aria-label="Page navigation example" >
				<ul class="pagination">
	<c:if test="${page.number > 0}">
			<a href="getBoardList.do?PageNo=${page.number-1}">[이전]</a>
		</c:if>
		<c:if test="${page.hasNext()}">
			<a href="getBoardList.do?PageNo=${page.number+1}">[다음]</a>
		</c:if>
				</ul>
				</nav>
			</div>
		</div>
	</center>
</body>
</html>