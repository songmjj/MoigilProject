<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 건너뛰기 링크 시작 -->
	<header id="navs">
			<!-- 웹카페 로고 시작 -->
			<h1 class="logo">
				<a href="index.jsp"  id="moigil"><!-- 모이길--><img src='../css/images/moigilCI.png'></a>
			</h1>
		
			<ul class="infoLink">
			<c:if test="${!empty sessionScope.user.id}">
				<li><a href="myPage.jsp" style="font-weight: bold; color:#fff; font-size: 12px;">마이페이지</a></li>
				<li><a href="updateUser.jsp" style="font-weight: bold; color:#fff; font-size: 12px;">회원정보 수정</a></li>
				<li><a href="logout.do" style="font-weight: bold; color:#fff; font-size: 12px;">로그아웃</a></li>
			</c:if>
			</ul>
			
			<!-- //웹카페 안내 링크 종료 -->
			<!-- 메인 메뉴 시작 -->
			<nav >
				<h1 class="hidden">메인 메뉴</h1>
				<ul class="mainMenu">
					<li><a href="#">공지사항</a>
					</li>
					<li><a href="#">함께가요(모임)</a>
						<ul class="aboutCss">
							<li><a href="getBoardList.do">전체게시판</a></li>
							<li><a href="getBoardListArea.do?areaCode=서울">지역별</a></li>
							<li><a href="#">반려동물과 함께</a></li>
							<li><a href="getMeetingList.do">당일모임</a></li>
							<li><a href="room.jsp">채팅방</a></li>
						</ul></li>
					<li><a href="getGalleryList.do">갤러리</a>
						<ul class="webStandard">
							<li><a href="createGallery.jsp">새글등록</a></li>
						</ul></li>
					<li><a href="#">공동구매</a>
						<ul class="commonbuy">
							
						</ul>
					</li>
					
				</ul>
			</nav>
			<!-- //메인 메뉴 종료 -->
		</header>
		<!-- //#header 종료 -->
		<!-- #visual 시작 -->
		<div id="visual">
			
		</div>
		
</body>
</html>