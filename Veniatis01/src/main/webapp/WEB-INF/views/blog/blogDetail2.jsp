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
	<style>
	
	#btn2 {
		background-color: #40c8b5;
	}
	
	* {
		font-family: 'Noto Sans KR', sans-serif;

	}
	
	#taginner {
		margin-top:2%;
		margin-bottom:2%;
    }
    
    #tag {
		display: inline;
		margin:1%;
		padding-right: 12px;
		padding-left:12px;
		padding-top:5px;
		padding-bottom:5px;
		border: 1px rgba(179, 179, 179, 0.753) solid;
	}
       
       #tag:hover{
           background-color: rgba(42, 202, 154, 0.753);
       }


       .bContent img{
	width:100%;

       }
         .heading {
            border-bottom: 3px solid #ddd;
        }

        .twitter-hover {
            background-image: url('https://lut.im/SRoUJUn7V4/cORSlFIVBlR7M8Zv.png');
        }

        .facebook-hover {
            background-image: url('https://lut.im/9LlTfOBMjB/ccPwdiudyoF3x1wE.png');
        }

        .google-hover {
            background-image: url('resources/buploadFiles/kakao.png');
        }

        .linkedin-hover {
            background-image: url('resources/buploadFiles/naver.png');
        }

        .instagram-hover {
            background-image: url('https://lut.im/0LARg4VaCM/bWRJ8RbjK0r14RdO.png');
        }


        .social-slide {
            height: 48px;
            width: 48px;
            margin: 5px;
            float: left;
            -webkit-transition: all ease 0.3s;
            -moz-transition: all ease 0.3s;
            -o-transition: all ease 0.3s;
            -ms-transition: all ease 0.3s;
            transition: all ease 0.3s;
        }

        .social-slide:hover {
            background-position: 0px -48px;
            box-shadow: 0px 0px 4px 1px rgba(0, 0, 0, 0.8);
        }      
	
	    .map_wrap {position:relative;width:100%;height:300px;}
    .title {font-weight:bold;display:block;}
    .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}       
    
    
    
    
     .comments-area .comment-list {
    	padding-bottom: 30px !important;
    	padding:1%;
	}	
	
	.single-comment{
		padding:1% !important;
	}

	 .comment-form{
	 	margin-top:0px !important;
	 }
	#myReply{
		background-color:rgba(240, 248, 255, 0.404);
	}
	</style>

    <link href="resources/blog/assets/css/style.css" rel="stylesheet" />
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script>
    $(document).ready(function () {
    	getLocation(); 
    });
    var city="Seoul";
    var lat=0;
    var lon=0;
    
    
    function getLocation() {
        //alert("getLocation");
        if(navigator.geolocation){
            navigator.geolocation.getCurrentPosition(showPosition);
        }
        else{
            alert("????????? ?????? ??? ????????????.");
        }
    }
    
    function showPosition(position) {
        lat=position.coords.latitude; 
        lon=position.coords.longitude;
        nowWeather();
    }
    
    

    function nowWeather(){
    	var apiURI ="http://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&appid=7180b26319e06fe6b99cd4e4102c299d"
    		    console.log("apiURI:"+apiURI);   	
  		
    	$.ajax({
          url : apiURI,
          method : 'GET',
          success :  function(data) {
            var temp = String((data.main.temp - 272)).substring(0,4); // ??????
            var location = data.name; // ???????????? 
			console.log("??????:"+temp);
// ????????? ?????? 
            var imgURL = "http://openweathermap.org/img/w/" + data.weather[0].icon + ".png";
            // ????????? ??????
             $('#weather').attr("src", imgURL);
         		$("#we").append(location);	
         		$("#we").append("&nbsp;");
         		$("#we").append(temp);	
         		
          }
        });     
    }
    </script>
