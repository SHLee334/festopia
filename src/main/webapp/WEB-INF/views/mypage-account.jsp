<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
              <div id="userImage">
                <img src="/profile/${user.userProfileUrl}" />
              </div>

              <form
                action="/changeProfile"
                id="uploadProfile"
                method="post"
                enctype="multipart/form-data"
              >
                <div class="filebox">
                  <!-- <input class="upload-name" value="첨부파일" placeholder="첨부파일"> -->
                  <label for="file"><i class="fa-solid fa-camera"></i></label>
                  <input class="form-control" type="file" id="file" name="file"/>
                </div>
                <!-- 이부분이 choose file 부분 -->
                <input
                  type="hidden"
                  id="userCode"
                  name="userCode"
                  value="${user.userCode}"
                />
                <button
                  id="uploadThisProfile"
                  type="submit"
                  class="change-btn"
                >
                <i class="fa-solid fa-pen"></i>
                </button>
              </form>
            </div>
            <div id="userInfo">
              <ul>
                <li id="nameChangeResult">이름 : ${user.nickname}님</li>
                <li id="emailChangeResult">이메일 : ${user.email}</li>
                <li>아이디 : ${user.id}</li>
                <li>
                  회원가입일 :<fmt:formatDate
                    value="${user.userEnrollDate}"
                    pattern="yyyy-MM-dd"
                  />
                </li>
              </ul>
            </div>
          </nav>

          <div class="modify-second-page" id="content-page">
            <form id="nicknameChangeForm">
              <div id="changeNickForm">
                <input
                  type="text"
                  name="nickname"
                  id="nicknameChangeInner"
                  value="${user.nickname}"
                  placeholder="변경할 닉네임을 입력하세요"
                />
                <span></span>
              </div>
              <div id="changeMailForm">
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
                <button
                  type="button" 
                  id="nicknameChange"
                >정보 수정하기</button>
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
              <div id="innerPwdChangeForm">
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

                <input type="hidden" name="userCode" value="${user.userCode}" />
                <input type="hidden" name="auth" value="${user.auth}" />
                <button
                  type="button"
                  id="pwdChangeFormButton"
                > 비밀번호변경하기</button>     
              </div>
            </form>
          </div>
        </div>

        <div class="innercontent2">
          <div class="modify-second-page " id="content-page">
      
            <div class="unableAccountContainer">
              
              <input
                type="password"
                name="password"
                id="accountCheck_delete"
                placeholder="현재 비밀번호를 입력하세요."
              />
                <input type="hidden" id="accountPwdCheck_delete" value="${pwdBind}" />
                <span id="deleteTry"></span>
              
            
                <form action="/unableAccount" method="post" id="goodbye">
                <input type="hidden" name="userCode" id="goodbyeCheck" value="${user.userCode}" />
                <button type="submit" id="deleteThisAccount">계정삭제</button>
              
              </form>
          </div>      
          </div>
        </div>
      </div>
    </div>

    <script src="../../resources/js/mypage-account.js"></script>
  </body>
</html>
