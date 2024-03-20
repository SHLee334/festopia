// 페이지 상단 이동 시 top 버튼 숨기기
const topBtn = document.querySelector(".top-btn");
window.addEventListener("scroll", ()=>{
  let scVal = window.scrollY;
  if(scVal === 0) {
    topBtn.style.opacity = 0;
    topBtn.classList.add("active");
  } else {
    topBtn.style.opacity = 1;
    topBtn.classList.remove("active");
  }
})