<script>
<!-- ????????? ???????????? ???????????? -->
$(document).ready(function () {
    var mNo1 = ${nowUser.mNo};
    var bNo1 = ${likeDetail.bNo};
    
    getHeartList();
    getHeartColor();
    replyList();
    
	function getHeartList(){
    $.ajax({
        url :'myHeart.do',
        type :'POST',
        data : {mNo : mNo1,
        		bNo : bNo1},
        dataType:"text",
        success : function(data){

        	check=data;
        	$('.likeInfo').text("????????? "+data);

        },               error:function(e){
              alert("error code : " + e.status + "\n"
                      + "message : " + e.responseText);
             }
    });	
	}

	function getHeartColor(){
	    $.ajax({
	        url :'getHeartColor.do',
	        type :'POST',
	        data : {mNo : mNo1,
	        		bNo : bNo1},
	        dataType:"text",
	        success : function(data){
	        	check=data;
             if(check>0) {
	                $("#heart").prop("src", "resources/common/yesLike.png");
	            }
	            else {
	                $("#heart").prop("src", "resources/common/noLike.png");
	            } 

	        },               error:function(e){
	              alert("error code : " + e.status + "\n"
	                      + "message : " + e.responseText);
	             }
	    });	
		}
   	
    
    $(".heart").on("click", function () {
        var that = $(".heart");
        var mNo = ${nowUser.mNo};
        var bNo = ${likeDetail.bNo};
        
        var sendData={'bNo' : '${likeDetail.bNo}', 
        				'mNo' : ' ${likeDetail.mNo}',
        				'heart' : that.prop('name'),
        				'no' : '${user.mNo}'};

		if(check==0){
			 $.ajax({
		            url :'heartInsert.do',
		            type :'POST',
		            data : sendData,
		            dataType:"text",
		            success : function(data){

		                that.prop('name',data);
		                $('#heart').prop("src","resources/common/yesLike.png");
		                getHeartList();
		                getHeartColor();
		            },               error:function(e){
		                  alert("error code : " + e.status + "\n"
		                          + "message : " + e.responseText);
		                 }
		        });

	}else{
		$.ajax({
        	
            url :'heartdelete.do',
            type :'POST',
            data : sendData,
            dataType:"text",
            success : function(data){
                that.prop('name',data);
                $('#heart').prop("src","resources/common/noLike.png");
                getHeartList();
                getHeartColor();
            }
        });

	}
        });
    
});
    
