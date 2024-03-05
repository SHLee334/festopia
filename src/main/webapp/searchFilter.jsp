<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FESTOPIA | Find Seoul's Beat, Dive into FESTOPIA!</title>
<!-- 파비콘 -->
<link rel="icon" href="resources/resources/favicon.png" type="image/x-icon" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<!-- 스타일 적용 -->
<link rel="stylesheet" href="./resources/css/searchResult.css" />

</head>
<body>
	<jsp:include page="/header.jsp" />
	<main>
		<h1>검색 결과 페이지</h1>
		<form action="search" >
		<div class="searchFilter">
			<div class="category">
			<input type="checkbox" class="btn-check" id="btn-check-1" name="checkFes" value="1"
			autocomplete="off"> <label class="btn" for="btn-check-1">교육/체험</label>
			
			<input type="checkbox" class="btn-check" id="btn-check-2" name="checkFes" value="2"
			autocomplete="off"> <label class="btn" for="btn-check-2">국악</label>
			 
			<input type="checkbox" class="btn-check" id="btn-check-3" name="checkFes" value="3"
			autocomplete="off"> <label class="btn" for="btn-check-3">기타</label>
			
			<input type="checkbox" class="btn-check" id="btn-check-4" name="checkFes" value="4"
			autocomplete="off"> <label class="btn" for="btn-check-4">독주/독창회</label>
			 
			<input type="checkbox" class="btn-check" id="btn-check-5" name="checkFes" value="5"
			autocomplete="off"> <label class="btn" for="btn-check-5">무용</label>
			 
			<input type="checkbox" class="btn-check" id="btn-check-6" name="checkFes" value="6"
			autocomplete="off"> <label class="btn" for="btn-check-6">뮤지컬/오페라</label>
			<br>
			<input type="checkbox" class="btn-check" id="btn-check-7" name="checkFes" value="7"
			autocomplete="off"> <label class="btn" for="btn-check-7">연극</label>
			
			<input type="checkbox" class="btn-check" id="btn-check-8" name="checkFes" value="8"
			autocomplete="off"> <label class="btn" for="btn-check-8">영화</label>
			
			<input type="checkbox" class="btn-check" id="btn-check-9" name="checkFes" value="9"
			autocomplete="off"> <label class="btn" for="btn-check-9">전시/미술</label>
			
			<input type="checkbox" class="btn-check" id="btn-check-10" name="checkFes" value="10"
			autocomplete="off"> <label class="btn" for="btn-check-10">축제</label>
			 
			<input type="checkbox" class="btn-check" id="btn-check-11" name="checkFes" value="11"
			autocomplete="off"> <label class="btn" for="btn-check-11">콘서트</label>
			
			<input type="checkbox" class="btn-check" id="btn-check-12" name="checkFes" value="12"
			autocomplete="off"> <label class="btn" for="btn-check-12">클래식</label>
			</div>
			
			<input type="submit" value="검색">
	
		</div>
		</form>
	</main>

</body>
</html>