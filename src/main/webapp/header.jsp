<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header부분만 따로</title>
</head>
<body>
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
	
</body>
</html>