//??????????????????
function replyList(){
	var bId = ${post.bNo};
	var num=0;
	$.ajax({
		url:"rList.do",
		data:{bId:bId},
		dataType:"json",
		async: false,
		success:function(data){

			$tableBody = $(".comments-area");
			$tableBody.html("");
			
			if(data.length>0){
			// ???????????? ?????? ???
			num=data.length;
			var $r0 = $("<h5>").text(num+"?????? ??????");
			$tableBody.append($r0);
			$tableBody.append("<br>");
				for(var i in data){
					var $r1 = $("<div class='comment-list' id='rNo"+data[i].rNo+"'>");
					if('${user.mId}'==data[i].mId){
						var $r2 = $("<div class='single-comment justify-content-between d-flex' style='background-color: rgba(240, 248, 255);'> ");
					}else{
						var $r2 = $("<div class='single-comment justify-content-between d-flex'>");
					}
					
					var $r3 = $("<div class='user justify-content-between d-flex'>");
					var $r4 = $("<div class='thumb'>");
					var $r5 = $("<img width=50px height=70px>").attr("src",""+data[i].filePath+"");
					var $r6 = $("<div class='desc'>");
					var $r7 = $("<p class='comment' id='con"+data[i].rNo+"'>").text(data[i].rContent); //????????????
					var $r8 = $("<div class='d-flex justify-content-between'>");
					var $r9 = $("<div class='d-flex align-items-center'>");
					var $r10 = $("<h5>");
					var $r11 = $("<a href='blogMain2.do?userId="+data[i].mId+"'>").text(data[i].rWriter);
					var $r12 = $("<p class='date'>").text(data[i].wDate);
					var $r13 = $("<div class='reply-btn'>");
					var $r14 = $(" <a href='#' class='btn-reply text-uppercase'>reply");
					var $r15="";
					var $r16="";
					var $r17 ="";
					var $r18 ="";
					// ??????,??????
					if('${nowUser.mNo}'==data[i].mNo){
						console.log("dd"+data[i].rContent);
						 $r15 =  $("<a href = 'javascript:rUpdate("+data[i].rNo+");' class='rUpdate' id='"+data[i].rNo+"' style='color:black;'>").text("??????");
						 $r16 =  $("<a href = 'javascript:rDelete("+data[i].rNo+");' class='rDelete' id='"+data[i].rNo+"' style='color:red;'>").text("??????");
						 
						 $r17 = $("<span style='display:none;' class='replyNo'>").text(data[i].rNo);
						 $r18 = $("<span style='display:none;' class='replyContent'>").text(data[i].rContent);

					}
					var $r19=$("<a href = 'javascript:rReReply("+data[i].rNo+");' class='rReReply' id='"+data[i].rNo+"' style='color:black;'>").text("??????");

					$tableBody.append($r1);
					$r1.append($r2);
					$r2.append($r3);
					$r3.append($r4);
					$r4.append($r5);
					$r3.append($r6);
					$r6.append($r7);
					$r6.append($r8);
					$r8.append($r9);
					$r9.append($r10);
					$r10.append($r11);
					$r9.append($r12);
					$r9.append($r15);
					$r9.append($r16);
					$r9.append($r17);
					$r9.append($r18);
					$r9.append($r19);
					$r8.append($r13);
					$r13.append($r14);			
					
					
					//?????? ???????????? ajax
					$.ajax({
						
						url : "blogReReply.do",
						dataType : "json",
						async: false,
						data : {rNo:data[i].rNo},
						success: function(data2){
							for(var k in data2){
								var $rr1 = $("<div class='comment-list'>");
								if('${user.mId}'==data2[k].mId){
									var $rr2 = $("<div class='single-comment justify-content-between d-flex' style='margin-left: 5%; background-color: rgba(240, 248, 255);'> ");
								}else{
									var $rr2 = $("<div class='single-comment justify-content-between d-flex' style='margin-left: 5%;'>");
								}
								var $rr3 = $("<div class='user justify-content-between d-flex'>");
								var $rr4 = $("<div class='thumb'>");
								var $rr5 = $("<img width=50px height=70px>").attr("src",""+data2[k].filePath+"");
								var $rr6 = $("<div class='desc'>");
								var $rr7 = $("<p class='comment'>").text(data2[k].content); //????????????
								var $rr8 = $("<div class='d-flex justify-content-between'>");
								var $rr9 = $("<div class='d-flex align-items-center'>");
								var $rr10 = $("<h5>");
								var $rr11 = $("<a href='blogMain2.do?userId="+data2[k].mId+"'>").text(data2[k].rWriter);
								var $rr12 = $("<p class='date'>").text(data2[k].wDate);
								var $rr13 = $("<div class='reply-btn'>");
								var $rr14 = $(" <a href='#' class='btn-reply text-uppercase'>reply");
								var $rr15="";
								var $rr16="";
								var $rr17 ="";
								var $rr18 ="";
								// ??????,??????
								if('${nowUser.mNo}'==data2[k].mNo){
									 $rr15 =  $("<a href = 'javascript:rUpdate("+data2[k].rNo+");' class='rUpdate' id='"+data2[k].rNo+"' style='color:black;'>").text("??????");
									 $rr16 =  $("<a href = 'javascript:rDelete("+data2[k].rNo+");' class='rDelete' id='"+data2[k].rNo+"' style='color:red;'>").text("??????");
									 $rr17 = $("<span style='display:none;' class='replyNo'>").text(data2[k].rNo);
									 $rr18 = $("<span style='display:none;' class='replyContent'>").text(data2[k].rContent);
								}
									
								$tableBody.append($rr1);
								$rr1.append($rr2);
								$rr2.append($rr3);
								$rr3.append($rr4);
								$rr4.append($rr5);
								$rr3.append($rr6);
								$rr6.append($rr7);
								$rr6.append($rr8);
								$rr8.append($rr9);
								$rr9.append($rr10);
								$rr10.append($rr11);
								$rr9.append($rr12);
								$rr9.append($rr15);
								$rr9.append($rr16);
								$rr9.append($rr17);
								$rr9.append($rr18);
								$rr8.append($rr13);
								$r13.append($r14);					
							}
						},
						error : function(){
							console.log('ajax ?????? ??????');
						}
					});	
					
					
				} // ????????? ???
			}else{
				// ????????? ???????????? ????????? ???
				var $r0 = $("<h5>").text("????????? ????????? ????????????");
				$tableBody.append($r0);
			};
		},
		 error:function(e){
             alert("error code : " + e.status + "\n"
                     + "message : " + e.responseText);
            }
	});

}





