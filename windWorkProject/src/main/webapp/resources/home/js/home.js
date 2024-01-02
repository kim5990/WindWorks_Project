// 채팅페이지로 이동
function chattingList(){
    location.href = "list.ch";
}


// 미확인 채팅 카운트
function noReadChatCount(){
    
    $.ajax({
        url: "noReadChatCount.ch",
        success: function (res) {
            document.querySelector(".profile-inform-chat-2").innerHTML = res;
        },
        error: function () {
            console.log("실패");
        }
    });
}


// 캘린더 그리기
document.addEventListener('DOMContentLoaded', function() {
   let calendarEl = document.getElementById('calendar');
      let calendar = new FullCalendar.Calendar(calendarEl, {
         googleCalendarApiKey: "AIzaSyDms3oLpDbnfLhL9z6TFgFnBoh5Jk5T2Fc",
         height: 365, // 캘린더 높이 설정
         initialView: 'listWeek', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
         locale: 'ko', // 한국어 설정
         //selectable: true, // 달력 일자 드래그 설정가능
         events: function(timezone, callback){
            // console.log("서버로부터 가져와서 실행함")
            //여기서 서버로부터 데이터가져오기
            listCalendar(timezone, function(res){
                    if (res.length === 0) {
                        const noEventsMessage = '일정이 없습니다.';
                        const emptyEventDiv = document.createElement('div');
                        emptyEventDiv.classList.add('fc-list-empty-event');
                        emptyEventDiv.innerHTML = noEventsMessage;
    
                        const noEventElement = document.querySelector('.fc-list-empty');
                        if (noEventElement) {
                            noEventElement.appendChild(emptyEventDiv);
                        }
                    } else {
                   callback(res)
                    }
            })
         },
            // 일정 클릭
         eventClick: function(info) {
            info.jsEvent.stopPropagation();
            info.jsEvent.preventDefault();
            },
         headerToolbar: { // 헤더에 표시할 툴바
            left: 'prev',
            center: 'title',
            right: 'next'
         },
         // 공휴일 데이터 추가
         eventSources: [{ // 구글 캘린더 API 키를 발급받은 경우 공휴일 데이터 추가
            googleCalendarId: "ko.south_korea#holiday@group.v.calendar.google.com",
            backgroundColor: "rgb(253, 112, 94)",
            borderColor: "rgb(253, 112, 94)",
            className: "ko-holiday",
            textColor: "white",
         }],
            titleFormat : function(date) { // title 설정 yyyy. mm. dd - mm. dd
                const start = new Date(date.date.year, date.date.month, date.date.day); 
                const end = new Date(date.date.year, date.date.month, date.date.day + 6);
                return start.getFullYear() + '. ' + (start.getMonth() + 1) + '. ' + start.getDate() + ' ~ ' +
                       (end.getMonth() + 1) + '. ' + end.getDate();
            },
            listDayFormat : function(date) {
                const dayOfWeek = new Date(date.date.year, date.date.month, date.date.day).getDay();
                const weekdays = ['일', '월', '화', '수', '목', '금', '토'];

                return (date.date.month + 1) + ". " + (date.date.day) + ". " + weekdays[dayOfWeek];
            },
            listDaySideFormat: function() {
                return "";
            } 
            
        })
   calendar.render();

   // if (!events){
   //     // 이벤트 없을때
   //     const noEventsMessage = '일정이 없습니다.';
   //     const emptyEventDiv = document.createElement('div');
   //     emptyEventDiv.classList.add('fc-list-empty-event');
   //     emptyEventDiv.innerHTML = noEventsMessage;
      
   //     const noEventElement = document.querySelector('.fc-list-empty');
   //     if (noEventElement) {
   //         noEventElement.appendChild(emptyEventDiv);
   //     }
   // }
   


   
   updateTime(); // 현재시간
   setInterval(updateTime, 1000); // 시간 카운트
   noReadChatCount(); // 미확인 채팅 카운트
   selectStatus() // 출퇴근상태확인



})


