<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

  <sec:authentication property="principal" var="user" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="write-container">
	<h1>공지사항 등록</h1>
	<form action="/noticeWrite" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userCode" value="${user.userCode}">
		<div class="write-group">
			<label>Title</label>
			<input class="write-control" name="noticeTitle">
		</div>
		<div class="write-group">
			<label>Content</label>
			<textarea class="write-control" rows="10" name="noticeContent"></textarea>
		</div>
		<div class="write-group">
			<label for="file">add File</label>
			<input class="write-control" type="file" id="file" name="file" accept="image/*">
		</div>
		<button type="submit" class="btn btn-outline-warning">등록</button>
	</form>
</div>
	
</body>
</html>