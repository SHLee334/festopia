<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>FESTOPIA | Find Seoul's Beat, Dive into FESTOPIA!</title>

    <!-- =============== Jquery =============== -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <!-- Jquery UI JS파일 -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!-- Jquery UI CSS파일 -->
    <link
      rel="stylesheet"
      href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
    />

    <!-- =============== favicon =============== -->
    <link
      rel="icon"
      href="resources/resources/favicon.png"
      type="image/x-icon"
    />

    <!-- =============== REMIXICONS =============== -->
    <link
      href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
      rel="stylesheet"
    />

    <!-- =============== bootstrap =============== -->
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
    <link rel="stylesheet" href="./resources/css/header.css" />

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

      <div id="title">
        <a hrf="index.jsp"><img src="./resources/resources/logo.png" /></a>
      </div>

      <div id="btnPac">
        <div class="container">
          <form
            action="search"
            class="search"
            id="search-bar"
            name="name"
            onsubmit="return OnClick()"
          >
            <input
              type="search"
              placeholder="Type something..."
              name="inputFesName"
              class="search__input"
              autocomplete="off"
            />
            <div class="cateFilter" style="display: none">
              <div class="searchFilter">
                <div class="category">
                  <div class="category-1">
                    <input
                      type="checkbox"
                      class="btn-check"
                      id="btn-check-1"
                      name="checkFesCate"
                      value="1"
                      autocomplete="off"
                    />
                    <label class="btn category-btn" for="btn-check-1"
                      >교육/체험</label
                    >
                    <input
                      type="checkbox"
                      class="btn-check"
                      id="btn-check-2"
                      name="checkFesCate"
                      value="2"
                      autocomplete="off"
                    />
                    <label class="btn category-btn" for="btn-check-2"
                      >국악</label
                    >
                    <input
                      type="checkbox"
                      class="btn-check"
                      id="btn-check-3"
                      name="checkFesCate"
                      value="3"
                      autocomplete="off"
                    />
                    <label class="btn category-btn" for="btn-check-3"
                      >기타</label
                    >
                    <input
                      type="checkbox"
                      class="btn-check"
                      id="btn-check-4"
                      name="checkFesCate"
                      value="4"
                      autocomplete="off"
                    />
                    <label class="btn category-btn" for="btn-check-4"
                      >독주/독창회</label
                    >
                    <input
                      type="checkbox"
                      class="btn-check"
                      id="btn-check-5"
                      name="checkFesCate"
                      value="5"
                      autocomplete="off"
                    />
                    <label class="btn category-btn" for="btn-check-5"
                      >무용</label
                    >
                    <input
                      type="checkbox"
                      class="btn-check"
                      id="btn-check-6"
                      name="checkFesCate"
                      value="6"
                      autocomplete="off"
                    />
                    <label class="btn category-btn" for="btn-check-6"
                      >뮤지컬/오페라</label
                    >
                  </div>
                  <div class="category-2">
                    <input
                      type="checkbox"
                      class="btn-check"
                      id="btn-check-7"
                      name="checkFesCate"
                      value="7"
                      autocomplete="off"
                    />
                    <label class="btn category-btn" for="btn-check-7"
                      >연극</label
                    >
                    <input
                      type="checkbox"
                      class="btn-check"
                      id="btn-check-8"
                      name="checkFesCate"
                      value="8"
                      autocomplete="off"
                    />
                    <label class="btn category-btn" for="btn-check-8"
                      >영화</label
                    >
                    <input
                      type="checkbox"
                      class="btn-check"
                      id="btn-check-9"
                      name="checkFesCate"
                      value="9"
                      autocomplete="off"
                    />
                    <label class="btn category-btn" for="btn-check-9"
                      >전시/미술</label
                    >
                    <input
                      type="checkbox"
                      class="btn-check"
                      id="btn-check-10"
                      name="checkFesCate"
                      value="10"
                      autocomplete="off"
                    />
                    <label class="btn category-btn" for="btn-check-10"
                      >축제</label
                    >
                    <input
                      type="checkbox"
                      class="btn-check"
                      id="btn-check-11"
                      name="checkFesCate"
                      value="11"
                      autocomplete="off"
                    />
                    <label class="btn category-btn" for="btn-check-11"
                      >콘서트</label
                    >
                    <input
                      type="checkbox"
                      class="btn-check"
                      id="btn-check-12"
                      name="checkFesCate"
                      value="12"
                      autocomplete="off"
                    />
                    <label class="btn category-btn" for="btn-check-12"
                      >클래식</label
                    >
                  </div>
                </div>
                <hr />

                <div class="fesDate">
                  <h5>기간</h5>
                  <div id="dateSetParty">
                    <select name="checkDateSelect" id="checkDateSelect">
                      <option value="targetStart">시작일</option>
                      <option value="targetEnd">종료일</option>
                    </select>
                    &nbsp; &nbsp;
                    <input
                      type="text"
                      class="datepicker"
                      id="startDatepicker"
                      name="checkStartDate"
                      autocomplete="off"
                    />
                    &nbsp;~&nbsp;
                    <input
                      type="text"
                      class="datepicker"
                      id="endDatepicker"
                      name="checkEndDate"
                      autocomplete="off"
                    />
                    <div>
                      <button type="button" class="dateSetBtn" id="totalDate">
                        전체
                      </button>
                      <button type="button" class="dateSetBtn" id="today">
                        오늘
                      </button>
                      <button type="button" class="dateSetBtn" id="1week">
                        일주일
                      </button>
                      <button type="button" class="dateSetBtn" id="1month">
                        한달
                      </button>
                      <button type="button" class="dateSetBtn" id="1year">
                        일년
                      </button>
                    </div>
                  </div>
                </div>
              </div>

              <hr />

              <div class="checkfeeStatus">
                <h5>입장료</h5>
                <label
                  ><input
                    type="checkbox"
                    name="checkFeeStatus"
                    value="1"
                    checked
                  />
                  유료</label
                >
                <label
                  ><input
                    type="checkbox"
                    name="checkFeeStatus"
                    value="2"
                    checked
                  />
                  무료</label
                >
              </div>
              <hr />
              <div id="searchFilterButton">
                <input type="submit" value="D I V E !!" id="diveButton" />
                <i class="fa-regular fa-rectangle-xmark closeSearchFilter"></i>
              </div>
            </div>

            <div class="search__button" id="search-button">
              <i class="ri-search-2-line search__icon"></i>
              <i class="ri-close-line search__close closeAllSearchFilter"></i>
            </div>
          </form>

          <!--로그인, 회원가입 -->
          <button
            class="btn btn-secondary dropdown-toggle btn-user"
            id="anonymousUser"
            type="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            <i class="fa-solid fa-circle-user"></i>
          </button>

          <!-- 공지사항 -->
          <a href="" id="inform">
            <i class="fa-solid fa-circle-exclamation fa-2xl"></i
          ></a>
          <!-- <sec:authentication property="principal" var="user" /> -->

          <ul class="dropdown-menu">
            <c:choose>
              <c:when test="${user == 'anonymousUser'}">
                <li>
                  <button
                    type="button"
                    class="dropdown-item"
                    data-bs-toggle="modal"
                    data-bs-target="#exampleModal"
                  >
                    로그인
                  </button>
                </li>

                <li>
                  <button
                    type="button"
                    class="dropdown-item"
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
                <li>${user.nickname}님,환영합니다</li>
                <li><a class="dropdown-item" href="/mypage">마이페이지</a></li>
                <li><a class="dropdown-item" href="/logout">로그아웃</a></li>
              </c:otherwise>
            </c:choose>
          </ul>
        </div>
      </div>

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
              <h1 class="modal-title fs-5" id="exampleModalLabel">로그인</h1>
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
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">회원가입</h1>
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
    </header>

    <!-- js 적용 -->
    <script src="resources/js/header.js"></script>
  </body>
</html>
