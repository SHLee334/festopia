<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.boardTable {
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>
<a href="/admin-write">게시글쓰기</a>
	<table class="boardTable">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${board}" var="b" varStatus="status">
			<tr>
				<td>${b.no}</td>
				<td><a href="noticeView?no=${b.no}"> ${b.noticeTitle }</a></td>
				<td>${b.nickname}</td>
				<td><fmt:formatDate value="${b.noticeDate}" pattern="yyyy-MM-dd"/></td>
				<td>${b.viewCount}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>