</script>





<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
    function shareKakaotalk() {
        Kakao.init("9a5d7fcf1a98faf68aad6298992293d2");      // ????????? ?????? JavaScript ?????? ??????
        Kakao.Link.sendDefault({
        	
              objectType:"feed"
            , content : {
                  title:"${post.bTitle }"   // ???????????? ?????????
                , description:"${post.bTContent }"   // ????????? ????????????
                , imageUrl:""   // ????????? ?????????
                ,         link: {
                    mobileWebUrl: 'http://localhost:8800/veniatis/blogDetail.do?userId=${post.mId}&uniNo=${post.uniNo}',
                    webUrl: 'http://localhost:8800/veniatis/blogDetail.do?userId=${post.mId}&uniNo=${post.uniNo}'
                  }
            }
            , social : {
                  likeCount:0       // LIKE ??????
                , commentCount:0    // ?????? ??????
                , sharedCount:0     // ?????? ??????
            }
            , buttons : [
                {
                      title:"????????? ??????"    // ?????? ??????
                    , link : {
                        mobileWebUrl:'http://localhost:8800/veniatis/blogDetail.do?userId=${post.mId}&uniNo=${post.uniNo}'   // ????????? ?????????????????? ???????????? ??? ?????? URL
                      , webUrl:'http://localhost:8800/veniatis/blogDetail.do?userId=${post.mId}&uniNo=${post.uniNo}' // PC?????? ?????????????????? ???????????? ??? ?????? URL
                    }
                }
            ]
        });
    }
</script>
</head>
<body>

<jsp:include page="../common/menubar.jsp"></jsp:include>
        <div class="container" style="background-color:${bd.cssBack}; ">
            <div class="row" >
                        <div class="col-lg-8 mb-5 mb-lg-10" style='padding-top:10px;'">
            		<a href="blogMain2.do?userId=${user.mId}"><h1 style="font-family: 'Jua', sans-serif;">				
            		${bd.blogTitle }</h1></a>
            </div>

                <div class="col-lg-8 posts-list">
                    <div class="single-post">
                        <div class="feature-img">
                            <img class="img-fluid" src="test.png" alt="">
                        </div>
                        <div class="blog_details">
                            <h2>${post.bTitle }
                            </h2>
                            <ul class="blog-info-link mt-3 mb-4">
                                <li><a href="#"><i class="fa fa-user"></i>${post.cateName}</a></li>
							 </ul>
                            <div class="bContent">
                            <p class="excert">
								${post.bContent }
                            </p>
                            </div>
                        </div>
                    </div><br>
                    <div class="navigation-top">
                        <div class="d-sm-flex justify-content-between text-center" style="font-size:11pt;">
                            
                            <p class="like-info"><span class="align-middle">
                                   <a class="btn btn-outline-green heart">
           <img id="heart" src=""> <b style="color:black" class="likeInfo"></b>
       </a></span></p>
       
       
                           
                            <div class="col-sm-4 text-center my-2 my-sm-0">

                            </div>
                            <c:if test="${nowUser.mId ne user.mId }">
                                 <li><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#zz">?????????</button></li>
                            </c:if>
                                <li>
    <a href="https://twitter.com/intent/tweet?text=VENIATIS?????? ???????????????! '${post.bTitle}' &url=http%3a%2f%2flocalhost%3a8800%2fveniatis%2fblogDetail.do%3fuserId%3d${post.mId }%26uniNo%3d${post.uniNo}">
        <div class="twitter-hover social-slide"></div>
    </a>
    <a href="javascript:shareKakaotalk();">
        <div class="google-hover social-slide"></div>
    </a>                                                      
                                </li>
                                <li><a href="#">??? ??????</i></a></li>
                                <c:if test="${loginUser.mId eq user.mId }">
                                <li><a href="blogUpdateForm.do?uniNo=${post.uniNo}">??????</i></a></li>
                                <li><a href="blogDelete.do?uniNo=${post.uniNo }">??????</i></a></li>
                                </c:if>
