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
    <title>FESTOPIA | Find Seoul's Beat!</title>

    <!-- 파비콘 -->
    <link rel="icon" href="resources/resources/favicon.png" type="image/x-icon" />


    <!-- 스타일 -->
    <link rel="stylesheet" href="../../resources/css/reset.css" />
    <link rel="stylesheet" href="../../resources/css/mypage.css" />

    <!-- ========== 글꼴 ========== -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Dongle&family=Poor+Story&family=Sunflower:wght@300&display=swap" rel="stylesheet">

    <!-- ========== jquery ========== -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/cbb1359000.js" crossorigin="anonymous"></script>
  </head>
  <body>
    <div class="mypage-container">
      <div id="logo"><a href="/">FESTOPIA</a></div>

      <div class="nickname">Hello, <span>${user.nickname}!</span></div>

      <nav class="item">
        <ul>


          <li class="li-nav">
            <button class="account-modify-button" id="button01">
              <img id="account-modify-button-icon" src="./resources/resources/green-setting.png"/>
              ACCOUNT
            </button>
          </li>
          <c:if test="${user.auth == 'ROLE_MEMBER'}">
            <li class="li-nav">
              <button class="account-modify-button" id="button02">
                <img id="account-modify-button-icon" src="./resources/resources/green-bulb.png"/>
                FAVORITE
              </button>
            </li>
            <li class="li-nav">
              <button class="account-modify-button" id="button03">
                공지사항
              </button>
            </li>
           
          </c:if>
          <!-- ========== 관리자 관련 ========== -->

          <c:if test="${user.auth == 'ROLE_ADMIN'}">
            <li class="li-nav">
              <button class="admin-modify-button" id="button04">
                관리하기
              </button>
            </li>
          </c:if>
          <li class="li-nav">
            <button class="account-modify-button" id="button05">
              로그아웃
            </button>
          </li>
        </ul>
      </nav>

      <div class="item" id="main-jsp1">
        <jsp:include page="mypage-account.jsp" />
      </div>

      <c:if test="${user.auth == 'ROLE_MEMBER'}">
        <div class="item" id="main-jsp2">
          <jsp:include page="mypage-favorite.jsp" />
        </div>
      </c:if>
      <c:if test="${user.auth == 'ROLE_ADMIN'}">
        <div class="item" id="admin-jsp">
          <div class="notice-main" id="notice">
            <jsp:include page="board.jsp" />
          </div>
        </div>
      </c:if>
    </div>
    <script src="../../resources/js/mypage.js"></script>
  </body>
</html>
