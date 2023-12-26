const reservationValue = {}
function init(result, loginUser){
    reservationValue.loginUser = loginUser;
    drawAssetsList(result.assetsList);
    drawReservationsList(result.reservationListPi);
    drawReservationDiv(result.reservationList, reservationValue.loginUser)
}

// 현재 날짜로 초기화
let currentDate = new Date();
updateCalendarTitle(currentDate);
function goToday(){
    updateCalendarTitle(currentDate);
    
}
//화면 상단 날짜 보여주기
function updateCalendarTitle(date) {
    let year = date.getFullYear();
    let month = String(date.getMonth() + 1).padStart(2, '0');
    let day = String(date.getDate()).padStart(2, '0');

    document.getElementById('calendar-title').innerText = year + '-' + month + '-' + day;
    //모달안에 예약 날짜 표시하기
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
            timeUnit00.value = hour + ":00";
            assetZone.appendChild(timeUnit00);
            timeUnitAddDragEvent(timeUnit00, asset, hour + ":00");

            const timeUnit30 = document.createElement('div');
            timeUnit30.className = 'graph-body-hour';
            timeUnit30.value = hour + ":30";
            assetZone.appendChild(timeUnit30);
            timeUnitAddDragEvent(timeUnit30, asset, hour + ":30");
        }
        assetsBody.appendChild(assetZone);
    }
}

//내 예약내역 그려주기

function drawReservationsList(reservationListPi){
    const reservationBody = document.querySelector(".reservation-status > .reservation-status-table tbody");
    
    for(const reservation of reservationListPi) {
        let tr = document.createElement('tr');
        let assetName = document.createElement('td');
        assetName.className = 'tableTd1';
        let startEndTime = document.createElement('td');
        startEndTime.className = 'tableTd2';
        let reservationName = document.createElement('td');
        reservationName.className = 'tableTd3';
        let cancelBtnTd = document.createElement('td');
        cancelBtnTd.className = 'tableTd4';
        let cancelBtn = document.createElement('button');

        

        assetName.innerHTML = reservation.assName;
        
        startEndTime.innerHTML = reservation.startDate + ' ' +reservation.startTime + ' ~ ' + reservation.endDate + ' '+ reservation.endTime;
        reservationName.innerHTML = reservation.reserName;
        cancelBtn.className = 'reservation-status-cancel';
        cancelBtn.id = 'cancelBtn' + reservation.reserNo;
        cancelBtn.innerText = '반납';
        cancelBtnTd.appendChild(cancelBtn);
        
        

        tr.appendChild(assetName);
        tr.appendChild(startEndTime);
        tr.appendChild(reservationName);
        tr.appendChild(cancelBtnTd);
        reservationBody.appendChild(tr);

        document.getElementById('cancelBtn' + reservation.reserNo).onclick = function() {

            cancelReservation(reservation.reserNo);
        }
    }
}
//예약취소 버튼 눌렀을때 이벤트
function cancelReservation(reserNo){
    location.href = "delete.re?reserNo="+ reserNo;
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
        // console.log(reservationValue.clickUnit)
        const timeUnit = document.querySelector(".reservation-graph > .graph-body > .graph-body-list > .graph-row > .graph-body-hour");
        
        const bodyTitles = document.getElementsByClassName('graph-body-title');
        // console.log(bodyTitles)
        for(const assetTitle of bodyTitles){
            if(assetTitle.textContent == reservationValue.clickUnit.assName){
                let confirmedAssets = document.createElement('div');
                confirmedAssets.className = 'graph-body-confirm';
                confirmedAssets.innerHTML = reservationValue.clickUnit.time + ' ~ ' + reservationValue.loginUser;
                // console.log(confirmedAssets);
                timeUnit.appendChild(confirmedAssets);
            }
        }
        
        

        document.getElementById("reservation-btn").click();
        document.getElementById("assetName").value = reservationValue.clickUnit.assName;
        document.getElementById("assetNo").value = reservationValue.clickUnit.assNo;
        for(let i = 0; i < 48; i++){
            if(document.getElementById("reservation-time-start").options[i].value == reservationValue.clickUnit.time){
                document.getElementById("reservation-time-start").options[i].selected = true;
                document.getElementById("reservation-time-end").options[i+1].selected = true;
            }
        };
    });

    //두칸부터 드래그 이벤트
    timeUnit.addEventListener("mousedown", function () {
       //div하나만들어 클릭한곳에 그려주고 
       //div에는 시간을 좀 나타내줘야겠다.
       reservationValue.startUnit = {
            ...asset,
            time
        }
        // console.log(reservationValue)
    });

    timeUnit.addEventListener("mouseenter", function () {
       //div에 표시된 시간을 변경해줘야겠다.
       if (reservationValue.startUnit && reservationValue.startUnit.assNo === asset.assNo){
            reservationValue.endUnit = {
                ...asset,
                time
            }
            // console.log(reservationValue);
       }
    });

    timeUnit.addEventListener("mouseup", function () {
        //드래그했던 시간정보들을 가지고 모달에 넘겨주면 되겠다
      
    //   값을 사용

      clickModal(reservationValue)
      reservationValue.clickUnit = {};
      reservationValue.endUnit = {};
      reservationValue.startUnit = {};
    });
}