<!-- ?????? -->
<div class="modal fade seminor-login-modal" id="zz">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal body -->
            <div class="modal-body seminor-login-modal-body">
                <button type="button" class="close" data-dismiss="modal">
                    <span><i class="fa fa-times-circle" aria-hidden="true"></i></span>
                </button>
                <div class="form-area">
                    <br style="clear:both">
                    <h3 style="margin-bottom: 25px; text-align: center;">????????? ??????</h3>
                    <div class="form-group">
                        <b>????????????</b>  <form action="blogScrap.do" method="post">
					<input name = "bNo" type="hidden" value="${post.bNo }">
                        <select name="scrapCate">
                        <c:forEach var="mc" items="${myCate}"> 
                            <option value="${mc.cateNo }">${mc.bCateName }</option>
                        </c:forEach>
                        </select><br><br>
                        <b>?????? ??????</b><br>
                        <textarea name="memo" value=" "></textarea>
                        <br><br>
                        <button>?????????!</button>
                  </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- ??????????????? -->   
                                                   

                       
                            
                        </div>
                        <div id="taginner">
                        
                           	<c:forEach var="dt" items="${detailTagList}"> 
                           	  <div id="tag">#${dt }</div>
                            </c:forEach>
                        
                        </div><br>
                    </div>
                    <div class="comments-area">

                        ????????? ????????? ????????????!
    <script>

    </script>
    
    

                    </div>
                    <div class="comment-form">
                        <h4>?????? ??????</h4>
                        <form class="form-contact comment_form" action="#" id="commentForm">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea class="form-control w-100" name="comment" id="comment" cols="20" rows="5"
                                            placeholder="??????????????????"></textarea>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="form-group">
                                <button type="button" id="rSubmit" class="button button-contactForm btn_1 boxed-btn">????????????</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="blog_right_sidebar">
                    
                        <aside class="single_sidebar_widget" style="display:;">
							<b>${user.mName }</b>(${user.mId })
							<hr>
							${bd.blogInto }
						</aside>
                    
                    
                    
                        <aside class="single_sidebar_widget search_widget">
                            <form action="#">
                                <div class="form-group">
                                    <div class="input-group mb-3">
                                        <input type="text" class="form-control" placeholder='Search Keyword' onfocus="if (!window.__cfRLUnblockHandlers) return false; this.placeholder = ''"
                                            onblur="if (!window.__cfRLUnblockHandlers) return false; this.placeholder = 'Search Keyword'"
                                            data-cf-modified-f49dafb4f642cfc7f83a787a-="">
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
                        <button onclick="location.href='${ admin }'" class="button rounded-0 primary-bg text-white w-50 btn_1 boxed-btn" type="submit" style="float:left; background-color:green;"">????????????</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button onclick="location.href='${ write }'" class="button rounded-0 primary-bg text-white w-40 btn_1 boxed-btn" type="submit">??? ??????</button>
                                                <br><br>
                        </c:if>
                        <aside class="single_sidebar_widget post_category_widget">
                            <h4 class="widget_title">????????????</h4>
                            <ul class="list cat-list">
								 <c:forEach var="c" items="${nowCate}">
	                                <li>
	                                    <a href="blogMainCate.do?cateNo=${c.cateNo}&mId=${user.mId}">${c.bCateName}</a>
	                                </li>
                            	</c:forEach>
                              
                            </ul>
                        </aside>
                        
