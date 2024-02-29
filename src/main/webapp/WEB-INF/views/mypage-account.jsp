<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav>
		<div>회원 사진</div>
		<div>님, 환영합니다. nav파트는 position fixed</div>
	</nav>

	<div>
		<div>
			<button class="account-main-page">아이디변경</button>
			<button class="account-main-page">비밀번호 변경</button>
			<button class="account-main-page">회훤탈퇴</button>
		</div>

		<div class="account-second-page">
			ID 슬라이드 변경
			<form action="updateId" method="post">
				<div>
					<span>현재 아이디 : ${vo.id}</span>
					<input type="text" name="id" placeholder="변경할 아이디를 입력하세요" /> 
					<input type="submit" value="아이디 변경하기" />
				</div>
			</form>
		</div>

		<div class="account-second-page">
			pwd변경 슬라이드
			<form action="updatePassword" method="post">
			<span>아이디 확인/ 비밀번호 확인</span>
				<input type="password" name="password" value="변경할 비밀번호를 입력해주세요"/>
				<input type="password" name="passwordCheck" value="변경할 비밀번호를 한번 더 입력해주세요"/>
				<input type="submit" value="비밀번호 변경하기">
			</form>
		</div>
		
		<div class="account-second-page">회원탈퇴</div>
		<!--  account-second-page의 크기는 buttion3개 다 합한거랑 같은 사이즈 -->
	</div>




</body>
</html>