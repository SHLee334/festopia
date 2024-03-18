<%@page import="com.semi.festopia.model.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
.boardTable {
	width: 100%;
	text-align: center;
}
</style>
</head>
<body>
<% List<NoticeBoard> board = (List<NoticeBoard>) request.getAttribute("board"); %>
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
				<td><a href="noticeView?no=${b.no}&useCode=${b.userCode}" id="adminDetail"> ${b.noticeTitle }</a></td>
				<td>${b.user.nickname}</td>
				<td><fmt:formatDate value="${b.noticeDate}" pattern="yyyy-MM-dd"/></td>
				<td id="viewCount">${b.viewCount}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

	<script>
		$("#adminDetail").click(()=>{
			$.ajax({
				type: "post",
				url: "/viewCount",
				data: "viewCount="+ this.$("#viewCount").val(),
				success: function(count){
					console.log(count);
					this.$("#viewCount").text(count);
				}
			})
		})
	</script>
</body>
</html>