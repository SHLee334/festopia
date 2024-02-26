<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header부분만 따로</title>

<!-- 스타일 적용 -->
<link rel="stylesheet" href="./resources/css/index.css"/>

<!-- 아이콘 추가 -->
<script
src="https://kit.fontawesome.com/4602e82315.js"
crossorigin="anonymous"
></script>

</head>
<body>
	<header>
		<h1>FESTOPIA</h1>
		<nav>
			<a href="#section1"><i class="fa-solid fa-magnifying-glass"></i></a>
			<a href="#section2"><i class="fa-solid fa-circle-user"></i></i></a>
			<a href="#section3"><i class="fa-solid fa-circle-exclamation"></i></a>
		</nav>

	</header>
	<!--  
	<%-- 회원가입 세션 --%>
	<div class="user-account-set" >
		<div><a href="register.jsp">회원가입</a></div>
		<div><a href="#">로그인</a></div>
	</div>
	
	<%-- 로그인후 세션 --%>
	<div class="user-account-set">
		<div>user-id-info</div>
		<div><a href="#">마이페이지</a></div>
		<div><a href="#">로그아웃</a></div>
	</div>
	
	-->
	
</body>
</html>