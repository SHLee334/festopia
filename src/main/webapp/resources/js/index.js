// scroll event
window.addEventListener('scroll', function() {
    // console.log(`pageYOffset : ${window.pageYOffset}`); // deprecated
    // console.log(`scrollY : ${window.scrollY}`);
    // 문서객체.offsetTop <-- 처음 해당 하는 요소의 위치만 가져오니 불편
    // 문서객체.getBoundingClientReact().top <-- 해당 하는 걸로 계속 위치를 알 수 있음
});


// top bar scroll event
const barElem = document.querySelector('.progress-bar');
let maxScrollValue;

function resizeHandler() {
    // 전체 스크롤 할 수 있는 범위
    maxScrollValue = document.body.offsetHeight - window.innerHeight; // 바디 전체 높이 - 윈도우의 높이 (현재 창)
}

window.addEventListener('scroll', function() {
    const scrollPer = window.scrollY / maxScrollValue; // 이중에 얼마나 스크롤을 했는지 비율을 ..! 1로 떨어짐 해당 % 보여주기
    barElem.style.width = scrollPer * 100 + '%';
});
window.addEventListener('resize', resizeHandler);
resizeHandler();