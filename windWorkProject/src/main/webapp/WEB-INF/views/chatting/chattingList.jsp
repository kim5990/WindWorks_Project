<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CHATTING</title>

<!-- jQuery 3.7.1 -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<!-- 부트스트랩 -->
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="resources/chatting/css/chatting.css">
<script src="resources/chatting/js/chatting.js"></script>

<style>
    
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
	<div class="menu">

        <!-- 조직도 영역 -->
        <div class="chattingList-area0">


            <div class="area-12">
                <!-- 상단 프로필 -->
                <div class="screen_leftUp">
                    <div class="profileImgCircle">
                        <div class="profileImg"><img class="profileImg-img" src="${loginUser.profileFilePath}"/></div>
                    </div>
                    <div class="profileName">
                        <div style="font-weight: 600;">${loginUser.empName}</div>
                        <div>${loginUser.deptName} · ${loginUser.jobName}</div>
                    </div>
                    <div class="profileStatus"></div>
                    <div class="profileCheckbox" onclick="showOverlay()">
                        <ion-icon class="profileCheckbox-icon" name="chevron-down-circle-outline"></ion-icon>
                        <div class="overlay-div">
                            <div class="overlay-div-selectBox">
                                <div class="overlay-div-selectBox-cont" onclick="changeOnline()">온라인</div>
                                <div class="overlay-div-selectBox-cont" onclick="changeAway()">자리비움</div>
                                <div class="overlay-div-selectBox-cont" onclick="changeOffline()">오프라인</div>
                            </div>
                        </div>
                        <!-- <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="green" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
                        </svg> -->
                    </div>    
                </div>

                <!-- 중간 조직도 -->
                <div class="screen_leftCenter">
                    <ul class="org-container">
                        <li class="org-item">
                            <div class="org-oneline org-title">
                                <div class="org-toggle">&#43;</div>
                                <div>본점</div>
                            </div>
                            <ul class="org-content" id="start-ul">

                            </ul>
                        </li>
                    </ul>
                </div>

            </div>

            <!-- 하단 채팅추가 -->
            <div class="screen_leftDown">
                <div class="screen_leftDown-left">

                </div>
                <div class="screen_leftDown-right">
                    <button class="screen_leftDown-right-plusbtn" onclick="createChat()" disabled>&#43;</button>
                </div>
            </div>

        </div>

        <!-- 리스트부분 -->
        <div class="chattingList-area1">
               
        </div>



        <!-- 채팅부분 -->
        <div class="chattingList-area2">

            <!-- 채팅 : 헤더 -->
            <div class="chattingList-area2-header-area">
               
            </div>

            <!-- 채팅 : 바디 -->
            <div class="chattingList-area2-body">
                
            </div>

            <!-- 채팅 : 작성 -->

            <div class="chattingList-area2-footer">
                
            
            </div>

    
        </div>
        


    </div>


    <script>
        onload = function(){

            loginUser.empNo = '${loginUser.empNo}',
            loginUser.empName = '${loginUser.empName}'
            orgList(function(){
                toggle();
                checkBoxEvent();
                chatRoomList();
            })
            
        }
    </script>


</body>
</html>