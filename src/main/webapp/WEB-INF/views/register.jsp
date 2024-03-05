<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>FESTOPIA | Find Seoul's Beat, Dive into FESTOPIA!</title>
	<!-- 파비콘 -->
	<link rel="icon" href="resources/resources/favicon.png" type="image/x-icon" />
  </head>
  <body>
    <h1>회원가입 세션</h1>
    <form action="signUp" method="post">
      <div>
        <input type="text" name="id" placeholder="아이디를 입력해주세요" />
      </div>
      <div>
      	<input type="text" name="nickname" placeholder="넥네임을 입력해주세요" />
      </div>
      <div>
        <input
          type="password"
          name="password"
          placeholder="패스워드를 입력해주세요"
        />
      </div>
      <div>
        <input
          type="password"
          name="passwordCheck"
          placeholder="패스워드를 다시 입력해주세요"
        />
      </div>
      <div>
        <input type="text" name="email" placeholder="이메일을 입력해주세요" />
      </div>
      <div><input type="submit" value="회원가입" /></div>
    </form>
  </body>
</html>