// 일정 조회
function listCalendar(timeData, callback){
   $.ajax({
      url: "clist.ca",
      data:{
         startTime : timeData.start,
         endTime : timeData.end,
      },
      success: function(calendar){
         // console.log(calendar)
         // console.log(calendar.list.startTime)

         const data =[]
         const list = calendar.list

         for (let i = 0; i < list.length; i++){

            // 주어진 날짜를 JavaScript Date 객체로 파싱합니다.
            const dateStart = new Date(list[i].startTime);
            dateStart.toLocaleString("en-US", {timeZone: "Asia/Seoul"});
            const dateEnd = new Date(list[i].endTime);

            // Tue Dec 26 2023 18:00:00 GMT+0900 (한국 표준시) {}
            // 원하는 형식으로 날짜를 변환합니다. (YYYY-MM-DD 형식으로)
            const formattedStartDate = dateStart.toISOString().slice(0, 10);
            const formattedEndDate = dateEnd.toISOString().slice(0, 10);

            // 시간 변환
            const startHours = ('0' + dateStart.getHours()).slice(-2); // 시간을 가져옵니다.
            const startMinutes = ('0' + dateStart.getMinutes()).slice(-2); // 분을 가져옵니다.
            const formattedStartTime = startHours + ":" + startMinutes; // 시간과 분을 조합합니다.

            const endHours = ('0' + dateEnd.getHours()).slice(-2); // 종료 시간의 시간을 가져옵니다.
            const endMinutes = ('0' + dateEnd.getMinutes()).slice(-2); // 종료 시간의 분을 가져옵니다.
            const formattedEndTime = endHours + ":" + endMinutes; // 시간과 분을 조합하여 문자열을 만듭니다.

            // 기본값 설정
            let backgroundColor = ""; 
            let borderColor = "";
            let textColor = "";

            if (list[i].calendarCategory === 0) { // 내 일정
               backgroundColor = "rgb(119, 187, 243)";
               borderColor = "rgb(119, 187, 243)";
               textColor = "white";
            } else if (list[i].calendarCategory === 1) { // 팀 일정
               backgroundColor = "rgb(194, 124, 221)";
               borderColor = "rgb(194, 124, 221)";
               textColor = "white";
            } else if (list[i].calendarCategory === 2) { // 전체 일정
               backgroundColor = "rgb(255, 200, 82)";
               borderColor = "rgb(255, 200, 82)";
               textColor = "white";
            } else if (list[i].calendarCategory === 3) { // 자산 예약
               backgroundColor = "rgb(85, 175, 130)";
               borderColor = "rgb(85, 175, 130)";
               textColor = "white";
            }

            data2 = {
               "title"   : list[i].calendarName,
               "start"   : dateStart,
               "end"      : dateEnd,
               "content" : list[i].calendarContent,
                    "allDay"  : false,
               "calNo"   : list[i].calendarListNo,
               "calendarCategory" : list[i].calendarCategory,
               "dateStart": formattedStartDate,
               "dateEnd" : formattedEndDate,
               "timeStart" : formattedStartTime,
               "timeEnd" : formattedEndTime,
               "backgroundColor" : backgroundColor,
               "borderColor" : borderColor,
               "textColor" : textColor
            }
            data.push(data2)
         }
      
         callback(data);
      },
      error: function(){
         console.log("clist.ca ajax 통신 실패")
      }
   })
}



// 번역버튼 클릭
function papago(){
    let inputText = document.querySelector('#translate-input').value;

    // 공백이면 함수 종료
    if(inputText.replace(/\s/g, '') == ""){
        return;
    }


    const sourceLanguage = document.querySelector('.source-Language').textContent;

    if(sourceLanguage == 'English'){
        $.ajax({
            url: "papagoEn.ho",
            data:{
                inputText: inputText
            },
            success: function (res) {
                document.querySelector('#translate-value').value = res.message.result.translatedText;
            },
            error: function () {
                console.log("실패");
            }
        });

    } else {
        $.ajax({
            url: "papagoKo.ho",
            data:{
                inputText: inputText
            },
            success: function (res) {
                document.querySelector('#translate-value').value = res.message.result.translatedText;
            },
            error: function () {
                console.log("실패");
            }
        });
    }

}

