const reservationValue = {}

function init(result){
    drawAssetsList(result.assetsList);
}


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

//드래그 했을 때 초록색으로 색칠해주는 기능
document.querySelectorAll("#selectable .graph-body-hour").forEach(function (element) {
    let elements;// 처음 드래그 시작되는 div부터 마지막 드래그된 div까지 담은 배열
    
    element.addEventListener("click", function () {
        element.setAttribute('data-bs-toggle', 'modal');
        element.setAttribute('data-bs-target', '#reservationModal');
        element.click();
    });

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
        
        //elements[0].value //여기서 예약 모달 안에 첫시간 막시간 넣어주기
    });
});

function getElementsBetween(start, end) {
    var elements = [];
    var currentElement = start; // 시작 요소의 다음 요소부터 반복

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



//재물예약판 그려주기
function drawAssetsList(assetsList){
    const assetsBody = document.querySelector(".reservation-graph > .graph-body > .graph-body-list");

    console.log(assetsList)
    for(const asset of assetsList) {
        const assetZone = document.createElement('div');
        assetZone.className = 'graph-row';

        const titleZone = document.createElement('div');
        titleZone.className = 'graph-body-title';
        titleZone.innerHTML = asset.assName;
        assetZone.appendChild(titleZone);

        for(let i = 0; i < 24; i++) {
            const hour = (i < 10 ? ('0' + i) : i); 
            const timeUnit00 = document.createElement('div');
            timeUnit00.className = 'graph-body-hour';
            assetZone.appendChild(timeUnit00);
            timeUnitAddDragEvent(timeUnit00, asset, hour + ":00");

            const timeUnit30 = document.createElement('div');
            timeUnit30.className = 'graph-body-hour';
            assetZone.appendChild(timeUnit30);
            timeUnitAddDragEvent(timeUnit30, asset, hour + ":30");
        }
        assetsBody.appendChild(assetZone);
    }
}

function timeUnitAddDragEvent(timeUnit, asset, time){
    timeUnit.addEventListener("click", function () {
        reservationValue.clickUnit = {
            ...asset,
            time
        }

        console.log(reservationValue)
    });

    timeUnit.addEventListener("mousedown", function () {
       //div하나만들어 클릭한곳에 그려주고 
       //div에는 시간을 좀 나타내줘야겠다.
       reservationValue.startUnit = {
            ...asset,
            time
        }
        console.log(reservationValue)
    });

    timeUnit.addEventListener("mouseenter", function () {
       //div에 표시된 시간을 변경해줘야겠다.
       if (reservationValue.startUnit && reservationValue.startUnit.assNo === asset.assNo){
            reservationValue.endUnit = {
                ...asset,
                time
            }
            console.log(reservationValue);
       }
    });

    timeUnit.addEventListener("mouseup", function () {
      //드래그했던 시간정보들을 가지고 모달에 넘겨주면 되겠다

      //값을 사용

      
      reservationValue.clickUnit = {};
      reservationValue.endUnit = {};
      reservationValue.startUnit = {};
    });
}
