/* ========== 공유 ========== */
// url 클립보드 복사
function clip(){
   var url = '';
   var textarea = document.createElement("textarea");
   document.body.appendChild(textarea);
   url = window.location.href;
   textarea.value = url;
   textarea.select();
   document.execCommand("copy");
   document.body.removeChild(textarea);
};

// url 클립보드 복사 시 토스트
let copyToastMsg = document.getElementById("copy-toast-msg");
let copyBtn = document.getElementById("copyUrl");

function copyToastOn() {
    copyToastMsg.classList.add('active');
    setTimeout(function(){
        copyToastMsg.classList.remove('active');
    }, 2000);
}

copyBtn.addEventListener('click',function(){
    console.log("이벤트 연결 확인");
    copyToastOn()
});
