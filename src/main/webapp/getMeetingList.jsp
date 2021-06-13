<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>


<!DOCTYPE html>
<head>
<title>모이길 | 모임 게시판</title>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
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
		<div id="contentsArea"> 
      		<!-- #contents 시작 -->
      		<!-- 묻고 답하기 시작 -->
      		<section id="contents" class="qnaBoard">
        		<!-- 현재위치 시작 -->
        		<p class="location">모이길 &gt; 함께가요(모임) &gt; <strong>모임 게시판</strong></p> 
        		<!-- //현재위치 종료 -->
        		<h1>전체 게시판</h1>
        		
		        <table class="boardTable">
		          <caption>전체 게시판 게시물</caption>
		          <thead>
		            <tr>
		              <th scope="col" class="bbsNumber">No</th>
		              <th scope="col" class="bbsArea">지역</th>
		              <th scope="col" class="bbsTitle">제목</th>
		              <th scope="col" class="bbsCount">인원수</th>
		              
		            </tr>
		          </thead>
		          <tbody>
		       
		            <c:forEach items="${page.content}" var="meeting">
							<tr>
								<td style="text-align: center;">${meeting.meetingNo}</td>
								<td> ${meeting.areaCode} </td>
								<td align="left" style="text-align: center;"><a
									href="getMeeting.do?meetingNo=${meeting.meetingNo}">
										${meeting.meetingTitle}</a></td>
								<td> ${meeting.count} </td>
							</tr>
						</c:forEach>
		          </tbody>
		          
		          <tfoot>
						<tr>
							<td></td>
							<td></td>
							<td align="center">
							<c:if test="${!empty sessionScope.user.id}">
							<a href="insertMeeting.jsp">새글 등록</a>
							</c:if>
							<!-- 검색 시작 -->
							<td>
								<form action="getMeetingList.do" method="post">
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
							<a href="getMeetingList.do?PageNo=${page.number-1}">[이전]</a>
						</c:if>
						<c:if test="${page.hasNext()}">
							<a href="getMeetingList.do?PageNo=${page.number+1}">[다음]</a>
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
