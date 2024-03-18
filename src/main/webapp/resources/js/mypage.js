$("#button01").click(() => {
  $("#main-jsp1").toggle();
  $("#main-jsp2").css("display", "none");
  $("#main-jsp3").css("display", "none");
  $("#admin-jsp").css("display", "none");
});
$("#button02").click(() => {
  $("#main-jsp2").toggle();
  $("#main-jsp1").css("display", "none");
  $("#main-jsp3").css("display", "none");
});
$("#button03").click(() => {
  $("#main-jsp3").toggle();
  $("#main-jsp2").css("display", "none");
  $("#main-jsp1").css("display", "none");
});
$("#button04").click(() => {
  $("#admin-jsp").toggle();
  $("#main-jsp1").css("display", "none");
});
