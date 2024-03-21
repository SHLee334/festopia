<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>FESTOPIA | Find Seoul's Beat!</title>
    <!-- 파비콘 -->
    <link
      rel="icon"
      href="resources/resources/favicon.png"
      type="image/x-icon"
    />

    <!-- 스타일 적용 -->
    <link rel="stylesheet" href="../../resources/css/reset.css" />
    <link rel="stylesheet" href="./resources/css/index.css" />

    <!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Kdam+Thmor+Pro&family=Lilita+One&display=swap"
      rel="stylesheet"
    />

    <!-- Full Calendar -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js'></script>
  </head>

  <body>
    <jsp:include page="/header.jsp" />

    <!-- ========== 프로그레스 바 ========== -->
    <div class="progress-bar-container">
      <div class="progress-bar"></div>
    </div>

    <main>
        <!-- ========== 섹션이동 버튼 ========== -->
        <div class="section-btn-container">
          <div class="section-btn">
            <a href="#section1">
              <img src="./resources/resources/white-cookie1.png"/>
            </a>
          </div>
          <div class="section-btn">
            <a href="#section2">
              <img src="./resources/resources/white-cookie2.png"/>
            </a>
          </div>
          <div class="section-btn">
            <a href="#section3">
              <img src="./resources/resources/white-cookie3.png"/>
            </a>
          </div>
        </div>


        <!-- ========== section1 ========== -->
        <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
          <div class="carousel-inner" id="section1">
            <div class="carousel-item active slider1">
              <img src="./resources/resources/bg-3d-balloons.jpeg" class="d-block w-100"/>
              <div class="carousel-inner-text">
                <h1>FESTOPIA</h1>
                <p>Find Seoul's Beat, Dive into FESTOPIA!</p>
              </div>
            </div>
            <div class="carousel-item slider2">
              <img src="./resources/resources/bg-blue-cloud.jpeg" class="d-block w-100"/>
            </div>
            <div class="carousel-item slider3">
              <img src="././resources/resources/bg-3d-flowers2.jpeg" class="d-block w-100"/>
            </div>
          </div>
        </div>


        <!-- ========== section2 ========== -->
        <section class="popular" id="section2">
          <h2>인기 축제</h2>
          <div class="popular-festival-list"></div>
        </section>


        <!-- ========== section3 ========== -->
        <section id="section3">
          <h2>이번 달 축제 일정</h2>
          <div id="calendar"></div>
        </section>
    </main>

        <script>
          $.ajax({
            type: "post",
            url: "/search",
            success: function (list) {
              console.log(list);
              let htmlCode = "";
              for (const item of list) {
                console.log(item);
                htmlCode +=
                  '<a href="/detail?code=' + item.fesCode + ' "class="main-card">' +
                    '<img src=' + item.poster + 'class="main-card-poster">' +
                    '<div class="main-card-body">' +
                      '<p class="main-card-name">' + item.name + '</p>' +
                      '<p class="main-card-date">' + item.startDate + " ~ " + item.endDate + '</p>' +
                      '<p class="main-card-place">' + item.place + '</p>' +
                    '</div>' +
                  '</a>';
              }
              $(".popular-festival-list").append(htmlCode);
            },
          });

          $.ajax({
            type: "get",
            url: "/calendar",
            success: function(list) {
                const calArr = [];
                for(const item of list) {
                    const cal = {
                        "title": item.name,
                        "start": item.startDate,
                        "end": item.startDate
                    }
                    calArr.push(cal);
                }

                var calendarEl = document.getElementById('calendar');

                    var calendar = new FullCalendar.Calendar(calendarEl, {
                      timeZone: 'UTC',
                      initialView: 'dayGridMonth',
                      events: calArr,
                      editable: true,
                      selectable: true,
                      dateClick: function(info) {
                          // alert(info.dateStr);
                          location.href="search?inputFesName=&checkDateSelect=targetStart" +
                                        "&checkStartDate=" + info.dateStr +
                                        "&checkEndDate=&checkFeeStatus=1&checkFeeStatus=2"
                        }
                    });
                    calendar.render();
            }
          });
        </script>


        <script src="resources/js/index.js"></script>
  </body>
</html>
