<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title></title>
    <link rel="stylesheet" href="../../resources/css/register.css" />

    <!-- ========== 글꼴 ========== -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Lilita+One&family=Dongle&family=Poor+Story&family=Poor+Story&family=Sunflower:wght@300&display=swap"
      rel="stylesheet"
    />
  </head>
  <body>
    <div class="user-register">
      <form action="signUp" method="post" onsubmit="return validate()">
         <div class="id-nickname-wrap wrap">
            <div class="form-content">
              <label for="id"> ID </label>
              <div>
                <input
                  type="text"
                  name="id"
                  id="id"
                  placeholder="Enter your ID"
                />
                <span id="idSpan"></span>
              </div>
            </div>

            <div class="form-content">
              <label for="nickname"> Nickname </label>
              <div>
                <input
                  type="text"
                  name="nickname"
                  id="nickname"
                  placeholder="Enter your Nickname"
                />
                <span id="nickSpan"></span>
              </div>
            </div>
         </div>


         <div class="password-wrap wrap">
            <div class="form-content">
              <label for="password"> Password </label>
              <div>
                <input
                  type="password"
                  name="password"
                  id="password"
                  placeholder="Enter your password"
                />
                <span id="pwdSpan"></span>
              </div>
            </div>
            <div class="form-content">
              <label for="passwordCheck">Password Check</label>
              <div>
                <input
                  type="password"
                  name="passwordCheck"
                  id="passwordCheck"
                  placeholder="Enter your password"
                />
                <span id="pwdCheckSpan"></span>
              </div>
            </div>
         </div>


         <div class="email-btn-wrap wrap">
            <div class="form-content">
              <label for="email"> Email </label>
              <div>
                <input
                  type="text"
                  name="email"
                  id="email"
                  placeholder="Enter your email"
                />
                <span id="emailSpan"></span>
              </div>
            </div>
            <button type="submit" id="regi-button">Let's get started !</button>
         </div>
      </form>
    </div>

    <script src="/resources/js/register.js"></script>
  </body>
</html>

