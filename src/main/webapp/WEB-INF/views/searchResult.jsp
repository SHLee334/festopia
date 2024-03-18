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

    <div class="dropdown result-sort">
      <button class="btn btn-secondary dropdown-toggle sort-dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
        시작일 내림차순
      </button>
      <ul class="dropdown-menu sort-dropdown-menu">
        <li><a class="dropdown-item sort-dropdown-item" href="www.google.com">시작일 오름차순</a></li>
        <li><a class="dropdown-item sort-dropdown-item" href="#">종료일 오름차순</a></li>
        <li><a class="dropdown-item sort-dropdown-item" href="#">종료일 내림차순</a></li>
        <li><a class="dropdown-item sort-dropdown-item" href="#">축제명 오름차순</a></li>
        <li><a class="dropdown-item sort-dropdown-item" href="#">축제명 내림차순</a></li>
        <li><a class="dropdown-item sort-dropdown-item" href="#">인기순</a></li>
        <li><a class="dropdown-item sort-dropdown-item" href="#">조회순</a></li>
      </ul>
    </div>

	<!-- 검색결과 축제 항목 카드 -->
	<div class="content-list">
		<c:forEach items="${list}" var="item">
			<a href="/detail?code=${item.fesCode}" class="card">

				<img src="${item.poster}" class="card-poster" >

				<div class="card-body">
                    <p class="card-name">${item.name}</p>
                    <p class="card-date">${item.startDate} ~ ${item.endDate}</p>
                    <p class="card-place">${item.place}</p>
				</div>

				<!-- 찜 -->
				<c:choose>
				<c:when test="${empty favorite}">
					<h3><i class="fa-solid fa-heart" id="addFav"></i></h3>
				</c:when>
				<c:otherwise>
					<h3><i class="fa-solid fa-heart" id="delFav"></i></h3>

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
				console.log(`${item.fesCode}`);
					$('#addFav').click(() => {
						$.ajax({
							type: 'post',
							url: '/addFav',
							data: 'code=' + ${item.fesCode},
							success: function(data) {
								location.reload();
							}
						});
					});
				</script>
			 </a>
		</c:forEach>
	</div>
</body>
</html>