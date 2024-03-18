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

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- 아이콘 추가 : fontawesome -->
<script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/header.jsp" />

	

	<!-- 검색결과 축제 항목 카드 -->
	<div class="content-list">
	
		<c:forEach items="${list}" var="item">
			<a href="/detail?code=${item.code}" class="card">
				<img src="${item.poster}" class="card-img" >
				<!-- 썸네일 찜 
				<c:choose>
					<c:when test="${empty fav}">
						<i class="fa-regular fa-heart" id="addFav"></i>
					</c:when>
				<c:otherwise>
						<i class="fa-solid fa-heart" id="delFav"></i>
						
				<script>
					$("#delFav").click(() => {
						$.ajax({
							type: "post",
							url: "/delFav",
							data: "code=" + ${fav.fvCode},
							success: function(data) {
								location.reload();
							}
						})		
					})
				</script>
				</c:otherwise>
				</c:choose>
				
				<script>
					$("#addFav").click(() => {
						$.ajax({
							type: "post",
							url: "/addFav",
							data: "code=" + ${fav.fvCode},
							success: function(data) {
								
							}
						})
					})
				</script>
				-->
				
				<div class="card-body">
					<p class="card-name">${item.name}</p>
					<p class="card-date">${item.startDate} ~ ${item.endDate}</p>
					<p class="card-place">${item.place}</p>
				</div>
			</a>
		</c:forEach>
		
	</div>
</body>
</html>