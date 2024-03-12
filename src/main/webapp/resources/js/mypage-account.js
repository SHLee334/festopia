


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

$("#checkThisAccount").click(()=>{
  console.log($("#checkThisAccount").val());
  console.log($("#accountCheck").val());
  const result =$("#accountCheck").val().test($("#checkThisAccount").val());
  console.log(result);
  if(result){
    $(".current-pwd-check").css('display','none');
    $("#pwdChangeForm").css('display','block');
  }else{
    $("#wrongTry").text("기존비밀번호를 입력해주세요").css("color","red");
  }
});