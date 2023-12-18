const reservationValue = {}

function init(result){
    drawAssetsList(result.assetsList);
}


// 현재 날짜로 초기화
let currentDate = new Date();
updateCalendarTitle(currentDate);

//화면 상단 날짜 보여주기
function updateCalendarTitle(date) {
    let year = date.getFullYear();
    let month = String(date.getMonth() + 1).padStart(2, '0');
    let day = String(date.getDate()).padStart(2, '0');

    document.getElementById('calendar-title').innerText = year + '-' + month + '-' + day;
    document.getElementById("startDate").value = year + '-' + month + '-' + day; 
    document.getElementById("endDate").value = year + '-' + month + '-' + day;
}
//화면 상단 날짜 전날로 이동
function backCalendarDate() {
    let calendarTitle = document.getElementById("calendar-title");
    let currentDate = new Date(calendarTitle.textContent);

    let yesterday = new Date(currentDate); // 어제 날짜를 담을 변수 생성
    yesterday.setDate(currentDate.getDate() - 1); // 어제 날짜 설정

    updateCalendarTitle(yesterday);
}
//화면 상단 날짜 다음날로 이동
function frontCalendarDate() {
    let calendarTitle = document.getElementById("calendar-title");
    let currentDate = new Date(calendarTitle.textContent);

    let tomorrow = new Date(currentDate); // 다음날 날짜를 담을 변수 생성
    tomorrow.setDate(currentDate.getDate() + 1); // 다음날 날짜 설정

    updateCalendarTitle(tomorrow);
}

//취소버튼 누르면 모달창 끄기
function executeCloseButton2() {
    var closeButton = document.getElementById("close-btn2");
    closeButton.click();
}

//재물예약판 그려주기
function drawAssetsList(assetsList){
    const assetsBody = document.querySelector(".reservation-graph > .graph-body > .graph-body-list");

    // console.log(assetsList)
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

//예약시간 나타내는 div들 드래그 이벤트
function timeUnitAddDragEvent(timeUnit, asset, time){
    //한칸만 선택할땐 클릭이벤트임
    timeUnit.addEventListener("click", function () {
        reservationValue.clickUnit = {
            ...asset,
            time
        }

        // console.log(reservationValue)
        // console.log(reservationValue.clickUnit.assName)

        document.getElementById("reservation-btn").click();
        document.getElementById("assetName").value = reservationValue.clickUnit.assName; 
    });
    //두칸부터 드래그 이벤트
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
      document.getElementById("reservation-btn").click();
      document.getElementById("assetName").value = reservationValue.endUnit.assName;
      //값을 사용

      
      reservationValue.clickUnit = {};
      reservationValue.endUnit = {};
      reservationValue.startUnit = {};
    });
}
