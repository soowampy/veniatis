<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS here -->

    <!-- <link rel="stylesheet" href="css/responsive.css"> -->

    <style>
        .slider_bg_1{
            background-image: url('resources/main/main.png') !important;
        }
        .slider_bg_2{
            background-image: url('resources/main/crowdfunding.jpg') !important;
        }
        .slider_bg_3{
            background-image: url('resources/main/mainblog.png') !important;
        }
        .slider_bg_4{	
            background-image: url('resources/main/test4.jpg') !important;
        }

        #aa{
            font-family: "돋움체" !important;
        }
    </style>

</head>
<body>
<c:if test="${ !empty msg }">
		<script>
			alert('${msg}');
		</script>
		<c:remove var="msg"/>
	</c:if>
<jsp:include page="common/menubar.jsp"></jsp:include>
    <!-- slider_area_start -->
    <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider  d-flex align-items-center slider_bg_1 overlay">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>Veniatis:</h3>
                                <p>기부/후원을 뜻하는 라틴어로 한 사람 한 사람의 후원을 통해 아름다운 세상을 만들자는 의미를 담고있습니다.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider  d-flex align-items-center slider_bg_2 overlay">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3 id="aa">후원하기</h3>
                                <p>기부천사가 됩시다</p>
                                <a href="#" class="boxed-btn3">페이지로 이동</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider  d-flex align-items-center slider_bg_3 overlay">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3 id="aa">블로그</h3>
                                <p>블로거지가 됩시다</p>
                                <a href="#" class="boxed-btn3">페이지로 이동</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="single_slider  d-flex align-items-center slider_bg_4 overlay">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-xl-12 col-md-12">
                                <div class="slider_text text-center">
                                    <h3 id="aa">공모전</h3>
                                    <p>공모전확인합시다</p>
                                    <a href="#" class="boxed-btn3">페이지로 이동</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>

    </div>
    <!-- slider_area_end -->
    <div class="popular_places_area">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <div class="section_title text-center mb_70">
                            <img src="resources/main/nowpro.png">
                            <br>
                            <p>현재 진행 중인 인기 프로젝트들의 목록입니다</p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single_place">
                            <div class="thumb">
                                <img src="resources/main/test.jpg" alt="">
                                <a href="#" class="prise">$500</a>
                            </div>
                            <div class="place_info">
                                <a href="destination_details.html"><h3>California</h3></a>
                                <p>United State of America</p>
                                <div class="rating_days d-flex justify-content-between">
                                    <span class="d-flex justify-content-center align-items-center">
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i>
                                         <a href="#">(20 Review)</a>
                                    </span>
                                    <div class="days">
                                        <i class="fa fa-clock-o"></i>
                                        <a href="#">5 Days</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single_place">
                            <div class="thumb">
                                <img src="resources/main/test.jpg" alt="">
                                <a href="#" class="prise">$500</a>
                            </div>
                            <div class="place_info">
                                <a href="destination_details.html"><h3>Korola Megna</h3></a>
                                <p>United State of America</p>
                                <div class="rating_days d-flex justify-content-between">
                                    <span class="d-flex justify-content-center align-items-center">
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i>
                                         <a href="#">(20 Review)</a>
                                    </span>
                                    <div class="days">
                                        <i class="fa fa-clock-o"></i>
                                        <a href="#">5 Days</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single_place">
                            <div class="thumb">
                                <img src="resources/main/test.jpg" alt="">
                                <a href="#" class="prise">$500</a>
                            </div>
                            <div class="place_info">
                                <a href="destination_details.html"><h3>London</h3></a>
                                <p>United State of America</p>
                                <div class="rating_days d-flex justify-content-between">
                                    <span class="d-flex justify-content-center align-items-center">
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i>
                                         <a href="#">(20 Review)</a>
                                    </span>
                                    <div class="days">
                                        <i class="fa fa-clock-o"></i>
                                        <a href="#">5 Days</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single_place">
                            <div class="thumb">
                                <img src="resources/main/test.jpg" alt="">
                                <a href="#" class="prise">$500</a>
                            </div>
                            <div class="place_info">
                                <a href="destination_details.html"><h3>Miami Beach</h3></a>
                                <p>United State of America</p>
                                <div class="rating_days d-flex justify-content-between">
                                    <span class="d-flex justify-content-center align-items-center">
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i>
                                         <a href="#">(20 Review)</a>
                                    </span>
                                    <div class="days">
                                        <i class="fa fa-clock-o"></i>
                                        <a href="#">5 Days</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single_place">
                            <div class="thumb">
                                <img src="resources/main/test.jpg" alt="">
                                <a href="#" class="prise">$500</a>
                            </div>
                            <div class="place_info">
                                <a href="destination_details.html"><h3>California</h3></a>
                                <p>United State of America</p>
                                <div class="rating_days d-flex justify-content-between">
                                    <span class="d-flex justify-content-center align-items-center">
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i>
                                         <a href="#">(20 Review)</a>
                                    </span>
                                    <div class="days">
                                        <i class="fa fa-clock-o"></i>
                                        <a href="#">5 Days</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single_place">
                            <div class="thumb">
                                <img src="resources/main/test.jpg" alt="">
                                <a href="#" class="prise">$500</a>
                            </div>
                            <div class="place_info">
                                <a href="destination_details.html"><h3>Saintmartine Iceland</h3></a>
                                <p>United State of America</p>
                                <div class="rating_days d-flex justify-content-between">
                                    <span class="d-flex justify-content-center align-items-center">
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i> 
                                         <i class="fa fa-star"></i>
                                         <a href="#">(20 Review)</a>
                                    </span>
                                    <div class="days">
                                        <i class="fa fa-clock-o"></i>
                                        <a href="#">5 Days</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="more_place_btn text-center">
                            <a class="boxed-btn4" href="#">More Places</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>



    <!-- popular_destination_area_start  -->
    <div class="popular_destination_area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="section_title text-center mb_70">
                        <img src="resources/main/poppost.png" alt="">
                        <p>인기게시글입니다</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single_destination">
                        <div class="thumb">
                            <img src="resources/main/test.jpg" alt="">
                        </div>
                        <div class="content">
                            <p class="d-flex align-items-center">Italy <a href="travel_destination.html">  07 Places</a> </p>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_destination">
                        <div class="thumb">
                            <img src="resources/main/test.jpg" alt="">
                        </div>
                        <div class="content">
                            <p class="d-flex align-items-center">Brazil <a href="travel_destination.html">  03 Places</a> </p>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_destination">
                        <div class="thumb">
                            <img src="resources/main/test.jpg" alt="">
                        </div>
                        <div class="content">
                            <p class="d-flex align-items-center">America <a href="travel_destination.html">  10 Places</a> </p>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_destination">
                        <div class="thumb">
                            <img src="resources/main/test.jpg" alt="">
                        </div>
                        <div class="content">
                            <p class="d-flex align-items-center">Nepal <a href="travel_destination.html">  02 Places</a> </p>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_destination">
                        <div class="thumb">
                            <img src="resources/main/test.jpg" alt="">
                        </div>
                        <div class="content">
                            <p class="d-flex align-items-center">Maldives <a href="travel_destination.html">  02 Places</a> </p>
                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_destination">
                        <div class="thumb">
                            <img src="resources/main/test.jpg" alt="">
                        </div>
                        <div class="content">
                            <p class="d-flex align-items-center">Indonesia <a href="travel_destination.html">  05 Places</a> </p>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- popular_destination_area_end  -->

    <div class="recent_trip_area" style="background-color:#f7fafd;">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <div class="section_title text-center mb_70">
                        <img src="resources/main/compet.png" alt="">
                        <p> 공모전 정보를 확인하세요</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="single_trip">
                        <div class="thumb">
                            <img src="resources/main/test.jpg" alt="">
                            <br>
                           
                        </div>
                        <div class="info">
                            <div class="date">
                                <span>Oct 12, 2019</span>
                            </div>
                            <a href="#">
                                <h3>Journeys Are Best Measured In
                                    New Friends</h3>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_trip">
                        <div class="thumb">
                            <img src="resources/main/test.jpg" alt="">
                        </div>
                        <div class="info">
                            <div class="date">
                                <span>Oct 12, 2019</span>
                            </div>
                            <a href="#">
                                <h3>Journeys Are Best Measured In
                                    New Friends</h3>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="single_trip">
                        <div class="thumb">
                            <img src="resources/main/test.jpg" alt="">
                        </div>
                        <div class="info">
                            <div class="date">
                                <span>Oct 12, 2019</span>
                            </div>
                            <a href="#">
                                <h3>Journeys Are Best Measured In
                                    New Friends</h3>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <footer class="footer">
        <div class="footer_top">
            <div class="container">
                <div class="row">
                    <div class="col-xl-4 col-md-6 col-lg-4 ">
                        <div class="footer_widget">
                            <div class="footer_logo">

                            </div>
                            <p>5th flora, 700/D kings road, green <br> lane New York-1782 <br>
                                <a href="#">+10 367 826 2567</a> <br>
                                <a href="#">contact@carpenter.com</a>
                            </p>
                            <div class="socail_links">
                                <ul>
                                    <li>
                                        <a href="#">
                                            <i class="ti-facebook"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="ti-twitter-alt"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-instagram"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-pinterest"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-youtube-play"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                    <div class="col-xl-2 col-md-6 col-lg-2">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Company
                            </h3>
                            <ul class="links">
                                <li><a href="#">Pricing</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#"> Gallery</a></li>
                                <li><a href="#"> Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Popular destination
                            </h3>
                            <ul class="links double_links">
                                <li><a href="#">Indonesia</a></li>
                                <li><a href="#">America</a></li>
                                <li><a href="#">India</a></li>
                                <li><a href="#">Switzerland</a></li>
                                <li><a href="#">Italy</a></li>
                                <li><a href="#">Canada</a></li>
                                <li><a href="#">Franch</a></li>
                                <li><a href="#">England</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6 col-lg-3">
                        <div class="footer_widget">
                            <h3 class="footer_title">
                                Instagram
                            </h3>
                            <div class="instagram_feed">
                                <div class="single_insta">
                                    <a href="#">
                                        <img src="test.jpg" alt="">
                                    </a>
                                </div>
                                <div class="single_insta">
                                    <a href="#">
                                        <img src="test.jpg" alt="">
                                    </a>
                                </div>
                                <div class="single_insta">
                                    <a href="#">
                                        <img src="test.jpg" alt="">
                                    </a>
                                </div>
                                <div class="single_insta">
                                    <a href="#">
                                        <img src="test.jpg" alt=""> 
                                    </a>
                                </div>
                                <div class="single_insta">
                                    <a href="#">
                                        <img src="test.jpg" alt="">
                                    </a>
                                </div>
                                <div class="single_insta">
                                    <a href="#">
                                        <img src="test.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="copy-right_text">
            <div class="container">
                <div class="footer_border"></div>
                <div class="row">
                    <div class="col-xl-12">
                        <p class="copy_right text-center">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>


  <!-- Modal -->
  <div class="modal fade custom_search_pop" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="serch_form">
            <input type="text" placeholder="Search" >
            <button type="submit">search</button>
        </div>
      </div>
    </div>
  </div>
    <!-- link that opens popup -->
<!--     
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>

    <script src=" https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"> </script> -->
    <!-- JS here -->


</body>
</html>