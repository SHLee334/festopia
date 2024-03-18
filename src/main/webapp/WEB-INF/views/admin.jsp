<%@page import="com.semi.festopia.model.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %>

  <sec:authentication property="principal" var="user" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/admin.css">
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
	<div class="tabs">
		<div class="tab-header">
			<div class="pigeon-account-small">
				
				  <div id="userImage-small">
					<img src="/profile/${user.userProfileUrl}" />
				  </div>
				
				<span id="admin-nickname">${user.nickname}님</span>
			</div>
			
		  <div class="inneractive0">게시글 보기</div>
		  <div class="inneractive1">게시글 작성</div>
		  <div class="inneractive2">festopia</div>
		</div>
  
		<div class="tab-content">
		  <div class="innercontent0">
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
			
			<div class="modify-second-page" id="content-page">
			
			</div>
		  </div>
  
		  <div class="innercontent1">
			<div class="modify-second-page" id="content-page">
				<jsp:include page="admin-write.jsp" />
			</div>
		  </div>
  
		  <div class="innercontent2">
			<div class="modify-second-page" id="content-page">
			  
			  
			</div>
		  </div>
		</div>
	  </div>

















	  <script src="../../resources/js/admin.js"></script>

	

</body>
</html>