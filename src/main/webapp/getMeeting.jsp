<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
 <!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/commons.css">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jQuery.js"></script>
<script src="js/webcafe.js"></script>
<title>모임 상세</title>
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
<body>
<!-- #wrapper 시작 -->
	<div id="wrapper">
	
		<!-- #header 시작 -->
		<jsp:include page="WEB-INF/header.jsp" />
		<!-- //#header 종료 -->
		<!-- #visual 시작 -->
		<!-- //#visual 종료 -->
		<!-- #contentsArea 시작 -->
		<div id="contentsArea"> 
		
		<!--   콘텐츠 컬럼 시작 -->
		
		<section id="contents" class="qnaBoard">
        		<!-- 현재위치 시작 -->
        		<p class="location">모이길 &gt; 함께가요(모임) &gt; <strong>당일모임</strong></p> 
        		<!-- //현재위치 종료 -->
        		<h1>모임 게시판</h1>
		
		<center>
				<div class="container">
			<section id="boardview">
				<table class="table table-bordered" border="1">
				<tbody>
				<div id="map" style="width:850px;height:350px;"></div>
						<tr>
						<th  class="table-primary">글번호</th>
						<td >${Meeting.meetingNo }</td>
						<th class="table-primary">지역</th>
						<td>${Meeting.areaCode}</td>
						<th class="table-primary">인원수</th>
						<td >${Meeting.count} 명</td>
						<th class="table-primary">글쓴이</th>
						<td  align="left">${Meeting.id}</td>
						</tr>
					<tr>
						<th class="table-primary">제목</th>
						<td colspan="8" align="left">${Meeting.meetingTitle}</td>
					</tr>
					</tbody>
					<tfoot>
					<tr>
						<th class="table-primary">내용</th>
						<td colspan="2" align="left"><textarea rows="20" cols="50" readonly="readonly">${Meeting.meetingContents}</textarea>
						</td>
						<th class="table-primary">참여자</th>
						<td colspan="6" align="left"><c:import url="/getJoinList.do">
						</c:import></td>
					</tr>
					</tfoot>
				</table>
				</section>
			<input type="hidden" id="mapX" name="mapX" value="${Meeting.mapX}">
			<input type="hidden" id="mapY" name="mapY" value="${Meeting.mapY}">
			<input type="hidden" id="startpointX" name="startpointX" value="${Meeting.startpointX}">
			<input type="hidden" id="startpointY" name="startpointY" value="${Meeting.startpointY}">
			<input type="hidden" id="endpointX" name="endpointX" value="${Meeting.endpointX}">
			<input type="hidden" id="endpointY" name="endpointY" value="${Meeting.endpointY}">
			
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=682946d5861fe4cad908d7d05104e4bc&libraries=services"></script>


		<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.userCode eq Meeting.userCode)}">
		 <a href="editMeeting.do?meetingNo=${Meeting.meetingNo}"><button class="btn btn-primary">글수정</button></a>&nbsp;&nbsp;&nbsp; 
		</c:if>	
				<input class="btn btn-primary" type="button" onclick="location.href='getMeetingList.do'" value="목록으로">					
		<c:if test="${(sessionScope.user.grade eq 'ADMIN') || (sessionScope.user.userCode eq Meeting.userCode)}">
		<a href="deleteMeeting.do?meetingNo=${Meeting.meetingNo }"><button type="button" class="btn btn-primary">글삭제</button></a>&nbsp;&nbsp;&nbsp; 
		</c:if>

</div>
</body>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(document.getElementById('mapX').value, document.getElementById('mapY').value), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  


// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
var pos =  map.getCenter();
kakao.maps.event.addListener(map, 'center_changed', function() {
    // 지도의  레벨을 얻어옵니다
    var level = map.getLevel();
    // 지도의 중심좌표를 얻어옵니다 
    var latlng = map.getCenter(); 
    pos = latlng;
});


// 장소 검색 객체를 생성합니다

// 키워드로 장소를 검색합니다

var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
startSize = new kakao.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
startOption = { 
    offset: new kakao.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
};

//출발 마커 이미지를 생성합니다
var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);

var startDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_drag.png', // 출발 마커의 드래그 이미지 주소입니다    
startDragSize = new kakao.maps.Size(50, 64), // 출발 마커의 드래그 이미지 크기입니다 
startDragOption = { 
    offset: new kakao.maps.Point(15, 54) // 출발 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
};

//출발 마커의 드래그 이미지를 생성합니다
var startDragImage = new kakao.maps.MarkerImage(startDragSrc, startDragSize, startDragOption);

//출발 마커가 표시될 위치입니다 
var startPosition = new kakao.maps.LatLng(document.getElementById('startpointX').value, document.getElementById('startpointY').value);    
//출발 마커를 생성합니다
var startMarker = new kakao.maps.Marker({
map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
position: startPosition,
draggable: false, // 출발 마커가 드래그 가능하도록 설정합니다
image: startImage // 출발 마커이미지를 설정합니다
});


var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
arriveOption = { 
offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
};

//도착 마커 이미지를 생성합니다
var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);

var arriveDragSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_drag.png', // 도착 마커의 드래그 이미지 주소입니다    
arriveDragSize = new kakao.maps.Size(50, 64), // 도착 마커의 드래그 이미지 크기입니다 
arriveDragOption = { 
    offset: new kakao.maps.Point(15, 54) // 도착 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
};

//도착 마커의 드래그 이미지를 생성합니다
var arriveDragImage = new kakao.maps.MarkerImage(arriveDragSrc, arriveDragSize, arriveDragOption);

//도착 마커가 표시될 위치입니다 
var arrivePosition = new kakao.maps.LatLng(document.getElementById('endpointX').value, document.getElementById('endpointY').value);    

//도착 마커를 생성합니다 

var arriveMarker = new kakao.maps.Marker({  
	map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
	position: arrivePosition,
	draggable: false, // 도착 마커가 드래그 가능하도록 설정합니다
	image: arriveImage // 도착 마커이미지를 설정합니다
	});
</script>
</html>
