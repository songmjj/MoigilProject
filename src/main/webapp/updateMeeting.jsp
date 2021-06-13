<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>모임 글수정</title>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<link rel="shortcut icon" href="images/common/webcafe.ico">
<link rel="apple-touch-icon" href="images/common/webcafe.png">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/sub.css">
<script src="js/jquery.js"></script>
<script src="js/webcafe.js"></script>
</head>
<body>
<div id="wrapper">
<jsp:include page="WEB-INF/header.jsp" />
		<div id="contentsArea"> 
		<section id="contents" class="qnaBoard">

<table class="table table-hover" border="0" cellpadding="0" cellspacing="0">
				<tr>
				<td class="table-primary">지도</td>
				<td>
				<div class="map_wrap">
            <div id="menu_wrap" class="bg_white">
                <div class="option">
                    <div>
                        <form onsubmit="searchPlaces(); return false;">
                            키워드 : <input type="text" value="서울" id="keyword" size="15">
                            <button type="submit">검색하기</button>
                        </form>
                            <input type="button" value="시작지점" onclick="startpoint()">
                             <input type="button" value="도착지점" onclick="endpoint()">
                    </div>
                </div>
                <hr>
                <ul id="placesList"></ul>
                <div id="pagination"></div>
            </div>
        </div>
<div id="map" style="width:800px;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=682946d5861fe4cad908d7d05104e4bc&libraries=services"></script>
</td>
</tr>
		<form action="insertMeeting.do" method="post" name="form" id="form">
		<input type="text" name="meetingNo" style="display: none" value="${Meeting.meetingNo}"/>
		<input type="text" name="userCode" style="display: none" value="${Meeting.userCode}"/>
		<input type="text" name="id" style="display: none" value="${Meeting.id}"/>
		<input type="hidden" id="startpointX" name="startpointX" value="${Meeting.startpointX}">
		<input type="hidden" id="startpointY" name="startpointY" value="${Meeting.startpointY}">
		<input type="hidden" id="endpointX" name="endpointX" value="${Meeting.endpointX}">
		<input type="hidden" id="endpointY" name="endpointY" value="${Meeting.endpointY}">
		<input type="hidden" id="mapX" name="mapX" value="${Meeting.mapX}">
		<input type="hidden" id="mapY" name="mapY" value="${Meeting.mapY}">
						
				<tr>
					<td class="table-primary" width="70">제목</td>
					<td align="left"><input class="form-control" type="text" size="120" name="meetingTitle" value="${Meeting.meetingTitle}" /></td>
				</tr>
				<tr>
					<td class="table-primary">지역</td>
					<td align="left">
					<select class="form-select" style="width: 100px" name="areaCode">
						<option value="서울">서울</option>
						<option value="경기도">경기도</option>
					</select></td>
				</tr>
				<tr>
					<td class="table-primary">인원수</td>
					<td align="left">
					<select class="form-select" style="width: 100px" name="count">
						<option value="4">4명</option>
						<option value="5">5명</option>	
						<option value="6">6명</option>
						<option value="7">7명</option>
						<option value="8">8명</option>
						<option value="9">9명</option>
					</select></td>
				</tr>
				<tr>
					<td class="table-primary" bgcolor="orange">내용</td>
					<td align="left"><textarea class="form-control" name="meetingContents" cols="120" rows="10">${Meeting.meetingContents}</textarea></td>
				</tr>
				<tr>
				<td></td>
					<td colspan="2" align="center">
					<button type="submit" class ="btn btn-primary">수정하기</button>
					<input class="btn btn-primary" type="button" onclick="history.back(-1);" value="뒤로">	
					</td>
				</tr>
			</table>
		</form>
</div>
</body>
<script>
var ps = new kakao.maps.services.Places(); 

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
draggable: true, // 출발 마커가 드래그 가능하도록 설정합니다
image: startImage // 출발 마커이미지를 설정합니다
});

//출발 마커에 dragstart 이벤트를 등록합니다
kakao.maps.event.addListener(startMarker, 'dragstart', function() {
	
// 출발 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
startMarker.setImage(startDragImage);
});

//출발 마커에 dragend 이벤트를 등록합니다
kakao.maps.event.addListener(startMarker, 'dragend', function() {
 // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
startMarker.setImage(startImage);
document.getElementById('startpointX').value = startMarker.getPosition().Ma;
document.getElementById('startpointY').value = startMarker.getPosition().La;
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
	draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
	image: arriveImage // 도착 마커이미지를 설정합니다
	});
	
//도착 마커에 dragstart 이벤트를 등록합니다
kakao.maps.event.addListener(arriveMarker, 'dragstart', function() {
// 도착 마커의 드래그가 시작될 때 마커 이미지를 변경합니다
arriveMarker.setImage(arriveDragImage);
});

//도착 마커에 dragend 이벤트를 등록합니다
kakao.maps.event.addListener(arriveMarker, 'dragend', function() {
 // 도착 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
arriveMarker.setImage(arriveImage);
document.getElementById('endpointX').value = arriveMarker.getPosition().Ma;
document.getElementById('endpointY').value = arriveMarker.getPosition().La;
});

kakao.maps.event.addListener(map, 'center_changed', function() {
    // 지도의  레벨을 얻어옵니다
    var level = map.getLevel();
    // 지도의 중심좌표를 얻어옵니다 
    var latlng = map.getCenter(); 
    pos = latlng;
    document.getElementById('mapX').value = pos.Ma;
    document.getElementById('mapY').value = pos.La;
});

function endpoint() {
	arriveMarker.setPosition(pos);
}
function startpoint() {
	startMarker.setPosition(pos);
}
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB);
}
// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();
        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}     
</script>

</html>
