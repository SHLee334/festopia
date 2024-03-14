window.addEventListener("DOMContentLoaded", (event) => {
  // top bar scroll event
  const barElem = document.querySelector(".progress-bar");
  let maxScrollValue;

  function resizeHandler() {
    // 전체 스크롤 할 수 있는 범위
    maxScrollValue = document.body.offsetHeight + window.innerHeight; // 바디 전체 높이 - 윈도우의 높이 (현재 창)
  }

  window.addEventListener("scroll", function () {
    let scrollPer = window.scrollY / maxScrollValue; // 이중에 얼마나 스크롤을 했는지 비율을 ..! 1로 떨어짐 해당 % 보여주기
    barElem.style.width = scrollPer * 100 + "%";
  });
  window.addEventListener("resize", resizeHandler);
  resizeHandler();

  // menu click event
  const nav = document.querySelector("#btnPac");
  let currentNav;

  function navHandler(e) {
    if (currentNav) {
      currentNav.classList.remove("nav-active");
    }
    e.target.classList.add("nav-active");
    currentNav = e.target;
  }

  nav.addEventListener("click", navHandler);

  // section - 높이 확인해서 event 구현.. 여러가지 이벤트가 들어가는 상황
  // section2에만 적용해보기!
  const section1 = document.querySelector("#section1");
  const section2 = document.querySelector("#section2");
  const section3 = document.querySelector("#section3");

  let currentSection = section1;

  window.addEventListener("wheel", function (event) {
    if (event.deltaY > 0) {
      // 휠을 아래로 내린 경우
      if (currentSection === section1) {
        window.scrollTo({ top: section2.offsetTop, behavior: "smooth" });
        currentSection = section2;
      } else if (currentSection === section2) {
        window.scrollTo({ top: section3.offsetTop, behavior: "smooth" });
        currentSection = section3;
      }
    } else {
      // 휠을 위로 올린 경우
      if (currentSection === section3) {
        window.scrollTo({ top: section2.offsetTop, behavior: "smooth" });
        currentSection = section2;
      } else if (currentSection === section2) {
        window.scrollTo({ top: section1.offsetTop, behavior: "smooth" });
        currentSection = section1;
      }
    }
  });

  window.addEventListener("scroll", function () {
    if (section2.getBoundingClientRect().top === 0) {
      // 휠 로직이 있을 때가 딱 떨어짐
      console.log("here!!!");
      console.log(section2.children[0]);

      section2.children[0].classList.add("text-animation");
    } else {
      section2.children[0].classList.remove("text-animation");
    }
  });
});
