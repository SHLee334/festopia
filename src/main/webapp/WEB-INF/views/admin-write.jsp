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
    <!-- ========== 글꼴 ========== -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Dongle&family=Poor+Story&family=Poor+Story&family=Sunflower:wght@300&display=swap"
      rel="stylesheet"
    />
  </head>
  <style>
    .write-container {
      display: flex;
      flex-direction: column;
    }
    .write-group {
      border-top: 1px solid grey;
      /* background-color: red; */
      width: 100%;
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
      width: 100%;
      display: flex;
      justify-content: end;
      align-items: center;
    }
    .end-container label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-right: 20px;
    border-radius: 10px;
  }
  .end-container input[type="file"]{
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
  }
  .image_container{
    width: 300px;
    height: 300px;
    display: none;
    border: 1px solid grey;
    border-radius: 10px;
  }
  #image_container img{
    max-width: 80%;
    border: 1px solid grey;
    border-radius: 10px;
  }
  /* 버튼 */
  .write-submit{
    border: none;
    cursor: pointer;
    width: 100px;
    color: white;
    background-color: rgb(255, 138, 157);
    padding: 10px;
    font-size: 1.2rem;
    font-weight: bold;
    border-radius: 10px;
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
          <!-- <div id="editor" contenteditable="true" class="write-control" name="noticeContent" ></div> -->
          <textarea
            class="write-control"
            rows="10"
            name="noticeContent"
            placeholder="본문글을 입력해주세요."
          ></textarea>
        </div>
        
        <div class="end-container">
          
            <label for="writeFile" id="inputImg"><i class="fa-solid fa-camera" ></i></label>
            <input
              class="write-input"
              type="file"
              id="writeFile"
              name="file"
              accept="image/*"
              onchange="setThumbnail(event);"
            />
          
          <!-- 버튼 등록 -->
          <button type="submit" class="write-submit">등록</button>
          
        </div>
        <div id="image_container"></div>
      </form>
    </div>
    
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

      $("#inputImg").on({
        mouseenter: ()=>{
          $("#image_container").show();
        },
        mouseleave: ()=>{
          $("#image_container").hide();
        },
      }
      )
    </script>
  </body>
</html>
