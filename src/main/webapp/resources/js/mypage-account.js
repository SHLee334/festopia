// 유저 정보가 변경즉시 즉각적으로 변할수있도록 ajax로 update 로직 변경
// 닉네임 변경란 로직
$("#nicknameChange").click(() => {
  $.ajax({
    type: "post",
    url: "/updateUserNickname",
    data: $("#nicknameChangeForm").serialize(),

    success: function (user) {
      console.log(user);
      if (user !== null) {
        $("#nameChangeResult").html("이름 : " + `${user.nickname}`);
        $("#emailChangeResult").html("이메일 : " + `${user.email}`);
        location.reload();
      } else {
        alert("뭔가 잘못됐습니다. 다시 시도해주세요.");
      }
      
    },
  });
});

// 비밀번호 바꾸기
$("#pwdChangeFormButton").click(() => {
  $.ajax({
    type: "post",
    url: "/updateUserInfo",
    data: $("#pwdChangeForm").serialize(),
    success: function (data) {
      console.log(data);
      if (data !== null) {
        console.log($("#passwordChangeInner"));
        $(".current-pwd-check").slideDown(200);
        $("#pwdChangeForm").hide();
        $("#wrongTry")
          .text("성공적으로 패스워드를 변경하였습니다!")
          .css("color", "green");
        console.log($("#accountPwdCheck").val($("#passwordChangeInner").val()));
        $("#accountPwdCheck").val($("#passwordChangeInner").val());
        // location.reload();
      }
    },
  });
});

//default
$(".inneractive0").css("color", "#00acee");
$(".innercontent0").css("display", "block");
// 첫번째
$(".inneractive0").click(() => {
  $(".innercontent0").css("display", "block");
  $(".innercontent1").css("display", "none");
  $(".innercontent2").css("display", "none");

  $(".inneractive0").css("color", "#00acee");
  $(".inneractive1").css("color", "#888");
  $(".inneractive2").css("color", "#888");
});
//두번째
$(".inneractive1").click(() => {
  $(".innercontent1").css("display", "block");
  $(".innercontent0").css("display", "none");
  $(".innercontent2").css("display", "none");

  $(".inneractive1").css("color", "#00acee");
  $(".inneractive0").css("color", "#888");
  $(".inneractive2").css("color", "#888");
});
//세번째
$(".inneractive2").click(() => {
  $(".innercontent2").css("display", "block");
  $(".innercontent1").css("display", "none");
  $(".innercontent0").css("display", "none");

  $(".inneractive2").css("color", "#00acee");
  $(".inneractive1").css("color", "#888");
  $(".inneractive0").css("color", "#888");
});

// 개인정보 수정 regExp

function inputHandler(e, check, text) {
  if (check === 1) {
    $(e.target).next().text(text).css("color", "green");
  } else if (check === 2) {
    $(e.target).next().text(text).css("color", "grey");
  } else {
    $(e.target).next().text(text).css("color", "red");
  }
}
// -----------------------------------------
function nicknameCheck() {
  const regExp = /^.{1,}$/;
  let result = regExp.test($("#nicknameChangeInner").val());
  if (result === true) {
    return 1;
  } else if ($("#nicknameChangeInner").val() === "") {
    return 3;
  } else if (result === false) {
    return 3;
  }
}
$("#nicknameChangeInner").keyup((e) => {
  inputHandler(e, nicknameCheck(), "* 닉네임은 최소 한글자 이상");
});

function userEmailCheck() {
  const regExp = /^\w+@\w+\.\w+$/;
  let result = regExp.test($("#emailChange").val());
  if (result === true) {
    return 1;
  } else if ($("#emailChange").val() === "") {
    return 2;
  } else if (result === false) {
    return 3;
  }
}
$("#emailChange").keyup((e) => {
  inputHandler(e, userEmailCheck(), "* 정확한 이메일 양식을 작성해주세요");
});
function infoValidate() {
  if (nicknameCheck() !== 1) {
    $("#nicknameChangeInner").focus();
    return false;
  } else if (userEmailCheck() !== 1) {
    $("#emailChange").focus();
    return false;
  }
  return true;
}
// ------------------------------------------------
// 비밀번호 변경전 비번 한번 더 체크
$(".inneractive1").click(() => {
  $(".current-pwd-check").slideDown(1000);
  $("#pwdChangeForm").hide();
});

$("#checkThisAccount").click(() => {
  let inputPwd = $("#accountCheck").val();
  let defaultPwd = $("#accountPwdCheck").val();
  const result = inputPwd === defaultPwd;
  if (result) {
    $(".current-pwd-check").slideUp(200);
    setTimeout(function () {
      $("#pwdChangeForm").show();

      setTimeout(function () {
        $("#pwdChangeForm").hide();
        $(".current-pwd-check").slideDown(200);
        $("#accountCheck").val("");
        $("#wrongTry")
          .text(
            "제한시간 내 비밀번호를 변경하지 못하였습니다. 다시 비밀번호를 입력하여 진행해주세요."
          )
          .css("color", "red");
      }, 60000);
    }, 500);
  } else {
    $("#wrongTry").text("기존비밀번호를 입력해주세요").css("color", "red");
    $("#accountCheck").val("");
  }
});
// 비밀번호 변경을 위한 regExp
function userPwdCheck() {
  const regExp = /^[a-zA-Z0-9]{5,20}$/;
  let result = regExp.test($("#passwordChangeInner").val());
  if (result === true) {
    return 1;
  } else if ($("#passwordChangeInner").val() === "") {
    return 2;
  } else if (result === false) {
    return 3;
  }
}
$("#passwordChangeInner").keyup((e) => {
  inputHandler(e, userPwdCheck(), "* 영어 대/소문자 5 ~ 20 글자까지 등록 가능");
});

function userPwdDoubleCheck() {
  let result = $("#password").val() === $("#passwordCheck").val();
  if (result === true) {
    return 1;
  } else if (result === false) {
    return 3;
  }
}
$("#passwordCheckInner").keyup((e) => {
  inputHandler(
    e,
    userPwdDoubleCheck(),
    "* 입력하신 비밀번호와 일치하지않습니다."
  );
});

function pwdValidate() {
  if (userPwdCheck() !== 1) {
    $("#passwordChangeInner").focus();
    return false;
  } else if (userPwdDoubleCheck() !== 1) {
    $("#passwordCheckInner").focus();
    return false;
  }
  return true;
}