// 언어변경
function changeLanguage(){
    const sourceLanguage = document.querySelector('.source-Language');
    const targetLanguage = document.querySelector('.target-Language');

    if (sourceLanguage.textContent == '한국어') {
        // 한국어에서 영어로 변경
        sourceLanguage.textContent = 'English';
        targetLanguage.textContent = '한국어';
    } else {
        // 영어에서 한국어로 변경
        sourceLanguage.textContent = '한국어';
        targetLanguage.textContent = 'English';
    }
}

// 내용 지우기
function deleteText(){
    document.querySelector('#translate-input').value = "";
    document.querySelector('#translate-value').value = "";


}

// 현재시간
function updateTime() {
   const currentTimeElement = document.querySelector('.current-time');
   const currentTime = new Date();
   const hours = currentTime.getHours().toString().padStart(2, '0');
   const minutes = currentTime.getMinutes().toString().padStart(2, '0');
   const seconds = currentTime.getSeconds().toString().padStart(2, '0');

   const formattedTime = `${hours}:${minutes}:${seconds}`;
   currentTimeElement.textContent = formattedTime;
}


// 출근
function statusWork(empNo){
   $.ajax({
      url: "statusWork.ho",
      data:{
         empNo: empNo
      },
      success: function (res) {
         if (res == "success") {
            updateButtonState(1)
         } else {
                console.log("업데이트 실패")
            }
      },
      error: function () {
         console.log("실패");
      }
   });
}

// 퇴근
function statusLeave(empNo){
   $.ajax({
      url: "statusLeave.ho",
      data:{
         empNo: empNo
      },
      success: function (res) {
         if (res == "success") {
            updateButtonState(0)
            console.log(0)
         } else {
                console.log("업데이트 실패")
            }   
      },
      error: function () {
         console.log("실패");
      }
   });
}

// 버튼 상태 업데이트
function updateButtonState(Status) {
   const workButton = document.querySelector('.status-work');
   const leaveButton = document.querySelector('.status-leave');

   // 출근 상태인 경우
   if (Status == 1) {
      workButton.setAttribute('disabled', true);
      leaveButton.removeAttribute('disabled');
      workButton.style.cursor = 'default';
      leaveButton.style.cursor = 'pointer';
   }
   // 퇴근 상태인 경우
   else if (Status == 0) {
      leaveButton.setAttribute('disabled', true);
      workButton.removeAttribute('disabled');
      leaveButton.style.cursor = 'default'; 
      workButton.style.cursor = 'pointer';
   }

}

// 출퇴근상태 확인
function selectStatus(){
   $.ajax({
      url: "selectStatus.ho",
      success: function (res) {
         if (res == 1) {
            updateButtonState(1)
         } else {
                updateButtonState(0)
            }   
      },
      error: function () {
         console.log("실패");
      }
   });
}

