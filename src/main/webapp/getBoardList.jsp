<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<!DOCTYPE html>
<head>
<title>모이길 | 전체 게시판</title>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jquery.js"></script>
<script src="js/webcafe.js"></script>
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
      		<!-- 묻고 답하기 시작 -->
      		<section id="contents" class="qnaBoard">
        		<!-- 현재위치 시작 -->
        		<p class="location">모이길 &gt; 함께가요(모임) &gt; <strong>전체 게시판</strong></p> 
        		<!-- //현재위치 종료 -->
        		<h1>전체 게시판</h1>
        		
		        <table class="boardTable">
		          <caption>전체 게시판 게시물</caption>
		          <thead>
		            <tr>
		              <th scope="col" class="bbsNumber">No</th>
		              <th scope="col" class="bbsArea">지역</th>
		              <th scope="col" class="bbsTitle">제목</th>
		              <th scope="col" class="bbsDate">등록일</th>
		              <th scope="col" class="bbsHit">조회수</th>
		            </tr>
		          </thead>
		          <tbody>
		       
		            <c:forEach items="${page.content}" var="board">
							<tr>
								<td style="text-align: center;">${board.boardNo}</td>
								<td> ${board.areaCode} </td>
								<td align="left" style="text-align: center;"><a
									href="getBoard.do?boardNo=${board.boardNo}">
										${board.boardTitle}</a></td>
								<td>${board.boardDate}</td>
								<td>${board.boardHits}</td>
							</tr>
						</c:forEach>
		          </tbody>
		          
		          <tfoot>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td align="center">
							<c:if test="${!empty sessionScope.user.id}">
							<a href="insertBoard.jsp">새글 등록</a>
							</c:if>
							</td>
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
					</tfoot>
		        </table>
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
			</section>
		   
		</div>
		<!-- //#contentsArea 종료 -->

		
		<!-- #footer 시작 -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
		
	</div>
	<!-- //#wrapper 종료 -->
</body>
</html>
