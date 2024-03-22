<%@page import="com.semi.festopia.model.vo.Favorite"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FESTOPIA | Find Seoul's Beat!</title>

<!-- 파비콘 -->
<link rel="icon" href="resources/resources/favicon.png" type="image/x-icon" />

<!-- 스타일 -->
<link rel="stylesheet" href="../../resources/css/reset.css" />
<link rel="stylesheet" href="../../resources/css/mypage-favorite.css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</head>
<body>
<sec:authentication var="user" property="principal" />
<%
List<Favorite> fvList = (List<Favorite>) request.getAttribute("fvList");
%>
<div class="fv-list-content">
    <h4>${user.nickname}님의 찜 목록</h4>

    <!-- 찜목록 테이블 -->
    <table class="table table-hover">
      <thead>
        <tr>
          <th scope="col" class="tb-head-no">No</th>
          <th scope="col" class="tb-head-name">축제명</th>
          <th scope="col" class="tb-head-start-date">축제 시작일</th>
          <th scope="col" class="tb-head-end-date">축제 종료일</th>
        </tr>
      </thead>
      <tbody class="table-group-divider">
        <c:forEach items="${fvList}" var="fvInfo" varStatus="status">
            <tr>
                <td class="tb-body-no">${status.count}</td>
                <td class="tb-body-name"><a href="/detail?code=${fvInfo.festival.fesCode}">${fvInfo.festival.name}</a></td>
                <td class="tb-body-start-date">${fvInfo.festival.startDate}</td>
                <td class="tb-body-end-date">${fvInfo.festival.endDate}</td>
            </tr>
        </c:forEach>
      </tbody>
    </table>
</div>
</body>
</html>