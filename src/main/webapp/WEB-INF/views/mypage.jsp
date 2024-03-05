<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="user" />
</sec:authorize>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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

      /* main jsp section */
      #main-jsp:nth-of-type(1) {
        background-color: #01579b;
        width: 130vh;
        border-radius: 20px;
        display: none;
        overflow: auto;
      }
      #main-jsp:nth-last-of-type(2) {
        background-color: blue;
        width: 130vh;
        border-radius: 20px;
        display: none;
        overflow: auto;
      }
      #main-jsp:nth-of-type(3) {
        background-color: aqua;
        width: 130vh;
        border-radius: 20px;
        display: none;
        overflow: auto;
      }

      /* 구간 별 색깔 */
      #button01 {
        background-color: #01579b;
      }
      #button02 {
        background-color: blue;
      }
      #button03 {
        background-color: aqua;
      }
    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  </head>
  <body>
    <jsp:include page="/header.jsp" />
    <div class="mypage-container">
      <nav class="item">
        <ul>
          <li class="li-nav">${user.nickname}님, 반갑습니다.</li>
          <li class="li-nav">
            <button class="account-modify-button" id="button01">
              계정설정
            </button>
          </li>
          <li class="li-nav">
            <button class="account-modify-button" id="button02">찜목록</button>
          </li>
          <li class="li-nav">
            <button class="account-modify-button" id="button03">
              조회내역
            </button>
          </li>
        </ul>
      </nav>

      <div class="item" id="main-jsp">
        <jsp:include page="mypage-account.jsp" />
      </div>
      <div class="item" id="main-jsp">account jsp2</div>
      <div class="item" id="main-jsp">account jsp3</div>
    </div>
    <script src="../../resources/js/mypage.js"></script>
  </body>
</html>
