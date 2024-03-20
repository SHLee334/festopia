<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>FESTOPIA | Find Seoul's Beat, Dive into FESTOPIA!</title>
    <!-- 파비콘 -->
    <link rel="icon" href="resources/resources/favicon.png" type="image/x-icon" />

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
      crossorigin="anonymous" />
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>

    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/4602e82315.js" crossorigin="anonymous"></script>
  </head>

  <body>
    <sec:authentication var="user" property="principal" />

    <jsp:include page="/header.jsp" />

    <div class="fes-detail">

      <!-- ========== 축제정보 카드 ========== -->
      <div class="fes-detail-card">
        <img src="${vo.poster}" class="detail-poster" />
        <div class="detail-info">
          <h5 class="detail-category">${vo.category}</h5>
          <h5 class="detail-name">${vo.name}</h5>
          <p class="detail-date">${vo.startDate} ~ ${vo.endDate}</p>
          <p class="detail-place">${vo.place}</p>
          <p class="detail-fee">${vo.fee}</p>

          <!-- 찜 -->
          <c:choose>
            <c:when test="${empty favorite}">
              <h5><i class="fa-solid fa-heart" id="addFav"></i></h5>
            </c:when>
            <c:otherwise>
              <h5><i class="fa-solid fa-heart" id="delFav"></i></h5>
              <script>
                console.log(${favorite.fvCode});
                   $("#delFav").click(() => {
                     $.ajax({
                       type: 'post',
                       url: '/delFav',
                       data: 'code=' + ${favorite.fvCode},
                       success: function (data) {
                         location.reload();
                       }
                     });
                   });
              </script>
            </c:otherwise>
          </c:choose>
          <script>
            $('#addFav').click(() => {
              $.ajax({
                  type: 'post',
                  url: '/addFav',
                  data: 'code=' + ${vo.fesCode},
                  success: function(data) {
                      location.reload();
                      alert("찜 추가");
                  }
              });
            });
          </script>

          <!-- 공유(클립보드) -->
          <div id="copy-toast-msg">❤️ url이 복사 되었습니다 ❤️</div>
          <h5>
            <i class="fa-solid fa-arrow-up-from-bracket" id="copyUrl" onclick="clip()"></i>
          </h5>

        </div>
      </div>

    <hr>

      <!-- ========== 맵 ========== -->
      <div class="fes-detail-map">
        <h4>축제 위치</h4>

        <div id="map"></div>
        <script
          type="text/javascript"
          src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e14271e9bb22881d526647d971ad171"
        ></script>
        <script>
          var container = document.getElementById('map');
          var options = {
              center: new kakao.maps.LatLng(${vo.lot}, ${vo.lat}),
              level: 3
          };

          var map = new kakao.maps.Map(container, options);

          var imageSrc = "resources/resources/red-pin.png",
              imageSize = new kakao.maps.Size(54, 59),
              imageOption = {offset: new kakao.maps.Point(27, 69)};

          var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
              markerPosition = new kakao.maps.LatLng(${vo.lot}, ${vo.lat});

          var marker = new kakao.maps.Marker({
              position: markerPosition,
              image: markerImage
          });

          marker.setMap(map);
        </script>
      </div>


      <!-- ========== 댓글 ========== -->
      <div class="commentZone">
        <div id="inputCom">
          <p>댓글 입력</p>
          <form action="/writeCom" method="post">
            <textarea rows="5" cols="30" name="comText"></textarea>
            <input type="hidden" name="fesCode" value="${vo.fesCode}" /> <input
              type="submit" id="sendCom" value="댓글 달기" />
          </form>
        </div>
    
        <div>
          <h6>댓글 목록</h6>
          <c:forEach items="${com}" var="item">
            <div id="comWriterInfo">
              <strong>${item.user.nickname}</strong> <span> | </span> <span>${item.comDate}</span>
              <c:choose>
                <c:when test="${user ne 'anonymousUser'}">
                  <c:choose>
                    <c:when test="${item.userCode eq user.userCode}">
                      <i class="fa-solid fa-trash-can delCom" data-value="${item.comCode}"></i>
                    </c:when>
                  </c:choose>
                </c:when>
              </c:choose>
            </div>
            <p>${item.comText}</p>
            <hr>
          </c:forEach>
    
          <script>
                $('.delCom').each(function() {
                    $(this).click(function() {
                        $.ajax({
                            type: 'post',
                            url: '/delCom',
                            data: 'comCode=' + $(this).attr('data-value'),
                            success: function(data) {
                              location.reload();
                            }
                          });
                    });   
                 });
                </script>
        </div>
      </div>

      <script src="../../resources/js/festivalDetail.js"></script>
    </div>
  </body>
</html>
