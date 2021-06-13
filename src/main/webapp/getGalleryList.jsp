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
<style type="text/css">

p#new{
 text-align:right;
}
 
 a#new{
 text-align:right;
 color:rgb(0 0 0);
 font-weight:bold;
 
 }
 

 
#col1 {
    position: absolute;
    left: 5px;
    padding: 0px;  
}

#col2 {
    position: absolute;
    margin-left: 300px;
    padding: 0px;
}

#col3 {
    margin-left: 600px;
    padding: 0px;
}

</style>

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
		  <!-- 이미지 갤러리 시작 -->
		  <section id="contents">
			  <!-- 현재위치 시작 -->
			  <p class="location">Home &gt; 자료실 &gt; <strong>이미지 자료실</strong></p> 
			  <!-- //현재위치 종료 -->            
		      <h1>이미지 갤러리</h1> 
		      <p id="new"><a id="new" href="createGallery.jsp">새글 등록</a></p>
		      <c:forEach items="${page.content}" var="gallery" varStatus="status" step="1" begin="0">
		        <ul>
		          <li>
		          	<div  id="col${status.index % 3 + 1}">	
		            	<figure class="gallery">
		            		<img id="pic" style="" height="160px" width="100px" src="/galleryImg/${gallery.filenames}" onerror="this.style.display='none'" alt='' />
		            		<p>	
				            <a href="getGallery.do?galleryNo=${gallery.galleryNo}">${gallery.galleryTitle}</a>
		            	</figure>
		            </div>		            	
		          </li>
		        </ul>
		       </c:forEach>
		        
		    <br><br><br>
		    <div>
		
		    </div>    
		    </section>
		    
		    <!-- //이미지 갤러리 종료 -->
		    <!-- //#contents 종료 -->	
	  </div>
	 <div>				
	  </div>
	  <!-- #contentsArea 종료 --> 
  		<!-- #footer 시작 -->
			<jsp:include page="WEB-INF/footer.jsp" />
		<!-- //#footer 종료 -->
	</div>
	<!-- //#wrapper 종료 -->
</body>
</html>
