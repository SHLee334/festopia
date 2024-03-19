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
<title>FESTOPIA | Find Seoul's Beat, Dive into FESTOPIA!</title>

<!-- 파비콘 -->
<link rel="icon" href="resources/resources/favicon.png" type="image/x-icon" />

<!-- 스타일 적용 -->
<link rel="stylesheet" href="../../resources/css/reset.css">
<link rel="stylesheet" href="../../resources/css/searchResult.css">

<!-- 아이콘 추가 : fontawesome -->
<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/header.jsp" />

	<div class="content-list-map">
		<c:forEach items="${list}" var="item">
            <div class="search-result-map">
              <div id="map"></div>
              <script
                type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e14271e9bb22881d526647d971ad171">
              </script>
              <script>
                var container = document.getElementById('map');
                var options = {
                    center: new kakao.maps.LatLng(${vo.lot}, ${vo.lat}),
                    level: 3
                };

                var map = new kakao.maps.Map(container, options);

                var imageSrc = "resources/resources/red-pin.png",
                    imageSize = new kakao.maps.Size(24, 29),
                    imageOption = {offset: new kakao.maps.Point(27, 69)};

                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                    markerPosition = new kakao.maps.LatLng(${item.lot}, ${item.lat});

                var marker = new kakao.maps.Marker({
                    position: markerPosition,
                    image: markerImage
                });

                marker.setMap(map);
              </script>
            </div>
		</c:forEach>
	</div>
</body>
</html>