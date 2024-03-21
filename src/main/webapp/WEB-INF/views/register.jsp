<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title></title>
    <link rel="stylesheet" href="../../resources/css/register.css" />
  </head>
  <body>
    <div class="user-register">
      <form action="signUp" method="post" onsubmit="return validate()">
        <div class="form-content">
          <label for="id"> 아이디 </label>
          <div>
            <input
              type="text"
              name="id"
              id="id"
              placeholder="아이디를 입력해주세요"
            />
            <span id="idSpan"></span>
          </div>
        </div>

        <div class="form-content">
          <label for="nickname"> 닉네임 </label>
          <div>
            <input
              type="text"
              name="nickname"
              id="nickname"
              placeholder="닉네임을 입력해주세요"
            />
            <span id="nickSpan"></span>
          </div>
        </div>

        <div class="form-content">
          <label for="password"> 비밀번호 </label>
          <div>
            <input
              type="password"
              name="password"
              id="password"
              placeholder="패스워드를 입력해주세요"
            />
            <span id="pwdSpan"></span>
          </div>
        </div>
        <div class="form-content">
          <label for="passwordCheck">비밀번호 확인</label>
          <div>
            <input
              type="password"
              name="passwordCheck"
              id="passwordCheck"
              placeholder="패스워드를 다시 입력해주세요"
            />
            <span id="pwdCheckSpan"></span>
          </div>
        </div>

        <div class="form-content">
          <label for="email"> 이메일 </label>
          <div>
            <input
              type="text"
              name="email"
              id="email"
              placeholder="이메일을 입력해주세요"
            />
            <span id="emailSpan"></span>
          </div>
        </div>
        <button type="submit" id="regi-button">회원가입</button>
      </form>
    </div>

    <script src="/resources/js/register.js"></script>
  </body>
</html>
