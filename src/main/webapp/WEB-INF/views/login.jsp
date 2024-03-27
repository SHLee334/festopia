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
        <label for="login">ID</label>
        <div>
          <input
            type="text"
            name="username"
            placeholder="Please enter your ID"
          />
        </div>
      </div>
      <div class="login-content">
        <label for="pwd">Password</label>
        <div>
          <input
            type="password"
            name="password"
            id="loginPassword"
            placeholder="Please enter your password"
          />
        </div>
      </div>
      <div>
        <span>${requestScope.loginFail}</span>
        <input type="submit" value="Log in" id="bindPwd" />
        <button type="button" id="sugestSingUp">Create account</button>
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