function clickModal(reservationValue){
    document.getElementById("reservation-btn").focus();
    document.getElementById("reservation-btn").click();
    document.getElementById("assetName").value = reservationValue.endUnit.assName;
    for(let i = 0; i<48; i++){
        if(document.getElementById("reservation-time-start").options[i].value == reservationValue.startUnit.time){
            document.getElementById("reservation-time-start").options[i].selected = true;
        }
    }
    for(let i = 0; i<48; i++){
        if(document.getElementById("reservation-time-end").options[i].value == reservationValue.endUnit.time){
            document.getElementById("reservation-time-end").options[i+1].selected = true;
        }
    }
}

function drawReservationDiv(reservationList, loginUserName){
    const assetsNameTime = document.querySelectorAll(".graph-row");
    const reserDate = document.getElementById('calendar-title');
    // console.log(reservationList)
    //예약리스트들 하나씩 뽑아서 포문 돌리기
    for(const reserList of reservationList) {
        //하나씩뽑은 예약리스트 새로운 div만들어서 담아주기
        const newReserDiv = document.createElement('div');
        newReserDiv.className = 'graph-body-confirm2';
        newReserDiv.innerHTML = loginUserName + ' ' + reserList.startTime + ' ~ ' + reserList.endTime;
        // console.log(newReserDiv)//<div class="graph-body-confirm">권두원 00:00 ~ 00:30</div> 
        // console.log(document.querySelectorAll('graph-body-hour').value)
        // console.log(reserList)

        for(const assetNameTime of assetsNameTime){
            // console.log(assetNameTime)
            // console.log(assetsNameTime.childNodes)
            for(let i = 1; i < assetNameTime.childNodes.length; i++){
                // 주석시키면 console.log(newReserDiv) 에 cpage=1 인 리스트들 딸려옴
                // 해결방법 1.페이징처리안하고 그냥 한페이지에 다불러온뒤 스크롤 안보이게 만들어주기
                // 해결방법 2. 백엔드에서 pi를 뺀 새로운 리스트조회문 만들고 다른이름으로 똑같은 리스트들 보내기 !!

                // assetNameTime.childNodes[0]에러 is not iterable
                // console.log(assetNameTime.childNodes[0].textContent)
                // console.log(assetNameTime.childNodes[i].value == reserList.startTime)
                // console.log(reserDate.textContent)
                // console.log(reserList.startDate)
                if(assetNameTime.childNodes[0].textContent == reserList.assName && assetNameTime.childNodes[i].value == reserList.startTime){
                    
                    assetNameTime.childNodes[i].appendChild(newReserDiv);
                    // document.querySelectorAll('graph-body-hour').style.position = 'relative';
                    
                    for(let j = 1; j < assetNameTime.childNodes.length; j++){
                        if(assetNameTime.childNodes[j].value == reserList.endTime){
                            newReserDiv.style.width = 25*(j-i) + 'px';
                        }
                    }
                }
                
                

                //질문할것
                //1. 재산명이 같은 graph-row div에서 startTime이같은 class="graph-body-hour" div에 내가만든 newReserDiv appendChild하는 법
                //2. 해결방법 정하기

                //해야할것
                // 질문한것 해결하기 금욜까지!!!!
                // 클릭 or 드래그할때 div 그리기
            }
        }

        
    }
    

    //덮여씌어지는 div안에 추출한 값들 넣어주기
}