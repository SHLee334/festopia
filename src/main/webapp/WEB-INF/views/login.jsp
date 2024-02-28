<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인세션</h1>
    <form action="/login" method="post">
      <div><input type="text" name="username" placeholder="아이디를 입력해주세요" /></div>
      <div><input type="password" name="password" placeholder="패스워드를 입력해주세요"/></div>
      <div><input type="submit" value="로그인" /></div>
    </form>
</body>
</html>