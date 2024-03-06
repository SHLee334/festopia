const navIcons = document.querySelectorAll(".searchResult-nav i");
const iList = document.querySelectorAll(".searchResult-nav input");

// 왼쪽으로 이동 버튼(index 0) 설정
navIcon[0].addEventListener("click", function () {
  iList.forEach((input) => {
    input.classList.remove("searchResult-nav-right");
  });
});

// 오른쪽으로 이동 버튼(index 1) 설정
navIcon[1].addEventListener("click", function () {
  iList.forEach((input) => {
    input.classList.add("searchResult-nav-right");
  });
});
