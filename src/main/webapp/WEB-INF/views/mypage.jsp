<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="user" />
</sec:authorize>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FESTOPIA | Find Seoul's Beat, Dive into FESTOPIA!</title>
    <!-- 파비콘 -->
    <link
      rel="icon"
      href="resources/resources/favicon.png"
      type="image/x-icon"
    />
    <link rel="stylesheet" href="../../resources/css/reset.css" />
    <style>
      .mypage-container {
        height: 100vh;
        display: flex;
        align-items: center;
        background-image: url(../../resources/css/mypage.jpg);
        background-repeat: no-repeat;
        background-size: cover;
        background-position: bottom;
        flex-shrink: 0;
      }

      .item {
        height: 80vh;
        display: flex;
        align-items: center;
      }

      /* nav section */
      .item:nth-child(1) {
        background-color: none;
        width: 30vh;
        margin-left: 10rem;
      }

      .li-nav {
        margin-bottom: 50px;
      }

      .account-modify-button {
        border: none;
        border-radius: 5px;
        width: 12rem;
        height: 5rem;
      }
      .admin-modify-button {
        border: none;
        border-radius: 5px;
        width: 12rem;
        height: 5rem;
      }

      /* main jsp section */
      #main-jsp1 {
        background-color: white;
        width: 130vh;
        border-radius: 20px;
        display: none;
        overflow: auto;
        flex-shrink: 0;
      }

      #main-jsp2 {
        background-color: blue;
        width: 130vh;
        border-radius: 20px;
        display: none;
        overflow: auto;
        flex-shrink: 0;
      }

      #main-jsp3 {
        background-color: aqua;
        width: 130vh;
        border-radius: 20px;
        display: none;
        overflow: auto;
        flex-shrink: 0;
      }

      #admin-jsp {
        background-color: yellowgreen;
        width: 130vh;
        border-radius: 20px;
        display: none;
        overflow: auto;
        flex-shrink: 0;
      }

      /* 구간 별 색깔 */
      #button01 {
        background-color: #01579b;
        /* flex-shrink: 0; */
      }

      #button02 {
        background-color: blue;
        /* flex-shrink: 0; */
      }

      #button03 {
        background-color: aqua;
        /* flex-shrink: 0; */
      }

      #button04 {
        background-color: yellowgreen;
      }
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  </head>
  <body>
    <jsp:include page="/header.jsp" />
    <div class="mypage-container">
      <nav class="item">
        <ul>
          <li class="li-nav">${user.nickname}님,반갑습니다. ${user.auth}</li>

          <li class="li-nav">
            <button class="account-modify-button" id="button01">
              계정설정
            </button>
          </li>
          <c:if test="${user.auth == 'ROLE_MEMBER'}">
            <li class="li-nav">
              <button class="account-modify-button" id="button02">
                찜목록
              </button>
            </li>
            <li class="li-nav">
              <button class="account-modify-button" id="button03">
                조회내역
              </button>
            </li>
          </c:if>
          <!-- 관리자 관련-->

          <c:if test="${user.auth == 'ROLE_ADMIN'}">
            <li class="li-nav">
              <button class="admin-modify-button" id="button04">
                관리하기
              </button>
            </li>
          </c:if>
        </ul>
      </nav>

      <div class="item" id="main-jsp1">
        <jsp:include page="mypage-account.jsp" />
      </div>
      <c:if test="${user.auth == 'ROLE_MEMBER'}">
        <div class="item" id="main-jsp2">account jsp2</div>
        <div class="item" id="main-jsp3">
          <jsp:include page="myComment.jsp" />
        </div>
      </c:if>
      <c:if test="${user.auth == 'ROLE_ADMIN'}">
        <div class="item" id="admin-jsp">
          <div class="notice-main" id="notice">
            <jsp:include page="admin.jsp" />
          </div>
          <!-- <div class="notice-detail" id="noticeInner">
          <jsp:include page="noticeView.jsp" />
        </div> -->
        </div>
      </c:if>
    </div>
    <script src="../../resources/js/mypage.js"></script>
  </body>
</html>
