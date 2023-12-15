// 현재 날짜로 초기화
let currentDate = new Date();
updateCalendarTitle(currentDate);

function updateCalendarTitle(date) {
    let year = date.getFullYear();
    let month = String(date.getMonth() + 1).padStart(2, '0');
    let day = String(date.getDate()).padStart(2, '0');

    document.getElementById('calendar-title').innerText = year + '-' + month + '-' + day;
}

function backCalendarDate() {
    let calendarTitle = document.getElementById("calendar-title");
    let currentDate = new Date(calendarTitle.textContent);

    let yesterday = new Date(currentDate); // 어제 날짜를 담을 변수 생성
    yesterday.setDate(currentDate.getDate() - 1); // 어제 날짜 설정

    updateCalendarTitle(yesterday);
}

function frontCalendarDate() {
    let calendarTitle = document.getElementById("calendar-title");
    let currentDate = new Date(calendarTitle.textContent);

    let tomorrow = new Date(currentDate); // 다음날 날짜를 담을 변수 생성
    tomorrow.setDate(currentDate.getDate() + 1); // 다음날 날짜 설정

    updateCalendarTitle(tomorrow);
}

//스크롤 바 없애는 기능  
window.addEventListener("DOMContentLoaded", function () {
    var graphBody = document.querySelector(".graph-body");
    graphBody.style.overflow = "hidden";
});

//드래그 했을 때 초록색으로 색칠해주는 기능
document.querySelectorAll("#selectable .graph-body-hour").forEach(function (element) {
    let elements;// 처음 드래그 시작되는 div부터 마지막 드래그된 div까지 담은 배열
    element.addEventListener("mousedown", function () {
        //ui-selecting-start 지워주기 -- 
        isDragging = true; // 드래그 중임을 나타내는 변수를 true로 설정
        startElement = this; // 시작 요소로 현재 요소를 할당
        this.classList.add("ui-selecting-start"); // 현재 요소에 ui-selecting 클래스 추가

    });

    element.addEventListener("mouseenter", function () {
        if (isDragging) {
            let endElement = this; // 종료 요소로 현재 요소를 할당
            elements = getElementsBetween(startElement, endElement); // 시작 요소와 종료 요소 사이의 모든 요소를 가져옴
            elements.forEach(function (el) {
                el.classList.add("ui-selecting"); // 가져온 요소들에 ui-selecting 클래스 추가
            });
        }
        
    });

    element.addEventListener("mouseup", function () {
        isDragging = false; // 드래그 중이 아님을 나타내는 변수를 false로 설정
        elements[elements.length -1 ].id = 'myInput';
        elements[elements.length -1 ].setAttribute('data-bs-toggle', 'modal');
        elements[elements.length -1 ].setAttribute('data-bs-target', '#reservationModal');
        elements[elements.length -1 ].click();
        document.getElementById("reservation-time-start").value = document.querySelector(".ui-selecting-start").value;
        //elements[0].value //여기서 예약 모달 안에 첫시간 막시간 넣어주기
        
    });
});

function getElementsBetween(start, end) {
    var elements = [];
    var currentElement = start.nextElementSibling; // 시작 요소의 다음 요소부터 반복

    while (currentElement !== end) { // 현재 요소가 종료 요소와 같지 않을 때까지 반복
        elements.push(currentElement); // 요소를 배열에 추가
        currentElement = currentElement.nextElementSibling; // 다음 요소로 이동
    }

    elements.push(end); // 종료 요소를 배열에 추가

    return elements; // 배열 반환
}

//취소버튼 누르면 모달창 끄기
function executeCloseButton2() {
    var closeButton = document.getElementById("close-btn2");
    closeButton.click();
}

