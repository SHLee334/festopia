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

    <!-- 스타일 적용 -->
    <link rel="stylesheet" href="./resources/css/index.css" />

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
        <!-- ========== section1 ========== -->
        <div
              id="carouselExampleFade section1"
              class="carousel slide carousel-fade"
              data-bs-ride="carousel"
            >
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="./resources/resources/bg-3d-balloons.jpeg" class="d-block w-100"/>
                  <h1>FESTOPIA</h1>
                  <p>Find Seoul's Beat, Dive into FESTOPIA!</p>
                </div>
                <div class="carousel-item">
                  <img src="./resources/resources/bg-balloon-column.jpeg" class="d-block w-100"/>
                  <h1>FESTOPIA</h1>
                  <p>Find Seoul's Beat, Dive into FESTOPIA!</p>
                </div>
                <div class="carousel-item">
                  <img src="././resources/resources/bg-3d-flowers2.jpeg" class="d-block w-100"/>
                  <h1>FESTOPIA</h1>
                  <p>Find Seoul's Beat, Dive into FESTOPIA!</p>
                </div>
              </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>

        <!-- ========== section2 ========== -->
        <section class="popular" id="section2">
          <h2><span style="font-size: 2em"> &#128293;</span>인기 축제</h2>
          <div class="popular-festival-list"></div>
        </section>

        <!-- ========== section3 ========== -->
        <section class="calendar" id="section3">
          <h2><span style="background: rgb(255, 255, 255); font-size: 2em">&#128197;</span>이번 달 축제 일정</h2>
          <div id="calendar"></div>
        </section>

      </div>

      <div class="section-btn">
        <a href="#section1">
          <img
            src="./resources/resources/white-cookie1.png"
            alt="Logo"
            width="50"
            height="50"
            class="d-inline-block align-text-top"
          />
        </a>

        <a href="#section2">
          <img
            src="./resources/resources/white-cookie2.png"
            alt="Logo"
            width="50"
            height="50"
            class="d-inline-block align-text-top"
          />
        </a>

        <a href="#section3">
          <img
            src="./resources/resources/white-cookie3.png"
            alt="Logo"
            width="50"
            height="50"
            class="d-inline-block align-text-top"
          />
        </a>
      </div>
    </main>
    <script src="resources/js/index.js"></script>
  </body>
</html>
