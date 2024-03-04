<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<jsp:include page="/header.jsp" />
	
	<h1>축제 조회 결과</h1>
	<table border="1">
		<tr>
			<th>축제명</th>
			<th>시작일</th>
			<th>종료일</th>
			<th>카테고리</th>
		</tr>
		
		<c:forEach items="${list}" var="item">
		<tr>
			<td>${item.name}</td>
			<td>${item.startDate}</td>
			<td>${item.endDate}</td>
			<td>${item.category}</td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>