<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="user" />
</sec:authorize>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>FESTOPIA | Find Seoul's Beat, Dive into FESTOPIA!</title>
    <!-- 파비콘 -->
    <link
      rel="icon"
      href="resources/resources/favicon.png"
      type="image/x-icon"
    />

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- 스타일 적용 -->
    <link rel="stylesheet" href="../../resources/css/reset.css" />
    <link rel="stylesheet" href="../../resources/css/festivalDetail.css" />

    <!-- 부트스트랩 -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>

    <!-- fontawesome -->
    <script
      src="https://kit.fontawesome.com/4602e82315.js"
      crossorigin="anonymous"
    ></script>
  </head>

  <body>
    <h2>축제상세 페이지</h2>
    ${user}
    <div class="fes-detail-card">
      <img src="${vo.poster}" class="detail-poster" />
      <div class="detail-info">
        <h5 class="detail-category">${vo.category}</h5>
        <h5 class="detail-name">${vo.name}</h5>
        <p class="detail-date">${vo.startDate} ~ ${vo.endDate}</p>
        <p class="detail-place">${vo.place}</p>
        <p class="detail-place">${vo.fee}</p>

        <c:choose>
          <c:when test="${empty favorite}">
            <i class="fa-regular fa-heart" id="addFav"></i>
          </c:when>
          <c:otherwise>
            <i class="fa-solid fa-heart" id="delFav"></i>
            <script>
              $("#delFav").click(() => {
                $.ajax({
                  type: "post",
                  url: "/delFav",
                  data: "code=" + ${favorite.fvCode},
                  success: function (data) {
                    location.reload();
                  },
                });
              });
            </script>
          </c:otherwise>
        </c:choose>

        <script>
          const test = ${festival.code};
                 	$("#addFav").click(() => {
                 		$.ajax({
          		console.log(test);
                  		// 요청
                  		type: "post",
                  		url: "/addFav",
                  		data: "code=" + test,
          		success: function(data) {
                  			location.reload();
                  		}
                  	})
                  });
        </script>

        <i class="fa-solid fa-arrow-up-from-bracket"></i>
      </div>
    </div>

    <div class="commentZone">
      <div id="inputCom">
        <p>댓글 입력</p>
        <form action="/writeCom" method="post">
          <textarea rows="5" cols="30" name="comText"></textarea>
          <input type="hidden" name="fesCode" value="${vo.code}" />
          <input
            type="submit"
            value="댓글 달기"
          />
        </form>
      </div>

      <div id="comList">
        <h6>댓글 목록</h6>

		<form action="/viewCom" method="post">
			<input type="hidden" name="fesCode" value="${vo.code}" />
		</form>
		<c:forEach items="${com}" var="item">
	        <strong>${item.userCode}</strong>
	        <span> | </span><span>${user.nickname}</span>
	        <p>${item.comText}</p>
        </c:forEach>
      </div>
    </div>
  </body>
</html>
