// 회원가입시 아이디 중복을 막기위한 로직
//function isDuplicated() {
$("#id").keyup(() => {
  console.log($("#id").val());
  $.ajax({
    type: "post",
    url: "/isDuplicated",
    data: "id=" + $("#id").val(),
    success: function (user) {
      console.log(user.id);
      let id = $("#id").val();
      if (id === user.id) {
        //중복값이 있음
        $("#idCheckSpan2").text("중복된 아이디입니다.").css("color", "red");
        return 3;
      } else if (id === "") {
        $("#idCheckSpan2").text("").css("color", "grey");
        return 2;
      } else {
        $("#idCheckSpan2").text("사용가능 아이디").css("color", "green");
        return 1;
      }
    },
  });
});
//}

function userIdCheck() {
  const regExp = /^[a-zA-Z0-9]{5,20}$/;
  let result = regExp.test($("#id").val());

  if (result === true) {
    return 1;
  } else if ($("#id").val() === "") {
    return 2;
  } else if (result === false) {
    return 3;
  }
}
function nicknameCheck() {
  const regExp = /^.{1,}$/;
  let result = regExp.test($("#nickname").val());
  if (result === true) {
    return 1;
  } else if ($("#nickname").val() === "") {
    return 2;
  } else if (result === false) {
    return 3;
  }
}
function userPwdCheck() {
  const regExp = /^[a-zA-Z0-9]{5,20}$/;
  let result = regExp.test($("#password").val());
  if (result === true) {
    return 1;
  } else if ($("#password").val() === "") {
    return 2;
  } else if (result === false) {
    return 3;
  }
}
function userPwdDoubleCheck() {
  let result = $("#password").val() === $("#passwordCheck").val();
  if (result === true) {
    return 1;
  } else if (result === false) {
    return 3;
  }
}
function userEmailCheck() {
  const regExp = /^\w+@\w+\.\w+$/;
  let result = regExp.test($("#email").val());
  if (result === true) {
    return 1;
  } else if ($("#email").val() === "") {
    return 2;
  } else if (result === false) {
    return 3;
  }
}

function inputHandler(e, check, text) {
  if (check === 1) {
    $(e.target).next().text(text).css("color", "green");
  } else if (check === 2) {
    $(e.target).next().text(text).css("color", "grey");
  } else {
    $(e.target).next().text(text).css("color", "red");
  }
}

// regex 조건들 체크
$("#id").keyup((e) => {
  inputHandler(e, userIdCheck(), "* 영어 대/소문자 5 ~ 20 글자까지 등록 가능");
});

$("#nickname").keyup((e) => {
  inputHandler(e, nicknameCheck(), "* 닉네임은 최소 한글자 이상");
});

$("#password").keyup((e) => {
  inputHandler(e, userPwdCheck(), "* 영어 대/소문자 5 ~ 20 글자까지 등록 가능");
});

$("#passwordCheck").keyup((e) => {
  inputHandler(
    e,
    userPwdDoubleCheck(),
    "* 입력하신 비밀번호와 일치하지않습니다."
  );
});

$("#email").keyup((e) => {
  inputHandler(e, userEmailCheck(), "* 정확한 이메일 양식을 작성해주세요");
});

function validate() {
  if (userIdCheck() !== 1) {
    $("#id").focus();
    return false;
  } else if (isDuplicated() !== 1) {
    $("#id").focus();
    return false;
  } else if (nicknameCheck() !== 1) {
    $("#nickname").focus();
    return false;
  } else if (userPwdCheck() !== 1) {
    $("#password").focus();
    return false;
  } else if (userPwdDoubleCheck() !== 1) {
    $("#passwordCheck").focus();
    return false;
  } else if (userEmailCheck() !== 1) {
    $("#email").focus();
    return false;
  }
  return true; // 모든 조건 완료
}
