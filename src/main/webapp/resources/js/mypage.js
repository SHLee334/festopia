const btn = document.querySelectorAll(".account-modify-button");
const account_page = document.querySelectorAll("#main-jsp");

// $(document).ready(function(){
//     $(btn).click(function(){
//         $(account_page).toggle(1000);
//     });
// });


//그냥 버튼이랑 잘 뜨는지 확인 용도
// for(let i=0; i<btn.length;i++){
//     console.log('btn['+i+']' + btn[i]);
// };
// for(let i=0; i<account_page.length; i++){
//     console.log('account_page['+i+']'+ account_page[0]);
// };
let check = true;
function onDisplay(i){
    account_page[i].style.display = "block";
    check = false;
    return check;
};
function offDisplay(i){
    account_page[i].style.display = "none";
    check = true;
    return check;
}


btn[0].addEventListener("click", function(){
    if(check){
        onDisplay(0);
    } else{
        offDisplay(0);
    }
});
btn[1].addEventListener("click", function(){
    if(check){
        onDisplay(1);
    } else{
        offDisplay(1);
    }
});
btn[2].addEventListener("click", function(){
    if(check){
        onDisplay(2);
    } else{
        offDisplay(2);
    }
});