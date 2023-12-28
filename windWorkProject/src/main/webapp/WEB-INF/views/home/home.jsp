<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>HOME</title>
		<!-- jQuery 3.7.1 -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
		<!-- 부트스트랩 -->
		<!-- Latest compiled and minified CSS -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
		<!-- Latest compiled JavaScript -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<!-- fullcalendar-5.11.5 -->
		<link href="resources/home/fullcalendar-5.11.5/lib/main.css" rel="stylesheet" />
		<script src="resources/home/fullcalendar-5.11.5/lib/main.js"></script>
        <link rel="stylesheet" href="resources/home/css/home.css">
        <script src="resources/home/js/home.js"></script>
    </head>
    <body onload="homeOnload('${loginUser.empNo}')">
        <div class="home-All">
            <!-- --------------- 상단 영역 --------------- -->
            <div class="home-upArea">
    
                <!-- ----- 프로필 영역 ----- -->
                <div class="home-upArea-area1">
                    <div class="home-upArea-area1-profile">
                        <!-- 1.프로필 -->
                        <div class="profile-profile">
                            <div class="profile-profile-1"><img class="profile-profile-1-img" src="./${loginUser.profileFilePath}"></div>
                            <div class="profile-profile-2">${loginUser.empName} ${loginUser.jobName} </div>
                            <div class="profile-profile-3">${loginUser.deptName}</div>
                        </div>
    
    
                        <!-- 2.알림 -->
                        <div class="profile-inform">
                            <div class="profile-inform-">
                                <div class="profile-inform-mail">
                                    <div>미확인 메일</div>
                                    <div class="profile-inform-mail-2">5</div>
                                </div>
                                <div class="profile-inform-chat" onclick="chattingList()">
                                    <div>미확인 채팅</div>
                                    <div class="profile-inform-chat-2"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    
    
    
                <!-- ----- 캘린더 영역 ----- -->
                <div class="home-upArea-area2">
                    <div class="home-upArea-area2-calendar">
                        <div id="calendar"></div>
                    </div>
                </div>
    
                <!-- ----- 지도 영역 ----- -->
                <div class="home-upArea-area3">
                    <div class="home-upArea-area3-map">
                        
                    </div>
                </div>
    
    
            </div>
                
    
            <!-- --------------- 하단 영역 --------------- -->
            <div class="home-downArea">
    
                <!-- ----- 날씨 영역 ----- -->
                <div class="home-downArea-area1">
                    <div class="home-downArea-area1-weather">
    
                    </div>
                </div>
    
                <!-- ----- 번역 영역 ----- -->
                <div class="home-downArea-area2">
                    <div class="home-downArea-area2-translate">
    
                    </div>
                </div>
    
                <!-- ----- gpt 영역 ----- -->
                <div class="home-downArea-area3">
                    <div class="home-downArea-area3-chatgpt">
                        <div class="textCheckBox">
                            <div class="textCheckBox-title">
                                <h5>이메일 작성기</h5>
                            </div>

                            <textarea name="comment" onkeyup = "chatGptTextCheck(event)" id="comment" class="comment" maxlength="1001"
                                placeholder="어떤 내용에 대해 작성해드릴까요?"></textarea>
                            <textarea class="comment2" id="comment2" readonly placeholder="결과"></textarea>
                            <div class="text-check-btn-box">
                                <span style="color:#aaa;" id="counter">(0 / 1000)</span>
                                <div>
                                    <button class="text-check-btn" onclick = "chatGptTextDelete()">지우기</button>
                                    <button class="text-check-btn" onclick = "chatGptTextCheck(event)">검사하기</button>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            

        <script>
            onload = function () {
                loginUser.empNo = '${loginUser.empNo}',
                    loginUser.empName = '${loginUser.empName}'

                noReadChatCount();
            }
        </script>

        <script>
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
        </script>

    </body>

    </html>