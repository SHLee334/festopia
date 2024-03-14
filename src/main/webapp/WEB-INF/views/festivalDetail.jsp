<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>FESTOPIA | Find Seoul's Beat, Dive into FESTOPIA!</title>
<!-- 파비콘 -->
<link rel="icon" href="resources/resources/favicon.png"
	type="image/x-icon" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- 스타일 적용 -->
<link rel="stylesheet" href="../../resources/css/reset.css" />
<link rel="stylesheet" href="../../resources/css/festivalDetail.css" />

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/4602e82315.js"
	crossorigin="anonymous"></script>
</head>

<body>
	<sec:authentication var="user" property="principal" />
	<h2>축제상세 페이지</h2>
	
	<!-- 축제정보 카드 -->
	<div class="fes-detail-card">
		<img src="${vo.poster}" class="detail-poster" />
		<div class="detail-info">
			<h5 class="detail-category">${vo.category}</h5>
			<h5 class="detail-name">${vo.name}</h5>
			<p class="detail-date">${vo.startDate}~ ${vo.endDate}</p>
			<p class="detail-place">${vo.place}</p>
			<p class="detail-place">${vo.fee}</p>

			<c:choose>
				<c:when test="${empty favorite}">
					<i class="fa-regular fa-heart" id="addFav"></i>
				</c:when>
				<c:otherwise>
					<i class="fa-solid fa-heart" id="delFav"></i>
					
					<script>
					console.log(${favorite.fvCode});
		              $("#delFav").click(() => {
		                $.ajax({
		                  type: 'post',
		                  url: '/delFav',
		                  data: 'code=' + ${favorite.fvCode},
		                  success: function (data) {
		                    location.reload();
		                  }
		                });
		              });
		            </script>
				</c:otherwise>
			</c:choose>
			<script>
				$('#addFav').click(() => {
					$.ajax({
						type: 'post',
						url: '/addFav',
						data: 'code=' + ${vo.fesCode},
						success: function(data) {
							location.reload();
						}
					});
				});
			</script>

			<!-- 공유(클립보드) -->
			<i class="fa-solid fa-arrow-up-from-bracket"></i>
		</div>
	</div>
	
	
	<!-- 맵 -->
	<div class="fes-detail-map">
		
	</div>	


	<!-- 축제정보 카드 -->
	<div class="commentZone">
	
	</div>

</body>
</html>
