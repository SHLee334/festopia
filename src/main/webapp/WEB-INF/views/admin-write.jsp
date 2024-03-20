<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="user" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Insert title here</title>
  </head>
  <style>
    .write-container {
      display: flex;
      flex-direction: column;
    }
    .write-group {
      border-top: 1px solid grey;
      /* background-color: red; */
      width: 75%;
    }
    .write-control {
      /* background-color: red; */
      width: 100%;
      margin-top: 10px;
      margin-bottom: 10px;
    }
    #top-title {
      border-top: 3px solid;
    }
    #main-notice {
      font-size: 2rem;
      padding-bottom: 15px;
      text-align: left;
    }
    #file {
      display: flex;
      align-items: center;
    }
    .end-container {
      width: 75%;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    #image_container {
      width: 200px;
      height: 200px;
    }
  </style>
  <body>
    <div class="write-container">
      <h1 id="main-notice">공지사항 등록</h1>
      <form action="/noticeWrite" method="post" enctype="multipart/form-data">
        <input type="hidden" name="userCode" value="${user.userCode}" />

        <!-- 제목 부분 -->
        <div class="write-group" id="top-title">
          <input
            class="write-control"
            name="noticeTitle"
            placeholder="제목을 입력해주세요"
          />
        </div>

        <!-- 쓰는 곳 -->
        <div class="write-group">
          <textarea
            class="write-control"
            rows="10"
            name="noticeContent"
            placeholder="본문글을 입력해주세요."
          ></textarea>
        </div>
        <div class="end-container">
          <input
            class="write-input"
            type="file"
            id="file"
            name="file"
            accept="image/*"
            onchange="setThumbnail(event);"
          />
          <!-- 버튼 등록 -->
          <button type="submit" class="btn btn-outline-warning">등록</button>
        </div>
      </form>
    </div>
    <div id="image_container"></div>
    <script>
      function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function (event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
      }
    </script>
  </body>
</html>
