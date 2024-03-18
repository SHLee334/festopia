<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%>

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

    <!--  부트스트랩 또 적용하면 안됨  -->

    <!-- 스타일 적용 -->
    <link rel="stylesheet" href="./resources/css/index.css" />

    <!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&family=Lilita+One&display=swap"
      rel="stylesheet"
    />

    <!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&family=Lilita+One&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <jsp:include page="/header.jsp" />

    <script>
      $.ajax({
        // 요청
        type: "post",
        url: "/search",
        // 응답
        success: function (list) {
          console.log(list);
          let htmlCode = "";
          for (const item of list) {
            htmlCode +=
              '<div class="card-css">' +
              '<a href="상세페이지">' +
              '<div class = " card-css-image">' +
              "<img src=" +
              item.poster +
              ' class=" card-css-img" >' +
              '<button class="fav-btn" type="button" onclick="alert(\'찜 목록 추가!\')">' +
              "</button>" +
              '<div class="card-body-css">' +
              '<p class="card-name-css">' +
              item.name +
              "</p>" +
              '<p class="card-date-css">' +
              item.startDate +
              " ~ " +
              item.endDate +
              "</p>" +
              '<p class="card-place-css">' +
              item.place +
              "</p>" +
              "</div>" +
              "</div>" +
              "</div>" +
              "</a>" +
              "</div>";
          }

          $(".content-list").append(htmlCode);
        },
      });
    </script>

    <main>
      <div class="wrap">
        <section class="size" id="section1">
          <div class="slider">
            FESTOPIA

            <div class="slide">
              <h1>FESTOPIA</h1>
              <p>Find Seoul's Beat, Dive into FESTOPIA!</p>
            </div>
            <div class="slide">
              <h1>FESTOPIA</h1>
              <p>Find Seoul's Beat, Dive into FESTOPIA!</p>
            </div>
            <div class="slide">
              <h1>FESTOPIA</h1>
              <p>Find Seoul's Beat, Dive into FESTOPIA!</p>
            </div>
          </div>
        </section>

        <section class="size" id="section2">
          <h2><span style="font-size: 2em"> &#128293; </span> 인기 축제</h2>

          <div class="content-list"></div>
        </section>

        <section class="size" id="section3">
          <span style="background: rgb(255, 255, 255); font-size: 2em">
            &#128197;
          </span>
          <h2>이번 달 축제 일정</h2>
        </section>
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
    </main>

    <!-- js 적용 -->
    <script src="/resources/js/index.js"></script>
  </body>
</html>
