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
        height:90%;
        padding-left: 10%;
        padding-right: 10%;
      }

      /* topText css*/
      .topText {
        width: 100%;
        height:8%;
      }

      /* search css */
      .search {
        width: 100%;
        height:7%; 
      }
      
      .search > div {
        float: left;
        box-sizing: border-box;
        padding-top: 0.3%;
        border-top:3px solid #40c8b5;
        border-bottom:3px solid #40c8b5;
      }
      .s1 {
        font-size:25px;
        width:14%;
        height:100%;
        line-height: 45px;
      }

      .s2 {
        width: 77%;
        height:100%;
        font-size:17px;
      }

      .s3 {
        width: 9%;
        height:100%;
      }

      .s2 * {
        margin-top: 0.7%;
      }

      .s2 >div {
        float: left;
        box-sizing: border-box;
      }

      .s2Name {
        width:35%;
        height:100%;
      }

      .s2Id {
        width:35%;
        height:100%;
      }

      .s2Type {
        width:30%;
        height:100%;
      }

      .s3 button {
        width:100%;
        height:100%;
        background:#40c8b5;
        border:none;
        border-radius: 10%;
      }

      /* Table css */
      .card-body {
        margin-top:5%;
        width:100%;
        height:80%;
        padding:0;
      }

      .table-responsive{
        width:100%;
        height:100%;
      }

      .table {
        width:100%;
      }

      th {
        font-size:18px;
        text-align: center;
        background:#40c8b5;
        color:black;
        border:0.5px solid ghostwhite;
      }

      .col-md-6 {
        display:none;
      }
  </style>
</head>
<body>
<jsp:include page="../../common/sidebar.jsp"/>
<div class="mid" align="center">
<div class="topText">
          <h2>?????? ??????</h2>
        </div>
        <form action="" class="search">
          <div class="s1">
            ?????? ?????? :
          </div>
          <div class="s2" align="left">
            <div class="s2Name">
              <label>?????? :</label>&nbsp;&nbsp;<input type="text" name="id" class="id">
            </div>
            <div class="s2Id">
              <label>????????? : </label>&nbsp;&nbsp;<input type="text" name="name" class="name">
            </div>
            <div class="s2Type">
              <label>?????? :</label>&nbsp;&nbsp;<select name="power" id="power" style="width:40%;text-align: center">
                <option value="All" selected>??????</option>
                <option value="creator">??????</option>
                <option value="Normal">??????</option>
              </select>
            </div>
          </div>
          <div class="s3"><button type="submit">??????</button></div>
        </form>
        <div class="card-body">
          <div class="table=responsive">
            <table class="table table-boardered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th width="14%">??????????????? ??????</th>
                  <th width="12%">??????</th>
                  <th width="15%">?????????</th>
                  <th width="12%">??????</th>
                  <th width="17%">?????????</th>
                  <th width="19%">?????????</th>
                  <th width="11%">????????????</th>
                </tr>
              </thead>
              <tbody>

              </tbody>
            </table>
          </div>
        </div>
      </div>
<script>
	$(function(){
		$("#content").append($(".mid"))
	})
</script>
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>