function chatGptTextCheck(event) {

    let content = $('#comment').val();
    $('#counter').html("(" + content.length + " / 1000)");    //글자수 실시간 카운팅
    if (content.length > 1000) {
        alert("최대 1000자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 1000));
        $('#counter').html("(1000 / 1000)");
    }

    if ((event.keyCode == 13 || !event.keyCode) && document.getElementById('comment').value.trim() != "") {
        chatGPT();
    }
}

function chatGPT() {
    const api_key = "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"  // <- API KEY 입력
    const keywords = document.getElementById('comment').value;
    console.log(keywords)
    $('#loading').show();
    let messages = [
        { role: 'system', content: 'You are a helpful assistant.' },
        { role: 'user', content: '모든 언어를 한국어로 번역하여 알려줘' },
        {
            role: 'user',
            content: `아래 keywords의 키워드를 이용해서 격식있는 이메일의 내용을 작성해줘 
                [keywords]:` },
        {
            role: "user",
            content: "'" + keywords + "'"
        },
    ]

    const data = {
        model: 'gpt-3.5-turbo',
        temperature: 0.5,
        max_tokens: 1_000,
        messages: messages,
    }

    $.ajax({
        url: "https://api.openai.com/v1/chat/completions",
        method: 'POST',
        headers: {
            Authorization: "Bearer " + api_key,
            'Content-Type': 'application/json',
        },
        data: JSON.stringify(data),
    }).then(function (response) {
        console.log(response);
        let result = document.getElementById('comment2')
        result.value = response.choices[0].message.content
    });
}

function chatGptTextDelete() {
    document.getElementById('comment').value = ''
}



//버스정류장 API
//1. 버스 정류장 검색
function busSearchBtn(event) {
    if (event.keyCode === 13 || !(event.keyCode)) {
        console.log("enter");
        seconds = 15;
        ajaxBusSearch(document.getElementById("bus-search-input").value, drawBusStationList);
    }
}

//2. 버스정류장 ajax로 Controller에서 검색
function ajaxBusSearch(busSearch, drawBusStationList) {
    $.ajax({
        url: "busSearch.bus",
        data: {
            busSearch: busSearch
        },
        success: function (res) {
            drawBusStationList(res)
        },
        error: function () {

        }
    })
}

//버스정류장 검색 정보 그리기
function drawBusStationList(res) {
    let bsbList = res.bsbList;
    let bsiList = res.bsiList;

    bsbList.forEach(function (b) {
        let matchResult1 = b.arrmsg1.match(/(\d+)분(\d+)초후\[(\d+)번째 전\]/);
        let matchResult2 = b.arrmsg2.match(/(\d+)분(\d+)초후\[(\d+)번째 전\]/);
        // matchResult가 존재하는 경우에만 처리
        if (matchResult1 && matchResult2) {
            // 추출된 정보를 이용하여 arrmsgTime 및 arrmsgBefore 생성
            let minutes1 = parseInt(matchResult1[1], 10);
            let seconds1 = parseInt(matchResult1[2], 10);
            let beforeCount1 = parseInt(matchResult1[3], 10);

            b.arrTime1 = matchResult1[1] + '분 ' + matchResult1[2] + '초 후';
            b.arrBefore1 = matchResult1[3] + '번째 전';

            let minutes2 = parseInt(matchResult2[1], 10);
            let seconds2 = parseInt(matchResult2[2], 10);
            let beforeCount2 = parseInt(matchResult2[3], 10);

            b.arrTime2 = matchResult2[1] + '분 ' + matchResult2[2] + '초 후';
            b.arrBefore2 = matchResult2[3] + '번째 전';

            // 시간을 분으로 변환하여 소수점 형태로 표현
            let arrmsgTime1 = minutes1 + seconds1 / 60;
            let arrmsgBefore1 = beforeCount1;

            let arrmsgTime2 = minutes2 + seconds2 / 60;
            let arrmsgBefore2 = beforeCount2;

            // 속성 추가
            b.arrmsgTime1 = arrmsgTime1;
            b.arrmsgBefore1 = arrmsgBefore1;
            b.arrmsgTime2 = arrmsgTime2;
            b.arrmsgBefore2 = arrmsgBefore2;
        }

    })

    // busInfo.arrmsgTime을 기준으로 오름차순 정렬
    bsiList.sort(function (a, b) {
        if (a.arsId !== b.arsId) {
            return a.arsId - b.arsId;
        }
    });

    bsbList.sort(function (a, b) {
        if (a.arsId !== b.arsId) {
            return a.arsId - b.arsId;
        } else {
            return a.arrmsgTime - b.arrmsgTime;
        }
    });

    console.log(bsbList);
    console.log(bsiList);
    let str = ""

    bsbList = bsbList.filter((value, index, self) => {
        return self.indexOf(value) === index;
    });

    bsiList = bsiList.filter((value, index, self) => {
        return self.indexOf(value) === index;
    });

    for (let i = 0; i < bsiList.length; i++) {
        str += '<div class="bus-output-item" onclick = "busAjaxLists(event, ' + "'" + bsiList[i].stNm + "'" + ', ' + "'" + bsiList[i].arsld + "', " + bsiList[i].stId + ')">'
            + '<div class="bus-output-item-title">'
            + '<h5 class="bus-output-item-title-text">'
            + bsiList[i].stNm
            + '</h5>'
            + '<div class="bus-output-item-title-div" id= "bus-output-item-title-text' + i + '">'
            + '</div>'
            + '<input type="hidden" value="' + bsiList[i].arsld + '">'
            + '</div>'
            + '<div class="bus-output-item-body" id= "bus-output-item-body' + i + '">'
            + '</div>'
            + '</div>'
    }


    document.querySelector("#bus-search-output").innerHTML = str

    for (let i = 0; i < bsiList.length; i++) {
        let blistStr = ""
        let num = 0;
        for (let j = 0; j < bsbList.length; j++) {
            if ((bsiList[i].stNm === bsbList[j].stNm) && bsiList[i].stId === bsbList[j].stId && num < 2) {
                if (bsbList[j].arrTime1 === undefined) {
                    blistStr += '<div class="bus-output-item-body-endtime">'
                        + '<div class="bus-seat-bus">' + bsbList[j].busRouteAbrv + '</div>'
                        + '<div class="bus-seat-time-box">'
                        + '<div class="bus-seat-time">'
                        + bsbList[j].arrmsg1
                        + '</div> '
                        + '<div class="bus-seat-location">' + bsbList[j].arrmsg1 + '</div>'
                        + '</div>'
                        + '</div>'
                    if (num == 1) {
                        break

                    }
                } else {
                    blistStr += '<div class="bus-output-item-body-endtime">'
                        + '<div class="bus-seat-bus">' + bsbList[j].busRouteAbrv + '</div>'
                        + '<div class="bus-seat-time-box">'
                        + '<div class="bus-seat-time">'
                        + bsbList[j].arrTime1
                        + '</div> '
                        + '<div class="bus-seat-location">' + bsbList[j].arrBefore1 + '</div>'
                        + '</div>'
                        + '</div>'
                    if (num == 1) {
                        break

                    }
                }


                document.getElementById('bus-output-item-title-text' + i).innerHTML += '(' + bsbList[j].adirection + ' 방면)'
                num += 1;

            }
        }
        document.querySelector("#bus-output-item-body" + i).innerHTML = blistStr
    }
}

//15초마다 재 검색
//setInterval(intervalBusSearchBtn, 15000);
let seconds = 15;
//15초 카운트 다운
function showCountdown() {
    // 초기 카운트 다운 표시
    console.log(`남은 시간: ${seconds}초`);
    seconds--;
    document.getElementById('bus-search-bar-title-sec').innerHTML = `남은 시간: ${seconds}`
    if (seconds == 0) {
        seconds = 15;
    }
}

//setInterval(showCountdown, 1000);


function intervalBusSearchBtn() {
    console.log("enter");
    seconds = 15;
    ajaxBusSearch(document.getElementById("bus-search-input").value, drawBusStationList);

}

//버스 정류장 버스리스트
function busAjaxLists(ev, stNm, arsld, stId) {
    $.ajax({
        url: "busAjaxSearchList.bus",
        data: {
            stNm: stNm,
            arsld: arsld,
            stId: stId
        },
        success: function (res) {
            drowBusList(res)
        },
        error: function () {
            console.log("busAjaxLists 통신 실패")
        }
    })
}

function drowBusList(res) {
    console.log(res)
    let bsbList = res.bsbList;
    let bsiList = res.bsiList;

    bsbList.forEach(function (b) {
        let matchResult1 = b.arrmsg1.match(/(\d+)분(\d+)초후\[(\d+)번째 전\]/);
        let matchResult2 = b.arrmsg2.match(/(\d+)분(\d+)초후\[(\d+)번째 전\]/);
        // matchResult가 존재하는 경우에만 처리
        if (matchResult1 && matchResult2) {
            // 추출된 정보를 이용하여 arrmsgTime 및 arrmsgBefore 생성
            let minutes1 = parseInt(matchResult1[1], 10);
            let seconds1 = parseInt(matchResult1[2], 10);
            let beforeCount1 = parseInt(matchResult1[3], 10);

            b.arrTime1 = matchResult1[1] + '분 ' + matchResult1[2] + '초 후';
            b.arrBefore1 = matchResult1[3] + '번째 전';

            let minutes2 = parseInt(matchResult2[1], 10);
            let seconds2 = parseInt(matchResult2[2], 10);
            let beforeCount2 = parseInt(matchResult2[3], 10);

            b.arrTime2 = matchResult2[1] + '분 ' + matchResult2[2] + '초 후';
            b.arrBefore2 = matchResult2[3] + '번째 전';

            // 시간을 분으로 변환하여 소수점 형태로 표현
            let arrmsgTime1 = minutes1 + seconds1 / 60;
            let arrmsgBefore1 = beforeCount1;

            let arrmsgTime2 = minutes2 + seconds2 / 60;
            let arrmsgBefore2 = beforeCount2;

            // 속성 추가
            b.arrmsgTime1 = arrmsgTime1;
            b.arrmsgBefore1 = arrmsgBefore1;
            b.arrmsgTime2 = arrmsgTime2;
            b.arrmsgBefore2 = arrmsgBefore2;
        }

    })

    // busInfo.arrmsgTime을 기준으로 오름차순 정렬

    bsbList.sort(function (a, b) {
        if (a.arsId !== b.arsId) {
            return a.arsId - b.arsId;
        } else {
            return a.arrmsgTime - b.arrmsgTime;
        }
    });

    console.log(bsbList);
    console.log(bsiList);
    let str = ""

    if (bsiList !== null) {
        str += '<div class="bus-output-item">'
            + '<div class="bus-output-item-title">'
            + '<h5 class="bus-output-item-title-text">'
            + bsiList.stNm
            + '</h5>'
            + '<div class="bus-output-item-title-div" id= "bus-output-item-title-text' + 1 + '">'
            + '</div>'
            + '<input type="hidden" value="' + bsiList.arsld + '">'
            + '</div>'
            + '<div class="bus-output-item-body" id= "bus-output-item-body' + 1 + '">'
            + '</div>'
            + '</div>'
    }


    document.querySelector("#bus-search-output").innerHTML = str

    let blistStr = ""
    for (let j = 0; j < bsbList.length; j++) {

        if (bsbList[j].arrTime1 === undefined) {
            blistStr += '<div class="bus-output-item-body-endtime">'
                + '<div class="bus-seat-bus">' + bsbList[j].busRouteAbrv + '</div>'
                + '<div class="bus-seat-time-box">'
                + '<div class="bus-seat-time">'
                + bsbList[j].arrmsg1
                + '</div> '
                + '<div class="bus-seat-location">' + bsbList[j].arrmsg1 + '</div>'
                + '</div>'
                + '</div>'
        } else {
            blistStr += '<div class="bus-output-item-body-endtime">'
                + '<div class="bus-seat-bus">' + bsbList[j].busRouteAbrv + '</div>'
                + '<div class="bus-seat-time-box">'
                + '<div class="bus-seat-time">'
                + bsbList[j].arrTime1
                + '</div> '
                + '<div class="bus-seat-location">' + bsbList[j].arrBefore1 + '</div>'
                + '</div>'
                + '</div>'
        }


        document.querySelector("#bus-output-item-body" + 1).innerHTML = blistStr
    }

    document.getElementById('bus-output-item-title-text' + 1).innerHTML += '(' + bsiList.arsld + ')'

}