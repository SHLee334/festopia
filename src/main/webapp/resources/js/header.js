// 검색 애니메이션
/*=============== SEARCH BAR JS ===============*/

window.addEventListener("DOMContentLoaded", (event) => {
  const toggleSearch = (search, button) => {
    const searchBar = document.getElementById(search),
      searchButton = document.getElementById(button);

    searchButton.addEventListener("click", () => {
      searchBar.classList.toggle("show-search");
    });
  };

  toggleSearch("search-bar", "search-button");

  // searchFilter 보이기
  $(".search__input").click(function () {
    $(".cateFilter").show(500);
  });

  // searchFilter 숨기기
  $("#search-button").click(function () {
    $(".cateFilter").hide(500);
  });
  $(".closeSearchFilter").click(function () {
    $(".cateFilter").hide(500);
  });

  $(".closeAllSearchFilter").click(function () {
    $(".cateFilter").hide(500);
  });

  // datepicker 설정
  $(document).ready(function () {
    $(".datepicker").datepicker({
      dateFormat: "yy-mm-dd", // 표시할 날짜 형식 변경
      showOtherMonths: true,
      showMonthAfterYear: true,
      dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
      dayNames: [
        "일요일",
        "월요일",
        "화요일",
        "수요일",
        "목요일",
        "금요일",
        "토요일",
      ],
      monthNames: [
        "1월",
        "2월",
        "3월",
        "4월",
        "5월",
        "6월",
        "7월",
        "8월",
        "9월",
        "10월",
        "11월",
        "12월",
      ],
      yearSuffix: "년",
      buttonText: "선택",
    });
    $("#startDatepicker").datepicker("setDate", "2020-01-01");
  });
});

function OnSave() {
  var fee_check = document.querySelectorAll(
    'input[name="checkFeeStatus"]:checked'
  ).length;
  if (fee_check == 0) {
    alert("최소 한개의 옵션을 선택");
    return null;
  }
}
