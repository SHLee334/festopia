<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <body>
    <h1>회원가입 세션</h1>
    <form action="signUp" method="post" onsubmit="return validate()">
      <div>
        <input
          type="text"
          name="id"
          id="id"
          placeholder="아이디를 입력해주세요"
        />
        <span id="idCheckSpan"></span>
        <input type="button" id="idCheck" value="아이디 중복확인" />
      </div>
      <div>
        <input
          type="text"
          name="nickname"
          id="nickname"
          placeholder="닉네임을 입력해주세요"
        />
        <span></span>
      </div>
      <div>
        <input
          type="password"
          name="password"
          id="password"
          placeholder="패스워드를 입력해주세요"
        />
        <span></span>
      </div>
      <div>
        <input
          type="password"
          name="passwordCheck"
          id="passwordCheck"
          placeholder="패스워드를 다시 입력해주세요"
        />
        <span></span>
      </div>
      <div>
        <input
          type="text"
          name="email"
          id="email"
          placeholder="이메일을 입력해주세요"
        />
        <span></span>
      </div>
      <div><input type="submit" value="회원가입" /></div>
    </form>

    <script src="../../resources/js/register.js"></script>
  </body>
</html>
