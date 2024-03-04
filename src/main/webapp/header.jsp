<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>header부분만 따로</title>

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

    <!-- 스타일 적용 -->
    <link rel="stylesheet" href="./resources/css/index.css" />

    <!-- js 적용 -->
    <script src="resources/js/index.js"></script>

    <!-- 아이콘 추가 -->
    <script
      src="https://kit.fontawesome.com/4602e82315.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <header>
      <!-- 스크롤 기능-->
      <div class="progress-bar-container">
        <div class="progress-bar"></div>
      </div>
      <h1>FESTOPIA</h1>
      <nav>
        <a href="searchFilter.jsp"
          ><i class="fa-solid fa-magnifying-glass" style="color: #938f9e"></i
        ></a>
        <button
          class="btn btn-secondary dropdown-toggle"
          type="button"
          data-bs-toggle="dropdown"
          aria-expanded="false"
        >
          <i class="fa-solid fa-circle-user"></i>
        </button>
        <a href="#section3"
          ><i class="fa-solid fa-circle-exclamation" style="color: #938f9e"></i
        ></a>
        <sec:authentication property="principal" var="user" />

        <ul class="dropdown-menu">
          <c:choose>
            <c:when test="${user == 'anonymousUser'}">
              <li>
                <button
                  type="button"
                  class="btn btn-primary"
                  data-bs-toggle="modal"
                  data-bs-target="#exampleModal"
                >
                  로그인
                </button>
              </li>

              <li>
                <button
                  type="button"
                  class="btn btn-primary"
                  data-bs-toggle="modal"
                  data-bs-target="#exampleModal2"
                >
                  회원가입
                </button>
              </li>
            </c:when>
            <c:otherwise>
              <sec:authorize
                access="hasRole('ROLE_ADMIN') and isAuthenticated()"
              />
              <li>${user.nickname}님, 환영합니다</li>
              <li><a class="dropdown-item" href="/mypage">마이페이지</a></li>
              <li><a class="dropdown-item" href="/logout">로그아웃</a></li>
            </c:otherwise>
          </c:choose>
        </ul>
      </nav>

      <!-- Modal -->
      <div
        class="modal fade"
        id="exampleModal"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">
                Modal title
              </h1>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <jsp:include page="/WEB-INF/views/login.jsp" />
            </div>
          </div>
        </div>
      </div>

      <!-- Modal 2-->
      <div
        class="modal fade"
        id="exampleModal2"
        tabindex="-1"
        aria-labelledby="exampleModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">
                Modal title
              </h1>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Close"
              ></button>
            </div>
            <div class="modal-body">
              <jsp:include page="/WEB-INF/views/register.jsp" />
            </div>
          </div>
        </div>
      </div>

      <div class="emoji">
        <ul id="list">
          <li>
            <a href="#section1"
              ><img
                src="./resources/css/free-icon-firework-8939197.png"
                alt="Logo"
                width="50"
                height="50"
                class="d-inline-block align-text-top"
            /></a>
          </li>
          <br />
          <br />
          <br />
          <br />
          <li>
            <a href="#section2"
              ><img
                src="./resources/css/free-icon-ballons-5089869.png"
                alt="Logo"
                width="50"
                height="50"
                class="d-inline-block align-text-top"
            /></a>
          </li>
          <br />
          <br />
          <br />
          <br />
          <li>
            <a href="#section3"
              ><img
                src="./resources/css/free-icon-parade-5257560.png"
                alt="Logo"
                width="50"
                height="50"
                class="d-inline-block align-text-top"
            /></a>
          </li>
        </ul>
      </div>
    </header>
  </body>
</html>
