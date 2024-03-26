// this.$("#tableDetail").click(() => {
//   $.ajax({
//     type: "post",
//     url: "/viewCount",
//     data: $("#countForm").serialize(),
//     success: function (count) {
//       alert("!");
//       console.log(count);
//       this.$("#viewCount").text(count);
//       this.$("#actualCount").text(count);
//     },
//   });
// });

//default
$(".inneractive0").css("color", "rgb(255, 138, 157)");
$(".innercontent0").css("display", "block");
// 첫번째
$(".inneractive0").click(() => {
  $(".innercontent0").css("display", "block");
  $(".innercontent1").css("display", "none");
  $(".innercontent2").css("display", "none");

  $(".inneractive0").css("color", "rgb(255, 138, 157)");
  $(".inneractive1").css("color", "#888");
  $(".inneractive2").css("color", "#888");
});
//두번째
$(".inneractive1").click(() => {
  $(".innercontent1").css("display", "block");
  $(".innercontent0").css("display", "none");
  $(".innercontent2").css("display", "none");

  $(".inneractive1").css("color", "rgb(255, 138, 157)");
  $(".inneractive0").css("color", "#888");
  $(".inneractive2").css("color", "#888");
});
//세번째
$(".inneractive2").click(() => {
  $(".innercontent2").css("display", "block");
  $(".innercontent1").css("display", "none");
  $(".innercontent0").css("display", "none");

  $(".inneractive2").css("color", "rgb(255, 138, 157)");
  $(".inneractive1").css("color", "#888");
  $(".inneractive0").css("color", "#888");
});
