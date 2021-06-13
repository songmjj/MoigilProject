<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html >
<head>
<title>이미지 자료실 | 모이길</title>
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
		  <!-- 이미지 갤러리 시작 -->
		  <section id="contents" class="gallery">
			  <!-- 현재위치 시작 -->
			  <p class="location">Home &gt; 자료실 &gt; <strong>이미지 자료실</strong></p> 
			  <!-- //현재위치 종료 -->            
		      <h1>이미지 갤러리</h1> 
		        <ul>
		          <li>
		            <a href="#">
		            	<figure>
		            		<img src="images/pds/img_thumb01.jpg" alt="">
		            		<figcaption>다와 (Tawa Vol2)</figcaption>
		            	</figure>		            	
		            </a>
		            <time class="date" datetime="2013-10-04">2013.10.04</time>
		          </li>
		          <li>
		            <a href="#">
		            	<figure>
		            		<img src="images/pds/img_thumb02.jpg" alt="">
		            		<figcaption>제주 해변에서</figcaption>
		            	</figure>		            	
		            </a>
		            <time class="date" datetime="2013-10-04">2013.10.04</time>
		          </li>
		          <li>
		            <a href="#">
		            	<figure>
		            		<img src="images/pds/img_thumb03.jpg" alt="">
		            		<figcaption>웃어요</figcaption>
		            	</figure>		            	
		            </a>
		            <time class="date" datetime="2013-10-04">2013.10.04</time>
		          </li>
		          <li>
		            <a href="#">
		            	<figure>
		            		<img src="images/pds/img_thumb04.jpg" alt="">
		            		<figcaption>사진의 주인공은?</figcaption>
		            	</figure>		            	
		            </a>
		            <time class="date" datetime="2013-10-04">2013.10.04</time>
		          </li>
		          <li>
		            <a href="#">
		            	<figure>
		            		<img src="images/pds/img_thumb05.jpg" alt="">
		            		<figcaption>개냥이의 잠자는 모습</figcaption>
		            	</figure>		            	
		            </a>
		            <time class="date" datetime="2013-10-04">2013.10.04</time>
		          </li>
		          <li>
		            <a href="#">
		            	<figure>
		            		<img src="images/pds/img_thumb06.jpg" alt="">
		            		<figcaption>초록?, 초록!</figcaption>
		            	</figure>		            	
		            </a>
		            <time class="date" datetime="2013-10-04">2013.10.04</time>
		          </li>
		          <li>
		            <a href="#">
		            	<figure>
		            		<img src="images/pds/img_thumb07.jpg" alt="">
		            		<figcaption>벽에 부딪혔나요?</figcaption>
		            	</figure>		            	
		            </a>
		            <time class="date" datetime="2013-10-04">2013.10.04</time>
		          </li>
		          <li>
		            <a href="#">
		            	<figure>
		            		<img src="images/pds/img_thumb08.jpg" alt="">
		            		<figcaption>안돼! 찍지마~</figcaption>
		            	</figure>		            	
		            </a>
		            <time class="date" datetime="2013-10-04">2013.10.04</time>
		          </li>
		        </ul>
		        
		        <!-- //페이징 부분 -->
		        <p class="paging">
		          <a href="#" class="btnPrev">이전 5개</a>
		          <span class="pageNumber"><a href="#">5</a> <strong>4</strong> <a href="#">3</a> <a href="#">2</a> <a href="#">1</a></span>
		          <a href="#" class="btnNext">다음 5개</a>
		        </p>
		        <!-- //페이징 부분 -->
		        
		    </section>
		    <!-- //이미지 갤러리 종료 -->
		    <!-- //#contents 종료 -->	
	  </div>
	  <!-- #contentsArea 종료 --> 
	 
  		<!-- #footer 시작 -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
	</div>
	<!-- //#wrapper 종료 -->
</body>
</html>