<!-- ?????? -->                    
                        <aside class="single_sidebar_widget tag_cloud_widget" style="display:${bd.blogTag};">
                            <h4 class="widget_title">Tag Clouds</h4>
                            <ul class="list">
                                 <c:choose>
                            		<c:when test = "${fn:length(tags)==1 }">
	                            	????????? ????????? ????????????!
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
											<a href="blogTag.do?tags=${tags[i]}&userId=${user.mId}">#${tags[i]}</a><br>
											</li>
										</c:forEach>
										&nbsp;&nbsp;&nbsp;?????????
									</c:when>
									<c:otherwise>
										????????? ????????? ????????????!
									</c:otherwise>
								</c:choose>
                            
                            
                            
                            
	                            <!-- ????????? 10??? ????????? ??? : ?????? ??????-->
	                            <%-- <c:if test = "${fn:length(tags)<15 }">
										<c:forEach var="i" begin="0" end="${fn:length(tags)-1}">
											<li>
											<a href="#">#${tags[i]}</a><br>
											</li>
										</c:forEach>
								</c:if>
								<!-- ????????? 10??? ????????? ???  :10???????????? ??????, ????????? ?????? ??????-->
	                            <c:if test = "${fn:length(tags)>15 }">
										<c:forEach var="i" begin="0" end="10">
											<li>
											<a href="#">#${tags[i]}</a><br>
											</li>
	
										</c:forEach>
										&nbsp;&nbsp;&nbsp;?????????
								</c:if>							
								
								<c:if test = "${fn:length(tags)==0 }">
	                            	????????? ????????? ????????????!
	                            </c:if>       --%>                    
                            </ul>
                        </aside>
<!--  --> 
				<!-- ?????? -->
						<aside class="single_sidebar_widget" style="display:${bd.cssWeather};">
							<h4 class="widget_title">Weather</h4>
							<div id="we">
								<img id="weather" src="">
								
							</div>
						</aside>
				<!-- ???????????? -->
						<aside class="single_sidebar_widget" style="display:${bd.cssTime};">
							<h4 class="widget_title">Time</h4>						
								<div id="clock" class="light" style="margin:0; width:100%; padding:20px;">
									<div class="display" style="padding:0; width:100%;">
										<div class="digits" style="width:100%;"></div>
									</div>
								</div>
						</aside>
				<!-- ?????? -->
						<aside class="single_sidebar_widget" style="display:${bd.cssLocation};">
							<h4 class="widget_title">Location</h4>
							<div class="map_wrap">
							    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
							    <div class="hAddr">
							        <span class="title">?????????????????? ????????? ????????????</span>
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
	        alert("????????? ?????? ??? ????????????.");
	    }
	}
	
	function showPosition2(position) {
	    lat1=position.coords.latitude; 
	    lon1=position.coords.longitude;
	console.log("d"+lat1);
	console.log("dd"+lon1);
		var mapContainer = document.getElementById('map'), // ????????? ????????? div 
		mapOption = {
	        center: new kakao.maps.LatLng(lat1, lon1), // ????????? ????????????
	        level: 1 // ????????? ?????? ??????
	    };  

// ????????? ???????????????    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// ??????-?????? ?????? ????????? ???????????????
var geocoder = new kakao.maps.services.Geocoder();

var marker = new kakao.maps.Marker(), // ????????? ????????? ????????? ???????????????
    infowindow = new kakao.maps.InfoWindow({zindex:1}); // ????????? ????????? ?????? ????????? ????????? ????????????????????????

// ?????? ?????? ??????????????? ????????? ???????????? ?????? ?????? ????????? ???????????????
searchAddrFromCoords(map.getCenter(), displayCenterInfo);

// ????????? ???????????? ??? ?????? ?????? ????????? ?????? ??????????????? ??????????????? ???????????? ???????????????
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var detailAddr = !!result[0].road_address ? '<div>??????????????? : ' + result[0].road_address.address_name + '</div>' : '';
            detailAddr += '<div>?????? ?????? : ' + result[0].address.address_name + '</div>';
            
            var content = '<div class="bAddr">' +
                            '<span class="title">????????? ????????????</span>' + 
                            detailAddr + 
                        '</div>';

            // ????????? ????????? ????????? ??????????????? 
            marker.setPosition(mouseEvent.latLng);
            marker.setMap(map);

            // ?????????????????? ????????? ????????? ?????? ????????? ?????? ??????????????? ???????????????
            infowindow.setContent(content);
            infowindow.open(map, marker);
        }   
    });
});

