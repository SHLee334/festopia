<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header부분만 따로</title>
</head>
<body>


	<sec:authentication property="principal" var="user"/>
		<c:choose>
			<c:when test="${user == 'anonymousUser'}">
			
			<div class="user-account-set" >
				<div><a href="register">회원가입</a></div>
				<div><a href="#">로그인</a></div>
				<jsp:include page="/WEB-INF/views/register.jsp" />
				<jsp:include page="/WEB-INF/views/login.jsp" />
			</div>
			</c:when>
			<c:otherwise>
			<div class="user-account-set">
				<div>${user.id}</div>
				<div><a href="/mypage">마이페이지</a></div>
				<div><a href="/logout">로그아웃</a></div>
			</div>
			</c:otherwise>
		</c:choose>
		

			
</body>
</html>