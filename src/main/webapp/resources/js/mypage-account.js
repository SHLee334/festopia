// 마우스 접근시 색깔바뀜 효과를 내려고 했으나, 현재 선택중인 nav도 이벤트가 지속적으로 결러서 색상 고정이 안됨.
// 추후 시간있을때 건드려보기
// $(".inneractive0").on("mouseenter mouseleave", (e) => {
//   if (e.type === "mouseenter") {
//     $(".inneractive0").css("color", "#00acee");
//   } else if (e.type === "mouseleave") {
//     $(".inneractive0").css("color", "#888");
//   }
// });
// $(".inneractive1").on("mouseenter mouseleave", (e) => {
//   if (e.type === "mouseenter") {
//     $(".inneractive1").css("color", "#00acee");
//   } else if (e.type === "mouseleave") {
//     $(".inneractive1").css("color", "#888");
//   }
// });
// $(".inneractive3").on("mouseenter mouseleave", (e) => {
//   if (e.type === "mouseenter") {
//     $(".inneractive3").css("color", "#00acee");
//   } else if (e.type === "mouseleave") {
//     $(".inneractive3").css("color", "#888");
//   }
// });

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
