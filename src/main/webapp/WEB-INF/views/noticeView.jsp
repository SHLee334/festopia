<%@page import="com.semi.festopia.model.vo.NoticeBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% NoticeBoard board = (NoticeBoard) request.getAttribute("vo"); %>
<div class="content-container">
	<h1>특정 게시물</h1>
	<form action="/updateNotice" method="post" enctype="multipart/form-data">
		<input type="hidden" name="no" value="${vo.no}">
		<input type="hidden" name="noticeUrl" value="${vo.noticeUrl}">
		<div class="view-content">
			<label>Title</label>
			<input class="view-control" name="noticeTitle" value="${vo.noticeTitle}">
		</div>
		<div class="view-content">
			<label>Content</label>
			<textarea rows="10" cols="10" name="noticeContent" style="resize:none;">${vo.noticeContent}</textarea>
			<a href="/adminUpload/${vo.noticeUrl}" download><img src="/adminUpload/${vo.noticeUrl}"></a>
		</div>
		<div class="view-content">
			<label for="file">Add File</label>
			<input class="view-control" type="file" id="file" name="file" accept="image/*">
		</div>
		
		<button type="submit" class="btn btn-outline-warning">수정하기</button>
		<a class="btn btn-outline-danger" href="/delete?no=${vo.no}">삭제하기</a>
	</form>
</div>
</body>
</html>