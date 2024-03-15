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

	<!-- 검색결과 상단 카테고리 네비게이션 -->
	<nav class="searchResult-nav">
		<i class="fa-solid fa-chevron-left"></i> 
		<input type="checkbox" class="btn-check" id="btn-check-1" name="checkFes" value="1" autocomplete="off">
		<label class="btn" for="btn-check-1">교육/체험</label>

		<input type="checkbox" class="btn-check" id="btn-check-2" name="checkFes" value="2" autocomplete="off"> 
		<label class="btn" for="btn-check-2">국악</label> 
			
		<input type="checkbox" class="btn-check" id="btn-check-3" name="checkFes" value="3" autocomplete="off"> 
		<label class="btn" for="btn-check-3">기타</label>

		<input type="checkbox" class="btn-check" id="btn-check-4" name="checkFes" value="4" autocomplete="off"> 
		<label class="btn" for="btn-check-4">독주/독창회</label> 
		
		<input type="checkbox" class="btn-check" id="btn-check-5" name="checkFes" value="5" autocomplete="off"> 
		<label class="btn" for="btn-check-5">무용</label> 
		
		<input type="checkbox" class="btn-check" id="btn-check-6" name="checkFes" value="6" autocomplete="off"> 
		<label class="btn" for="btn-check-6">뮤지컬/오페라</label>

		<input type="checkbox" class="btn-check" id="btn-check-7" name="checkFes" value="7" autocomplete="off"> 
		<label class="btn" for="btn-check-7">연극</label> 
		
		<input type="checkbox" class="btn-check" id="btn-check-8" name="checkFes" value="8" autocomplete="off"> 
		<label class="btn" for="btn-check-8">영화</label>

		<input type="checkbox" class="btn-check" id="btn-check-9" name="checkFes" value="9" autocomplete="off"> 
		<label class="btn" for="btn-check-9">전시/미술</label> 
		
		<input type="checkbox" class="btn-check" id="btn-check-10" name="checkFes" value="10" autocomplete="off"> 
		<label class="btn" for="btn-check-10">축제</label>

		<input type="checkbox" class="btn-check" id="btn-check-11" name="checkFes" value="11" autocomplete="off"> 
		<label class="btn" for="btn-check-11">콘서트</label> 
		
		<input type="checkbox" class="btn-check" id="btn-check-12" name="checkFes" value="12" autocomplete="off"> 
		<label class="btn" for="btn-check-12">클래식</label>
		
		<i class="fa-solid fa-chevron-right"></i>
	</nav>

	<!-- 검색결과 축제 항목 카드 -->
	<div class="content-list">
		<c:forEach items="${list}" var="item">
			<a href="/detail?code=${item.fesCode}" class="card">
				<img src="${item.poster}" class="card-poster" >
				
				<div class="card-body">
					<div class="cord-body-content">
						<p class="card-name">${item.name}</p>
						<p class="card-date">${item.startDate} ~ ${item.endDate}</p>
						<p class="card-place">${item.place}</p>
					</div>
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