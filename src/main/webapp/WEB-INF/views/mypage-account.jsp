<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %>

  <sec:authentication property="principal" var="user" />

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>FESTOPIA | Find Seoul's Beat, Dive into FESTOPIA!</title>
    <!-- 파비콘 -->
    <link
      rel="icon"
      href="resources/resources/favicon.png"
      type="image/x-icon"
    />
    <link rel="stylesheet" href="../../resources/css/reset.css" />
    <link rel="stylesheet" href="../../resources/css/mypage-account.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  </head>
  <body>
    <div class="tabs">
      <div class="tab-header">
        <div class="inneractive0">개인정보 수정</div>
        <div class="inneractive1">비밀번호 변경</div>
        <div class="inneractive2">회원탈퇴</div>
      </div>

      <div class="tab-content">
        <div class="innercontent0">
          <nav class="pigeon-account">
            <div>
              ${user.userProfileUrl}
              <div id="userImage">
                <img src="/profile/${user.userProfileUrl}" />
              </div>

              <form action="/changeProfile" id="uploadProfile" method="post" enctype="multipart/form-data">
                <input
                  class="form-control"
                  type="file"
                  id="file"
                  name="file"
                />
                <input
                  type="hidden"
                  id="userCode"
                  name="userCode"
                  value="${user.userCode}"
                />
                <button id="uploadThisProfile" type="submit" class="btn btn-outline-warning">
                파일업로드
              </button>
              </form>
              
            </div>
            <div id="userInfo">
              <ul>
                <li id="nameChangeResult">이름 : ${user.nickname}님</li>
                <li id="emailChangeResult">이메일 : ${user.email}</li>
                <li>아이디 : ${user.id}</li>
                <li>회원가입일 : ${user.userEnrollDate}</li>
              </ul>
            </div>
          </nav>

          <div class="modify-second-page" id="content-page">
            <form id="nicknameChangeForm">
              <div>
                <input
                  type="text"
                  name="nickname"
                  id="nicknameChangeInner"
                  value="${user.nickname}"
                  placeholder="변경할 닉네임을 입력하세요"
                />
                <span></span>
              </div>
              <div>
                <input
                  type="text"
                  name="email"
                  id="emailChange"
                  value="${user.email}"
                  placeholder="변경할 이메일을 입력해주세요."
                />
                <span></span>
              </div>
              <div>
                <input type="hidden" name="userCode" value="${user.userCode}" />
                <input type="hidden" name="auth" value="${user.auth}" />
              </div>
              <div>
                <input
                  type="button"
                  value="정보 수정하기"
                  id="nicknameChange"
                />
              </div>
              <span id="nicknameResult"></span>
            </form>
          </div>
        </div>

        <div class="innercontent1">
          <div class="modify-second-page" id="content-page">
            <div class="current-pwd-check">
              <input
                type="password"
                name="password"
                id="accountCheck"
                placeholder="현재 비밀번호를 입력하세요."
              />
              <input type="hidden" id="accountPwdCheck" value="${pwdBind}" />
              <span id="wrongTry"></span>
              <input type="button" id="checkThisAccount" value="확인" />
            </div>
            <form id="pwdChangeForm">
              <div>
                <input
                  type="password"
                  name="password"
                  id="passwordChangeInner"
                  placeholder="변경할 비밀번호를 입력해주세요"
                />
                <span></span>
                <input
                  type="password"
                  name="passwordCheck"
                  id="passwordCheckInner"
                  placeholder="변경할 비밀번호를 한번 더 입력해주세요"
                />
                <span></span>
              </div>

              <div>
                <input type="hidden" name="userCode" value="${user.userCode}" />
                <input type="hidden" name="auth" value="${user.auth}" />
                <input
                  type="button"
                  id="pwdChangeFormButton"
                  value="비밀번호 변경하기"
                />
              </div>
            </form>
          </div>
        </div>

        <div class="innercontent2">
          <div class="modify-second-page" id="content-page">
            회원탈퇴
            <form action="/unableAccount" method="post">
              <div>
                <input
                  type="password"
                  name="password"
                  placeholder="비밀번호를 입력해주세요"
                />
                <input type="hidden" name="pwdCheck" value="${user.password}" />

                <span>인증완료!(패스워드 인증시 뜨는 문자)</span>
                <input type="hidden" name="userCode" value="${user.userCode}" />
                <input type="submit" value="계정삭제" />
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

    <script src="../../resources/js/mypage-account.js"></script>
  </body>
</html>
