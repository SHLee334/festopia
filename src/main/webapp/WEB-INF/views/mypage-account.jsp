<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="sec"
uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
  <sec:authentication property="principal" var="user" />
</sec:authorize>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>FESTOPIA | Find Seoul's Beat, Dive into FESTOPIA!</title>
    <!-- 파비콘 -->
    <link rel="icon" href="resources/resources/favicon.png" type="image/x-icon" />
    <link rel="stylesheet" href="../../resources/css/reset.css" />
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <style>
      * {
        box-sizing: border-box;
      }
      body{
        background: white;
      }
      .tabs .tab-header {
        float: left;
        width: 180px;
        height: 80vh;
        border-right: 1px solid #ccc; /*nav쪽 줄*/
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
      }
      .tabs .tab-header > div {
        height: 50px;
        line-height: 50px;
        font-size: 16px;
        font-weight: 600;
        color: #888;
        cursor: pointer;
        padding-left: 10px;
      }
      .tabs .tab-header div i {
        display: inline-block;
        margin-left: 10px;
        margin-right: 5px;
      }
      .tabs .tab-content {
        position: relative;
        height: 100%;
        overflow: hidden;
      }
      .tabs .tab-content > div > i {
        display: inline-block;
        width: 50px;
        height: 50px;
        background: #555;
        color: #f5f5f5;
        font-size: 25px;
        font-weight: 600;
        text-align: center;
        line-height: 50px;
        border-radius: 50%;
      }
      .tabs .tab-content > div {
        display: none;
        /* position: absolute; */
        text-align: center;
        padding: 40px 20px;
        /* top: -200%; */
        transition: all 500ms ease-in-out;
      }
      .tabs .tab-content > div.active {
        top: 0px;
      }
      .pigeon-account{
        display: flex;
        align-items: center;
        background-color: beige;
        height: 20rem;
      }
      #userImage{
        border-radius: 50%;
        border: 1px solid #888;
        background-color: none;
        width: 200px;
        height: 200px;
        overflow: hidden;
        margin-left: 50px;
        cursor: pointer;
        flex-shrink: 0;
      }
      #userInfo{
        text-align: left;
        margin-left: 100px;
        line-height: 50px;
      }
    </style>
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
            <div id="userImage"></div>
            <div id="userInfo">
              <ul>
                <li>이름 : ${user.nickname}님</li>
                <li>이메일 : ${user.email}</li>
                <li>아이디 : ${user.id}</li>
              </ul> 
            </div>
            
          </nav>

          <div class="modify-second-page" id="content-page" >
            닉네임 슬라이드 변경
            ${user}
            <form action="/updateUserNickname" method="post">
              <div><span>현재 닉네임 : ${user.nickname}</span></div>
              <div><input type="text" name="nickname" placeholder="변경할 닉네임을 입력하세요" /> </div>
              <div><input type="hidden" name="userCode" value="${user.userCode}" /></div>
              <div><input type="submit" value="아이디 변경하기" /></div>
            </form>
          </div>
        </div>

        <div class="innercontent1">
          <div class="modify-second-page" id="content-page" >
            pwd / email변경 슬라이드
            <form action="updateUserInfo" method="post">
              <div>
                <input type="password" name="password" placeholder="변경할 비밀번호를 입력해주세요"/>
                <input type="password" name="passwordCheck" placeholder="변경할 비밀번호를 한번 더 입력해주세요"/>
                <span>비밀번호 동일한거 확인 완료 라고 띄우기</span>	
              </div>
              <div>
                <input type="text" name="email" value="${user.email}" placeholder="변경할 이메일을 입력해주세요.">
              </div>
              <div>
                <input type="hidden" name="userCode" value="${user.userCode}" />
                <input type="submit" value="계정정보 변경하기">
              </div>
            </form>
          </div>
        </div>

        <div class="innercontent2">
          <div class="modify-second-page" id="content-page" >회원탈퇴
            <form action="/unableAccount" method="post">
              <div>
                <input type="password" name="password" placeholder="비밀번호를 입력해주세요" />
                <input type="hidden" name="pwdCheck" value="${user.password}">
                <c:if test="">
                  <span>인증완료!(패스워드 인증시 뜨는 문자)</span>
                  <input type="submit" value="계정삭제">	
                </c:if>
              </div>
            </form>
            account-second-page의 크기는 buttion3개 다 합한거랑 같은 사이즈 
        </div>
        </div>
      </div>
    </div>

    


    <script src="../../resources/js/mypage-account.js">
    </script>
  </body>
</html>
