

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
});



/* 캘린더 */

let date = new Date();



const renderCalendar = () => {
    const viewYear = date.getFullYear();
    const viewMonth = date.getMonth();
    
    document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;
    
    const prevLast = new Date(viewYear, viewMonth, 0);
    const thisLast = new Date(viewYear, viewMonth + 1, 0);
    
    const PLDate = prevLast.getDate();
    const PLDay = prevLast.getDay();
    
    const TLDate = thisLast.getDate();
    const TLDay = thisLast.getDay();
    
    const prevDates = [];
    const thisDates = [...Array(TLDate + 1).keys()].slice(1);
    const nextDates = [];
    
    if (PLDay !== 6){
        for (let i = 0; i < PLDay + 1; i++) {
            prevDates.unshift(PLDate - i);
        }
    }
    
    for(let i = 1; i < 7 - TLDay; i++) {
        nextDates.push(i);
    }
    
    const dates = prevDates.concat(thisDates, nextDates);
    const firstDateIndex = dates.indexOf(1);
    const lastDateIndex = dates.lastIndexOf(TLDate);
    
    dates.forEach((date, i) => {
        const condition = i >= firstDateIndex && i < lastDateIndex + 1
                          ? 'this'
                          : 'other';
        dates[i] = `<div class="date"><span class=${condition}>${date}</span></div>`;
    })
    
    document.querySelector('.dates').innerHTML = dates.join('');

    const today = new Date();
    if(viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
        for (let date of document.querySelectorAll('.this')){
            if(+date.innerText === today.getDate()) {
                date.classList.add('today');
                break;
            }
        }
    }

};

renderCalendar();

const prevMonth = () => {
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
}

const nextMonth = () => {
    date.setMonth(date.getMonth() + 1);
    renderCalendar();
}

const goToday = () => {
    date = new Date();
    renderCalendar();
}
