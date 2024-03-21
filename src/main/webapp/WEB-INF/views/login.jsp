<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title></title>
    <link rel="stylesheet" href="../../resources/css/login.css" /> 
  </head>
  <body>
    <form action="/login" method="post" id="login-form">
      <div class="login-content">
        <label for="login">로그인</label>
        <div>
        <input
          type="text"
          name="username"
          placeholder="아이디를 입력해주세요"
        />
      </div>
      </div>
      <div class="login-content">
        <label for="pwd">비밀번호</label>
        <div>
        <input
          type="password"
          name="password"
          id="loginPassword"
          placeholder="패스워드를 입력해주세요"
        />
      </div>
      </div>
      <div>
        <span>${requestScope.loginFail}</span>
        <input type="submit" value="로그인" id="bindPwd" />
        <button type="button" id="sugestSingUp" >뭐요? 회원이 아니라고??</button>
      </div>
    </form>
   

    <script>
      $("#bindPwd").click(() => {
        $.ajax({
          type: "post",
          url: "/bindPwd",
          data: "pwd=" + $("#loginPassword").val(),
        });
      });
    </script>
  </body>
</html>
