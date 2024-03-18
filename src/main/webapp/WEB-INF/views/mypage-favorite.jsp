<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Favorite List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous" />
</head>
<body>
    <div class="fv-list-container">
    		<div class="fv-list-header">
    			<h1>List Page</h1>
    		</div>

    		<table class="fv-list-table">
    			<thead>
    				<tr>
    					<th>#번호</th>
    					<th>축제코드</th>
    					<th>찜 날짜</th>
    				</tr>
    			</thead>
    			<tbody>
    				<c:forEach items="${fvList}" var="fvInfo" varStatus="status">
    					<tr>
    						<td>${status.count}</td>
    						<td><a href="/detail?code=${fvInfo.fesCode}">${fvInfo.fesCode}</a></td>
                            <th>${fvInfo.fvDate}</th>
    					</tr>
    				</c:forEach>
    			</tbody>
    		</table>
    	</div>

</body>
</html>