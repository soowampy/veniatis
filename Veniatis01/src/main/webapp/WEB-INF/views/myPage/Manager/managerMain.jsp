<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/guidecss.css">
  <style>
    .mid {
        width:100%;
        height:100%;
      }

      .Vtoday, .log, .project{
        width: 85%;
        height: 200px;
        margin-bottom:5%;
      }

      .log {
        border:1px solid black;
        height:300px;
      }

      .money {
        width: 85%;
        height:250px;
        margin-bottom:5%;
      }

      

      .mon {
        float: left;
        box-sizing: border-box;
        width:20%;
        height:250px;
      }

      .mon div {
        border:1px solid black;
        height:33.3%;
        font-size:20px;
        line-height: 40px;
      }


      .Vtoday {
        background:mediumaquamarine;
      }

      .project {
        background:tomato;
        color:black;
      }

      .Tvisitor {
        width:33%;
        height:100%;
        float: left;
        box-sizing: border-box;
      }

      .Tproject {
        width:34%;
        height:100%;
        float: left;
        box-sizing: border-box;
      }

      .TQnA {
        width:33%;
        height:100%;
        float: left;
        box-sizing: border-box;
      }

      .Vtoday img, .project img {
        margin-top: 5%;
        width:50%;
        height:50%;
      }

      .Vtoday h3, .project h3{
        margin-top:5%;
        width:70%;
        height:42%;
      }

      .mTitle {
        text-align: left;
        margin-left:7%;
      }

      
  </style>
   <script type="text/javascript" src="https://www.google.com/jsapi"></script>
  <script type="text/javascript">
    google.load('visualization', '1', { packages: ['corechart'] });     
  </script>
  <script type="text/javascript">
    function drawVisualization() {
      // Some raw data (not necessarily accurate)
      var data = google.visualization.arrayToDataTable([
        ['Week', '????????? ', '????????? '],
        ['1', 20, 30],
        ['2', 25, 30],
        ['3', 45, 40],
        ['4', 42, 60],
        ['5', 45, 70],
        ['6', 67, 70],
        ['7', 55, 60],
        ['8', 20, 30],
        ['9', 25, 30],
        ['10', 45, 40],
        ['11', 42, 60],
        ['12', 45, 70],
        ['13', 67, 70],
        ['14', 55, 60],
        ['15', 20, 30],
        ['16', 25, 30],
        ['17', 45, 40],
        ['18', 42, 60],
        ['19', 45, 70],
        ['20', 67, 70],
        ['21', 55, 60],
        ['22', 20, 30],
        ['23', 25, 30],
        ['24', 45, 40],
        ['25', 42, 60],
        ['26', 45, 70],
        ['27', 67, 70],
        ['28', 55, 60],
        ['29', 20, 30],
        ['30', 25, 30],
        ['31', 45, 40],
      ]);
      var options = {
        title: '?????? ????????? ??????',
        vAxis: { title: "???" },
        hAxis: { title: "???" },
        seriesType: "bars",
        series: { 5: { type: "line" } }
      };
      var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
      chart.draw(data, options);
    }
    google.setOnLoadCallback(drawVisualization);
  </script>
</head>
<body>
<jsp:include page="../../common/sidebar.jsp"/>
<div class="mid" align="center">
        <h2 class="mTitle">???????????? VENIATIS</h2>
        <div class="Vtoday">
          <div class="Tvisitor">
            <img src="resources/common/undraw_posting_photo.svg">
            <h3>????????? ??? : 21</h3>
          </div>
          <div class="Tproject">
            <img src="resources/common/undraw_posting_photo.svg" alt="">
            <h3>?????? ???????????? ??? : 5</h3>
          </div>
          <div class="TQnA">
            <img src="resources/common/undraw_posting_photo.svg" alt="">
            <h3>?????? ?????? : 5</h3>
          </div>
        </div>
        <h2 class="mTitle">????????? ????????? ??????</h2>
        <div class="log">
          <div id="chart_div" style="width: 100%; height: 100%;"></div>
        </div>
        <h2 class="mTitle">??????????????? ??????</h2>
        <div class="project">
          <div class="Tvisitor">
            <img src="resources/common/undraw_posting_photo.svg">
            <h3>?????? ?????? ???????????? : 15</h3>
          </div>
          <div class="Tproject">
            <img src="resources/common/undraw_posting_photo.svg" alt="">
            <h3>???????????? ???????????? : 42</h3>
          </div>
          <div class="TQnA">
            <img src="resources/common/undraw_posting_photo.svg" alt="">
            <h3>????????? ???????????? : 17</h3>
          </div>
        </div>
        <h2 class="mTitle">????????? ?????? ??????</h2>
        <div class="money">
          <div class="chart-area">
            <canvas id="myAreaChart"></canvas>
          </div>
          <div class="mon">
            <div>?????? ?????? : <br> 3,589,450 ???</div>
            <div>?????? ?????? ?????? : <br> 128%</div>
            <div>??? ?????? : <br> 89,737,980 ???</div>
          </div>
        </div>
      </div>
<script>
	$(function(){
		$("#content").append($(".mid"))
	})
</script>
  <script src="resources/js/demo/chart-area-demo.js"></script>
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>