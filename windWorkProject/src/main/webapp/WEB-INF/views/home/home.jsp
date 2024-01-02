<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
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

                    <!-- 2. 출퇴근 -->
                    <div class="commute-area">
                        <div class="current-time"></div>
                        <div class="commute-status">
                            <button class="status-work" onclick="statusWork('${loginUser.empNo}')">출근</button>
                            <button class="status-leave" onclick="statusLeave('${loginUser.empNo}')">퇴근</button>
                        </div>
                    </div>


                    <!-- 3.알림 -->
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
                    <div class="home-downArea-area1-weather-temperature">
                    
                    </div>
                    <div class="home-downArea-area1-weather-misseMunji" id="home-downArea-area1-weather-misseMunji">
                        
                    </div>
                </div>
            </div>

            <!-- ----- 번역 영역 ----- -->
            <div class="home-downArea-area2">
                <div class="home-downArea-area2-translate">

                    <div class="home-downArea-area2-translate-up">
                        <div class="source-Language">한국어</div>
                        <div class="change-icon-div" onclick="changeLanguage()"><ion-icon class="change-icon" name="repeat-outline" style="width: 20px; height: 20px;"></ion-icon></div>
                        <div class="target-Language">English</div>
                    </div>

                    <div class="home-downArea-area2-translate-center">
                        <div class="home-downArea-area2-translate-center-1">
                            <textarea name="" id="translate-input"></textarea>
                        </div>
                        <div class="home-downArea-area2-translate-center-2">
                            <div class="deleteText-area" onclick="deleteText()">
                                <ion-icon name="trash-outline" style="width: 16px; height: 16px;"></ion-icon>
                            </div>
                            <div class="home-downArea-area2-translate-center-2-btn" onclick="papago()">번역</div>
                        </div>
                    </div>

                    <div class="home-downArea-area2-translate-down">
                        <textarea name="" id="translate-value" disabled></textarea>
                    </div>

                </div>
            </div>


            <!-- ----- gpt 영역 ----- -->
            <div class="home-downArea-area3">
                <div class="home-downArea-area3-chatgpt">

                </div>
            </div>

        </div>

    </div>
</body>
</html>