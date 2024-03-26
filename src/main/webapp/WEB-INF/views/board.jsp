<%@page import="com.semi.festopia.model.vo.NoticeBoard"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" href="../../resources/css/Image_Gallery.css">
<!-- ========== 글꼴 ========== -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Dongle&family=Poor+Story&family=Poor+Story&family=Sunflower:wght@300&display=swap"
  rel="stylesheet"
/>

<style>
.boardTable {
	width: 100%;
	text-align: center;
}
.bSection-main{
	overflow: hidden;
}
</style>
</head>
<body>
<% List<NoticeBoard> board = (List<NoticeBoard>) request.getAttribute("board"); %>
	<c:if test="${user.auth == 'ROLE_MEMBER' || user == 'anonymousUser'}">
	<jsp:include page="/header.jsp"/>
	</c:if>
	<div class="tabs">
		<c:if test="${user.auth == 'ROLE_MEMBER'}">
		<div class="bSection-main">
			<div class="Container">
	
			<c:forEach items="${favInBoard}" var="inBoard">
				<div class="Picture">
					<img class="Picture-img card-poster " src='${inBoard.festival.poster}'/>
					<a href="detail?code=${inBoard.festival.fesCode}">
						<div class="Picture-note card-body">
							<p class="card-name">${inBoard.festival.name}</p>
							<p class="card-date">${inBoard.festival.startDate} ~ ${inBoard.festival.endDate}</p>
							<p class="card-place">${inBoard.festival.endDate}</p>
						</div>
					</a>
					
				  </div>
			</c:forEach>
			</div>
		</div>
		</c:if>
		<c:if test="${user.auth == 'ROLE_MEMBER'}">
			<div class="modify-second-page user-board" id="content-page">
				<h1 id="view-title-user">공지사항</h1>
				<table class="boardTable-user">
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
						<tr onclick="location.href='noticeView?no=${b.no}&userCode=${b.userCode}'" style="cursor:hand">
							<td>${fn:length(board) -  status.index}</td>
							<td >${b.noticeTitle }</a></td>
							<td>${b.user.nickname}</td>
							<td><fmt:formatDate value="${b.noticeDate}" pattern="yyyy-MM-dd"/></td>
							<td id="viewCount">${b.viewCount}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
	
	
		<c:if test='${user.auth == "ROLE_ADMIN"}'>
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
		  
		  
			<div class="modify-second-page" id="content-page">
				<h1 id="view-title">공지사항</h1>
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
						<tr onclick="location.href='noticeView?no=${b.no}&userCode=${b.userCode}'" style="cursor:hand">
							<td>${fn:length(board) -  status.index}</td>
							<td><a href="noticeView?no=${b.no}&userCode=${b.userCode}" id="adminDetail"> ${b.noticeTitle }</a></td>
							<td>${b.user.nickname}</td>
							<td><fmt:formatDate value="${b.noticeDate}" pattern="yyyy-MM-dd"/></td>
							<td id="viewCount">${b.viewCount}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
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
		</c:if>
	</div>


	  <script src="../../resources/js/admin.js"></script>
	  <script src="../../resources/js/Image_Gallery.js"></script>
</body>
</html>