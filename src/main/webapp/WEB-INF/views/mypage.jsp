<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="../../resources/css/reset.css" />
    <style>
      body {
        height: 100vh;
        border: 1px solid;
        display: flex; /*한페이지에 다 채워줌*/
        flex-direction: column;
      }
      main {
        height: 100%;
        display: flex;
      }
      main > div {
        flex: 1;
      }
      main h2 {
        font-size: 4rem;
        font-weight: bold;
        margin-bottom: 10px;
      }
      .main-left {
        border-right: 1px solid;
        background-image: url(exam.jpg);
        background-position: center;
        background-size: cover;
      }
      .main-right {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
      }
      .main-right p {
        line-height: 1.5;
        width: 80%;
      }
    </style>
    <script
      src="https://kit.fontawesome.com/4602e82315.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <main>
      <div class="main-left"></div>
      <div class="main-right">
        <h2>DAU DUA</h2>
        <p>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus
          repudiandae laboriosam, tenetur ab quo suscipit debitis molestias?
          Deserunt eos, magni blanditiis ratione voluptatum iste quia optio,
          magnam est illum tempora!
        </p>
      </div>
    </main>
  </body>
</html>