// ?????? ????????? ?????? ????????? ???????????? ??? ?????? ?????? ????????? ?????? ?????? ????????? ??????????????? ???????????? ???????????????
kakao.maps.event.addListener(map, 'idle', function() {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
});

function searchAddrFromCoords(coords, callback) {
    // ????????? ????????? ?????? ????????? ???????????????
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // ????????? ????????? ?????? ?????? ????????? ???????????????
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}
var addName="";
// ?????? ??????????????? ?????? ??????????????? ?????? ??????????????? ???????????? ???????????????
function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
        var infoDiv = document.getElementById('centerAddr');

        for(var i = 0; i < result.length; i++) {
            // ???????????? region_type ?????? 'H' ?????????
            if (result[i].region_type === 'H') {
                infoDiv.innerHTML = result[i].address_name;
                break;
            }
        }
        addName= result[0].address_name;
        console.log(addName);
    }  
    
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
<script>
	//????????????
	$("#rSubmit").click(function(){
		var bNo = ${post.bNo};
		var rContent = $("#comment").val();
		var mId = "${post.mId}";
		
		$.ajax({
			url : "replyInsert.do",
			type : "post",
			dataType : "text",
			data : {rContent:rContent,
					bNo:bNo,
					mId:mId},
			success: function(data){
	
				$("#comment").val("");
				replyList();
			},
			error : function(){
	             alert("error code : " + e.status + "\n"
	                     + "message : " + e.responseText);
			}
		});	
	});
	
	function rDelete(a){
		var rNo= a;
		$.ajax({
			url : "blogReplyDelete.do",
			type : "post",
			dataType : "text",
			data : {rNo:rNo},
			success: function(data){
				alert("????????? ?????????????????????");
				replyList();
			},
			error : function(){
				console.log('ajax ?????? ??????');
			}
		});	
		
		
	}
	
	function rUpdate(no){
		var con= $("#con"+no).text();
		$("#con"+no).empty(); 
		$("#con"+no).append("<textarea id='rUpdateCon'>");
		$("#rUpdateCon").append(con);
		$("#con"+no).append("<a href='javascript:rUpdateSubmit("+no+")'>????????????");
		$("#con"+no).append("<button>????????????");		
		
	}
	
	
	function rUpdateSubmit(rNo){
		var rContent=$("#rUpdateCon").val();
		$.ajax({
			url : "replyUpdate.do",
			type : "post",
			dataType : "text",
			data : {rContent:rContent,
					rNo:rNo,},
			success: function(data){
				replyList();
			},
			error : function(){
	             alert("error code : " + e.status + "\n"
	                     + "message : " + e.responseText);
			}
		});	
	}
	
	//????????????
	function rReReply(a){
		$("#rNo"+a).append("<textarea id='rrply'>?????? ??????</textarea>");
		$("#rNo"+a).append("<button id='rSubmit2'>??????</button>")
		
		$("#rSubmit2").click(function(){		
			var rNo = a;
			var content = $("#rrply").val();

			$.ajax({
				url : "rreplyInsert.do",
				type : "post",
				dataType : "text",
				data : {content:content,
						rNo:rNo,},
				success: function(data){
		
					$("#rrply").remove();
					$("#rSubmit2").remove();
					replyList();
				},
				error : function(){
		             alert("error code : " + e.status + "\n"
		                     + "message : " + e.responseText);
				}
			});	
			
		});

	}

</script>
    		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>
	<script src="resources/blog/assets/js/script.js"></script>

<br><br><br><br><br><br><br><br><br><br><br>
</body>

</html>
