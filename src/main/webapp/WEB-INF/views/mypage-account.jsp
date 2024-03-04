<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="user"/>
</sec:authorize>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav>
		<div>회원 사진</div>
		<div>${user.nickname}님, 환영합니다. nav파트는 position fixed</div>
	</nav>

	<div>
		<div class="account-second-page">
			닉네임 슬라이드 변경
			${user}
			<form action="/updateUserNickname" method="post">
				<div><span>현재 닉네임 : ${user.nickname}</span></div>
				<div><input type="text" name="nickname" placeholder="변경할 닉네임을 입력하세요" /> </div>
				<div><input type="hidden" name="userCode" value="${user.userCode}" /></div>
				<div><input type="submit" value="아이디 변경하기" /></div>
			</form>
		</div>

		<div class="account-second-page">
			pwd / email변경 슬라이드
			<form action="updateUserInfo" method="post">
				<div>
					<input type="password" name="password" placeholder="변경할 비밀번호를 입력해주세요"/>
					<input type="password" name="passwordCheck" placeholder="변경할 비밀번호를 한번 더 입력해주세요"/>
					<span>비밀번호 동일한거 확인 완료 라고 띄우기</span>	
				</div>
				<div>
					<input type="text" name="email" placeholder="변경할 이메일을 입력해주세요.">
				</div>
				<div>
					<input type="hidden" name="userCode" value="${user.userCode}" />
					<input type="submit" value="계정정보 변경하기">
				</div>
			</form>
		</div>
		
		<div class="account-second-page">회원탈퇴</div>
			<form action="/unableAccount" method="post">
				<div>
					<input type="password" name="password" placeholder="비밀번호를 입력해주세요" />
					<input type="hidden" name="pwdCheck" value="${user.password}">
					<c:if test="">
						<span>인증완료!(패스워드 인증시 뜨는 문자)</span>
						<input type="submit" value="계정삭제">	
					</c:if>
				</div>
			</form>
		<!--  account-second-page의 크기는 buttion3개 다 합한거랑 같은 사이즈 -->
	</div>
</body>
</html>