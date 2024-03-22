<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="user" />
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FESTOPIA | Find Seoul's Beat!</title>
<!-- 파비콘 -->
<link rel="icon" href="resources/resources/favicon.png" type="image/x-icon" />

<!-- 스타일 적용 -->
<link rel="stylesheet" href="../../resources/css/reset.css">
<link rel="stylesheet" href="../../resources/css/searchResult.css">

<!-- 아이콘 추가 : fontawesome -->
<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
</head>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>


<body>
<!-- confetti -->
<script src="resources/js/confetti.js"></script>
<div class="buttonContainer" style="display:none">
    <button class="canvasBtn" id="stopButton">Stop Confetti</button>
    <button class="canvasBtn" id="startButton">Start Confetti</button>
</div>
<canvas id="canvas"></canvas>


	<jsp:include page="/header.jsp" />

  <div class="body-content">

    <!-- ========== 정렬 드롭다운 ========== -->
    <div class="dropdown result-sort">
      <button class="btn btn-secondary dropdown-toggle sort-dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
        정렬선택
      </button>
      <ul class="dropdown-menu sort-dropdown-menu">
        <li><a class="dropdown-item sort-dropdown-item" onclick="sort(2)">축제명</a></li>
        <li><a class="dropdown-item sort-dropdown-item" onclick="sort(3)">축제시작일</a></li>
        <li><a class="dropdown-item sort-dropdown-item" onclick="sort(4)">축제종료일</a></li>
        <li><a class="dropdown-item sort-dropdown-item" onclick="sort(6)">축제장소</a></li>
      </ul>
    </div>

	<!-- ========== 검색결과 축제 항목 카드 ========== -->
	<div class="content-list">
		<c:forEach items="${list}" var="item">
			<a href="/detail?code=${item.fesCode}" class="card">
				<img src="${item.poster}" class="card-poster" onerror="this.onerror=null; this.src='./resources/resources/favicon.png';">
				<div class="card-body">
                    <p class="card-name">${item.name}</p>
                    <p class="card-date">${item.startDate} ~ ${item.endDate}</p>
                    <p class="card-place">${item.place}</p>
				</div>
			 </a>
		</c:forEach>
	</div>


	<!-- 지도로 보기 버튼
	<a href="/searchResultMap" class="map-view-btn">
	    지도로 보기
	</a> -->

	<!-- 위로가기 버튼 -->
    <a href="#" class="top-btn">
        <img class="top-icon" src="././resources/resources/green-rocket.png">
    </a>

  </div>



  <script>
    window.onload=function(){
      $("#startButton").trigger("click");
      setTimeout(function(){
        $("#stopButton").trigger("click");
      }, 6000);
    }
  	const dto = JSON.parse(`${dto}`);
  	let link = "/search?sort=";
  	
  	function sort(sortValue) {
  		
  		link += sortValue;
  		link += "&checkStartDate=" + dto.checkStartDate;
  		link += "&checkEndDate=" + dto.checkEndDate;
  		link += "&checkDateSelect=" + dto.checkDateSelect;
  		if(dto.checkFesCate != null) {
  			link += "&checkFesCate=" + dto.checkFesCate;
  			}
  		link += "&inputFesName=" + dto.inputFesName;
  		link += "&checkFeeStatus=" + dto.checkFeeStatus;
  		
  		location.href = link;
  	}
  	
  </script>
  <script src="/resources/js/searchResult.js"></script>
</body>
</html>