<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
	<link href="resources/blog/assets/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<style>
	
		#btn2{
			background-color: #40c8b5;
		}
		
		*{
			font-family: 'Noto Sans KR', sans-serif;
			font-size:11pt;
		}
		
		.card-img {
			opacity:0.4;
		}
		
		.map_wrap {
			position:relative;
			width:100%;
			height:300px;
		}
	    
	    .title {
	    	font-weight:bold;
	    	display:block;
	    }
	    
	    .hAddr {
	    	position:absolute;
	    	left:10px;
	    	top:10px;
	    	border-radius: 2px;
	    	background:#fff;
	    	background:rgba(255,255,255,0.8);
	    	z-index:1;
	    	padding:5px;
	    }
	    
	    #centerAddr {
	    	display:block;
	    	margin-top:2px;
	    	font-weight: normal;
	    }
	    
	    .bAddr {
	    	padding:5px;
	    	text-overflow:ellipsis;
	    	overflow: hidden;
	    	white-space: nowrap;
	    }
	</style>

    <script>
    	// 위치 불러오기
	    $(document).ready(function () {
	    	getLocation(); 
	    });
	    
	    var lat=0;
	    var lon=0;
	    
	    function getLocation() {
	        //alert("getLocation");
	        if(navigator.geolocation){
	            navigator.geolocation.getCurrentPosition(showPosition);
	        }
	        else{
	            alert("위치를 얻을 수 없습니다.");
	        }
	    }
	    
	    function showPosition(position) {
	        lat=position.coords.latitude; 
	        lon=position.coords.longitude;
	        nowWeather();
	    }
	    
	    function nowWeather(){
	    	var apiURI ="http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&appid=7180b26319e06fe6b99cd4e4102c299d";
	    	$.ajax({
	          url : apiURI,
	          method : 'GET',
	          success :  function(data) {
	            var temp = String((data.main.temp - 272)).substring(0,4); // 온도
	            var location = data.name; // 지역이름 

	           //  $('#chatLog').append('지역 ：' + location + ' 온도　：' + tempr　+ "도입니다. "+'\n');
	            var imgURL = "http://openweathermap.org/img/w/" + data.weather[0].icon + ".png";
	            // 아이콘 표시
	             $('#weather').attr("src", imgURL);
	         		$("#we").append(location);	
	         		$("#we").append("&nbsp;");
	         		$("#we").append(temp);
	          }
	        });     
	    }
    </script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>

	<div class="container" style="background-color:${bd.cssBack};">
	    <section class="blog_area">
			<div class="row">
	            <div class="col-lg-8 mb-5 mb-lg-10" style='padding-top:10px;'">
	            		<a href="blogMain2.do?userId=${user.mId}"><h1 style="font-family: 'Jua', sans-serif;">				
	            		${bd.blogTitle }</h1></a>
	            </div>
	                <div class="col-lg-8 mb-5 mb-lg-0">
	                    <div class="blog_left_sidebar">
	                    <!-- 목록 가져오기 -->
	                    <c:forEach var="p" items="${post}"> 
	                       <article class="blog_item">
	                            <div class="blog_item_img">
	                                <img class="card-img rounded-0" src="<%= request.getContextPath() %>/resources/buploadFiles/${p.changeName}" style="height:400px; opacity:0.8;">
	                                <a href="#" class="blog_item_date">
	                                    <h3>${p.bEnrollDate }</h3>
	                                    
	                                </a>
	                            </div>
	                <c:url var="detail" value="blogDetail.do">
	                	<c:param name="userId" value="${p.mId }"/>
						<c:param name="uniNo" value="${p.uniNo }"/>
					</c:url>
	                            <div class="blog_details">
	                                <a class="d-inline-block" href="${ detail }">
	                                    <h2>${p.bTitle}</h2>
	                                </a>
	                                <p>${p.bTContent }</p>
	                                <ul class="blog-info-link">
	                                    <li><a href="#"><i class="fa fa-user"></i>${p.cateName}</a></li>
	                                </ul>
	                            </div>
	                        </article>
	                      </c:forEach>
	                 <c:if test="${empty post }">
	                 	작성된 글이 없습니다!
	                 </c:if>
	                        
	 			<!-- 페이징 처리 -->       
	                        <nav class="blog-pagination justify-content-center d-flex">
	                            <ul class="pagination">
	                                <li class="page-item">
		                                <c:if test="${pi.currentPage <= 1 }">
		                                    <a href="#" class="page-link" aria-label="Previous">
		                                        <i class="ti-angle-left"></i>
		                                    </a>
		                                </c:if>
		                                <c:if test="${pi.currentPage >1 }">
											<c:url var="before" value="&userId=${user.mId}&page=${pi.currentPage -1}">
												<c:param name="page" value="${pi.currentPage -1 }"/>
											</c:url>
		                                    <a href="#" class="page-link" aria-label="Previous">
		                                        <i class="ti-angle-left"></i>
		                                    </a>									
		                                </c:if>    
	                                </li>
			                                <!-- 페이지 숫자 : pagination-->	
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<li class="page-item active">
										<a href="#" class="page-link">${p}</a>
									</li>
								</c:if>
								
								<c:if test="${ p ne pi.currentPage }">
									<li class="page-item">
										<a href="blogMain2.do?userId=${user.mId}&page=${p}" class="page-link">${p}</a>
									</li>
								</c:if>
								</c:forEach>
								
								<!-- [다음] : after -->
								<c:if test="${pi.currentPage>= pi.maxPage }">
								<li class="page-item">
			                                    <a href="#" class="page-link" aria-label="Next">
			                                        <i class="ti-angle-right"></i>
			                                    </a>
			                    </li>
			                    </c:if>
			                    <c:if test="${pi.currentPage < pi.maxPage}">
									<c:url var="after" value="veniatis/blogMain2.do&userId=${user.mId}&page=${pi.currentPage +1}">
										<c:param name="page" value="${pi.currentPage +1 }"/>
									</c:url>
								<li class="page-item">
			                                    <a href="#" class="page-link" aria-label="Next">
			                                        <i class="ti-angle-right"></i>
			                                    </a>
			                    </li>  
			                    </c:if>                              
	                            </ul>
	                            <br>
	                        </nav>
	                    </div>
	                </div>
	                <div class="col-lg-4">
	                    <div class="blog_right_sidebar">
	                    
	                    	<aside class="single_sidebar_widget" style="display:;">
								<b>${user.mName }</b>(${user.mId })
								<c:if test="${loginUser.mId ne user.mId }">
								 
									<c:if test=	"${!(subtf )}">
									&nbsp;&nbsp;&nbsp;<b><a href="javascript:subscribe();" style="color:orange !important;" class="blogSub">구독하기</a></b>
									</c:if>
									
									<c:if test=	"${(subtf )}">
									&nbsp;&nbsp;&nbsp;<b><a href="javascript:deleteSub();" style="color:orange !important;" class="blogSub">구독해제</a></b>
									</c:if>
								</c:if>
								<hr>
								${bd.blogInto }								
							</aside>
	                    
	                        <aside class="single_sidebar_widget search_widget">
	                            <form action="bSearch.do" method="get">
	                                <div class="form-group">
	                                    <div class="input-group mb-3">
	                                        <input type="text" class="form-control" placeholder='검색어를 입력하세요' name="searchValue" >
	                                        <input type="hidden" name="userId" value="${user.mId }">
	                                        <div class="input-group-append">
	                                            <button class="btn" type="button"><i class="ti-search"></i></button>
	                                        </div>
	                                    </div>
	                                </div>
	                                <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn" type="submit">Search</button>
	                            </form>
	                        </aside>
	                        
	                        <c:if test="${loginUser.mId eq user.mId }">
	                        				<c:url var="write" value="write2.do"/>
	                        				<c:url var="admin" value="badmin.do"/>
	                        <button onclick="location.href='${ admin }'" class="button rounded-0 primary-bg text-white w-50 btn_1 boxed-btn" type="submit" style="float:left; background-color:green;"">관리하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                                                <button onclick="location.href='${ write }'" class="button rounded-0 primary-bg text-white w-40 btn_1 boxed-btn" type="submit">글 작성</button>
	                                                <br><br>
	                        </c:if>
	
	                        <aside class="single_sidebar_widget post_category_widget">
	                            <h4 class="widget_title">Category</h4>
	                            <ul class="list cat-list">
	                            
	                                <c:forEach var="c" items="${cate}">
		                                <li>
		                                    <a href="blogMainCate.do?cateNo=${c.cateNo}&mId=${user.mId}">${c.bCateName}</a>
		                                </li>
	                            	</c:forEach>
	                            </ul>
	                        </aside>
	<!-- 태그 -->                    
	                        <aside class="single_sidebar_widget tag_cloud_widget" style="display:${bd.blogTag};">
	                            <h4 class="widget_title">Tag Clouds</h4>
	                            <ul class="list">
	                            	<c:choose>
	                            		<c:when test = "${fn:length(tags)==1 }">
		                            	등록된 태그가 없습니다!
		                           		 </c:when>
		                           		 		
										<c:when test="${fn:length(tags)<15 }">
											<c:forEach var="i" begin="1" end="${fn:length(tags)-1}">
												<li>
												<a href="blogTag.do?tags=${tags[i]}&userId=${user.mId}">#${tags[i]}</a><br>
												</li>
											</c:forEach>
										</c:when>
										<c:when test="${fn:length(tags)>15 }">
											<c:forEach var="i" begin="1" end="10">
												<li>
												<a href="blogTag.do?tags=${tags[i]}&userId=${user.mId}">#${tags[i]}</a><br><br>
												</li>
											</c:forEach>
											&nbsp;&nbsp;&nbsp;더보기
										</c:when>
										<c:otherwise>
											등록된 태그가 없습니다!
										</c:otherwise>
									</c:choose>      
	                            </ul>
	                        </aside>
					<!-- 날씨 -->
							<aside class="single_sidebar_widget" style="display:${bd.cssWeather};">
								<h4 class="widget_title">Weather</h4>
								<div id="we">
									<img id="weather" src="">
								</div>
							</aside>
					<!-- 현재시간 -->
							<aside class="single_sidebar_widget" style="display:${bd.cssTime};">
								<h4 class="widget_title">Time</h4>						
									<div id="clock" class="light" style="margin:0; width:100%; padding:20px;">
										<div class="display" style="padding:0; width:100%;">
											<div class="digits" style="width:100%;"></div>
										</div>
									</div>
							</aside>
					<!-- 위치 -->
							<aside class="single_sidebar_widget" style="display:${bd.cssLocation};">
								<h4 class="widget_title">Location</h4>
								<div class="map_wrap">
								    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
								    <div class="hAddr">
								        <span class="title">지도중심기준 행정동 주소정보</span>
								        <span id="centerAddr"></span>
								    </div>
								</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a5d7fcf1a98faf68aad6298992293d2&libraries=services"></script>
	<script>
	var lat1=0;
	var lon1=0;
	
		getLocation2();
	
		function getLocation2() {
		    //alert("getLocation");
		    if(navigator.geolocation){
		        navigator.geolocation.getCurrentPosition(showPosition2);
		    }
		    else{
		        alert("위치를 얻을 수 없습니다.");
		    }
		}
		
		function showPosition2(position) {
		    lat1=position.coords.latitude; 
		    lon1=position.coords.longitude;
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
		        center: new kakao.maps.LatLng(lat1, lon1), // 지도의 중심좌표
		        level: 1 // 지도의 확대 레벨
		    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
	    infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	
	// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
	searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	
	// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
	            
	            var content = '<div class="bAddr">' +
	                            '<span class="title">법정동 주소정보</span>' + 
	                            detailAddr + 
	                        '</div>';
	
	            // 마커를 클릭한 위치에 표시합니다 
	            marker.setPosition(mouseEvent.latLng);
	            marker.setMap(map);
	
	            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
	            infowindow.setContent(content);
	            infowindow.open(map, marker);
	        }   
	    });
	});
	
	// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', function() {
	    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
	});
	
	function searchAddrFromCoords(coords, callback) {
	    // 좌표로 행정동 주소 정보를 요청합니다
	    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
	}
	
	function searchDetailAddrFromCoords(coords, callback) {
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	}
	var addName="";
	// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
	function displayCenterInfo(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        var infoDiv = document.getElementById('centerAddr');
	
	        for(var i = 0; i < result.length; i++) {
	            // 행정동의 region_type 값은 'H' 이므로
	            if (result[i].region_type === 'H') {
	                infoDiv.innerHTML = result[i].address_name;
	                break;
	            }
	        }
	        addName= result[0].address_name;

	    }  
	    
	}
	
		
	}
		
		
		
	// 구독관련	
	function subscribe(){
		var result= confirm("${user.mName} 님을 구독하시겠습니까?");
		var subId= '${user.mId}';
		if(result){
			$.ajax({
		        url :'blogSubPlus.do',
		        type :'POST',
		        data : {subId : subId},
		        dataType:"text",
		        success : function(data){
					alert("구독 완료되었습니다!");
					$(".blogSub").text("구독해제");
					$(".blogSub").attr("href", "javascript:deleteSub();");

		        },error:function(e){
		              alert("error code : " + e.status + "\n"
		                      + "message : " + e.responseText);
		        }
		    });	
		}
		
		
	}
	
	
	// 구독 취소
	function deleteSub(){
		var result=confirm("${user.mName} 님의 블로그 구독을 취소하시겠습니까?");
		var subId='${user.mId}';
		if(result){
			$.ajax({
		        url :'blogSubDelete.do',
		        type :'POST',
		        data : {subId : subId},
		        dataType:"text",
		        success : function(data){
					alert("구독 취소되었습니다!");
					$(".blogSub").text("구독하기");
					$(".blogSub").attr("href", "javascript:subscribe();");

		        },error:function(e){
		              alert("error code : " + e.status + "\n"
		                      + "message : " + e.responseText);
		        }
		    });				
		}
	}
	</script>
	
	
							</aside>
						</div>
	                </div>
	            </div>
	        </div>
	    </section>
	
	
	 
	    <div class="modal fade custom_search_pop" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
	        aria-hidden="true">
	        <div class="modal-dialog modal-dialog-centered" role="document">
	            <div class="modal-content">
	                <div class="serch_form">
	                    <input type="text" placeholder="Search">
	                    <button type="submit">search</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	    <script src="blog.js" type="882eb23b708c715aa9a4c46d-text/javascript"></script>
	    		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
			<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
		<script src="resources/blog/assets/js/script.js"></script>
</body>
</html>