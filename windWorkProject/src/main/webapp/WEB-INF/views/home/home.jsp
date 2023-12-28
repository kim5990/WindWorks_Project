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

                </div>
            </div>

        </div>

    </div>
</body>
</html>