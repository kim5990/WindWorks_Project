
// 채팅페이지로 이동
function chattingList() {
    location.href = "list.ch";
}

// 미확인 채팅 카운트
function noReadChatCount() {
    $.ajax({
        url: "noReadChatCount.ch",
        data: {
            empNo: loginUser.empNo
        },
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
       

        noReadChatCount();
    })


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
					"end" 	  : dateEnd,
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

function chatGPT() {
    const api_key = "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"  // <- API KEY 입력
    const keywords = document.getElementById('comment').value;
    console.log(keywords)
    $('#loading').show();
    let messages = [
    { role: 'system', content: 'You are a helpful assistant.' },
    { role: 'user', content: '모든 언어를 한국어로 번역하여 알려줘' },
    { role: 'user', 
        content: `아래 keywords의 키워드를 이용해서 격식있는 이메일의 내용을 작성해줘 
                [keywords]:` },    
    { role: "user",
        content: "'"+ keywords + "'"
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

function chatGptTextDelete(){
    document.getElementById('comment').value = ''
}

$('#comment').keyup(function (e) {
    let content = $(this).val();
    $('#counter').html("(" + content.length + " / 1000)");    //글자수 실시간 카운팅
    if (content.length > 1000) {
        alert("최대 1000자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 1000));
        $('#counter').html("(1000 / 1000)");
    }
});

function chatGptTextCheck(event){
    if((event.keyCode == 13 || !event.keyCode) && document.getElementById('comment').value.trim() != ""){
        chatGPT();
    }
}







