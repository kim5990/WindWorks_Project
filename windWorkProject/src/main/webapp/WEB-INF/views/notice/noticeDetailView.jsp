<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<!-- CSS -->
<link rel="stylesheet" href="resources/notice/css/notice-detail-view.css">


<!-- JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- SweetAlert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="resources/notice/js/notice-detail-view.js"></script>
<script src="resources/notice/js/notice-detail-view-Ajax.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="selectReplyList('${n.noticeNo}'), noticeOnload()">  

<jsp:include page="../common/header.jsp" />
	<c:if test="${!empty alertMsg}">
		<script>
			swal("", "${alertMsg}", "success");
			/* alertify.alert('알림', "${alertMsg}"); */
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>
	
	<div class="menu">
		<div class="notice-detail-area">
		
			<!-- 공지사항 디테일  -->
			<div class="notice-detail-view">
				
				<div class="notice-top">
					<div class="notice-title">
						<button onclick="history.back()" class="notice-back-btn"><ion-icon class="notice-back-icon" name="chevron-back-outline"></ion-icon></button>
						${n.noticeTitle}
					</div>
					<div class="notice-top-right">
						<div class="notice-writer">
							${n.empName}
						</div>
						<div class="notice-date">
							${n.noticeCreateDate}
						</div>
					</div>
				</div>
				
				<div class="notice-middle">
					<div class="notice-content">
						<pre>${n.noticeContent}</pre>
					</div>
					
		
					<div class="notice-middle-right">
					
						<c:if test="${loginUser.empNo eq n.empNo}">
							<button class="notice-update-btn" onclick="noticeFormSubmit(1)">수정</button>
							<div>|</div>
							<button class="notice-delete-btn" onclick="noticeFormSubmit(2)">삭제</button>
						</c:if>
						
						<form action="" method="post" id="updateForm">
							<input type="hidden" name="nno" value="${n.noticeNo}">
							<input type="hidden" name="filePath" value="${n.noticeChangeName}">
						</form>
						
						<script>
							function noticeFormSubmit(num){
								if(num === 1){
									$("#updateForm").attr('action', 'updateForm.no');
									// document.querySelector("updateForm").setAttribute('action', 'updateForm.no')
								} else {
									$("#updateForm").attr('action', 'delete.no');
								}
								$("#updateForm").submit();
							}
						</script>
						
					</div>
				</div>
				
				<div class="notice-bottom">
				
					<c:choose>
						<c:when test="${not empty n.noticeOriginName}">
							<div class="notice-attchment">
								<a href="${n.noticeChangeName}" download="${n.noticeOriginName}">${n.noticeOriginName}</a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="notice-attchment">
								첨부파일이 없습니다.
							</div>
						</c:otherwise>
					</c:choose>
					
				</div>
					
				
				<!-- 공지사항 댓글 -->
				<div class="notice-reply-area">
					<div class="notice-reply-top">
						댓글 (<span id="rcount"></span>)
					</div>
					
					<div id="notice-reply" class="notice-reply-middle">
						
						
						
					</div> 
					
					<!-- 댓글작성영역 -->
					<div class="notice-reply-bottom">
						<div class="notice-reply-write-area">
							<div class="notice-reply-write-writer">${loginUser.empName}</div>
							<div class="notice-reply-write-content">
								<textarea id="contentReply" rows="1" cols="100" placeholder="댓글을 입력해주세요"></textarea>
							</div>
							<div class="notice-reply-write-btn">
								<button onclick="addReply('${n.noticeNo}', '${loginUser.empNo}');">등록</button>
							</div>
						</div>
					</div>
				</div>
<!-- 				
				<script>
					// $(function(){
					// 	// 댓글 조회하는 함수 호출
					// 	selectReplyList();
					// })
					
					/* ----- 댓글 그려주기 -----*/
					// function selectReplyList(){
					// 	$.ajax({
					// 		url: "rlist.no",
					// 		data: {
					// 			nno: '${n.noticeNo}'
					// 		},
					// 		success: function(result){
					// 			console.log(result);
								
								
					// 			let list = result.list;

								
					// 			let str1="";
					// 			let str2="";
					// 			let str3="";
					// 			let str4="";
					// 			let str5="";
								
					// 			// 댓글 반복문 돌기
					// 			for (let i = 0; i < list.length; i++){
					// 				// 로그인유저만 수정,삭제 보이기
					// 				if (result.loginUser === list[i].empNo) {
					// 					str2 = '<button class="notice-reply-update-btn" onclick="noticeReplyUpdate('+ list[i].noticeReplyNo +')">' + '수정' + '</button>'
					// 						 + '<div>' + '|' + '</div>'
					// 						 + '<button class="notice-reply-delete-btn" onclick="noticeReplyDelete(' + list[i].noticeReplyNo + ')">' + '삭제' + '</button>'
					// 					}
									
					// 				// 대댓글 반목문 돌기
					// 				for (let j = 0; j < list[i].childReply.length; j++) {

					// 					// 로그인유저만 수정,삭제 보이기
					// 					if (result.loginUser === list[i].childReply[j].empNo) {
					// 						str4 = '<button class="notice-reply-update-btn" onclick="noticeChildReplyUpdate(' + list[i].childReply[j].noticeReplyNo + ')">' + '수정' + '</button>'
					// 							 + '<div>' + '|' + '</div>'
					// 							 + '<button class="notice-reply-delete-btn" onclick="noticeChildReplyDelete(' + list[i].childReply[j].noticeReplyNo + ')">' + '삭제' + '</button>'
					// 						}
										
					// 					// 대댓글 그리기
					// 					if (list[i].childReply.length !== 0) {
					// 						str3 += '<div id="notice-child-reply-content'+ list[i].childReply[j].noticeReplyNo +'" class="notice-reply-parent-content-area">'
					// 							 + '<div class="notice-reply-parent-writer">' + list[i].childReply[j].empName 
					// 							 + '<div id="notice-reply-middle-right'+ list[i].childReply[j].noticeReplyNo +'" class="notice-reply-middle-right">' + str4 +'</div>'
					// 							 + '</div>'
					// 				             + '<div class="notice-reply-parent-content">' + '<pre>' + list[i].childReply[j].noticeReplyContent + '</pre>' + '</div>'
					// 				             + '<div class="notice-reply-parent-date">' + list[i].childReply[j].noticeReplyCreateDate
					// 				             + '</div>'
					// 				             + '</div>'

					// 							 // 답글 쓰기 수정 클릭시 기존 내용이 담긴 textarea 불러오기
					// 							 +'<div id="appendChildReplyUpdate' + list[i].childReply[j].noticeReplyNo + '" class="notice-child-reply-write-area" style="display: none;">'
					// 							+ '<div class="notice-reply-write-writer">' + list[i].childReply[j].empName + '</div>'
					// 							+ '<div class="notice-reply-write-content">'
					// 							+ 	'<textarea id="childReplyContent' + list[i].childReply[j].noticeReplyNo  + '" class="childReplyContentUpdate" cols="100">' + list[i].childReply[j].noticeReplyContent + '</textarea>'
					// 							+ '</div>'
					// 							+ '<div class="notice-reply-write-btn">'
					// 							+ '<button onclick="appendChildReplyUpdate(' + list[i].childReply[j].noticeReplyNo + ',' + "'" + 'childReplyContent' + list[i].childReply[j].noticeReplyNo  + "'" + ')">' + '수정' + '</button>'
					// 							+ '<button id="addChildReplyCancel" onclick="addChildReplyCancel(' + list[i].childReply[j].noticeReplyNo + ')">' + '취소' + '</button>'
					// 							+ '</div>'
					// 							+ '</div>'
													
					// 					}
														
					// 				}
									
					// 				// 댓글 그리기
					// 				str1 += '<div id="notice-reply-content'+ list[i].noticeReplyNo +'" class="notice-reply-content">'
					// 							+ '<div class="notice-reply-writer">' + list[i].empName
					// 							+ '<div id="notice-reply-middle-right'+ list[i].noticeReplyNo +'" class="notice-reply-middle-right">' + str2 +'</div>'
					// 							+ '</div>'
					// 							+ '<div class="notice-reply">' + '<pre>' + list[i].noticeReplyContent + '</pre>' + '</div>'
					// 							+ '<div class="notice-reply-date">' + list[i].noticeReplyCreateDate 
					// 							+ 	'<div class="notice-reply-parent">' + '<button onclick="appendReply('+ list[i].noticeReplyNo +')">' + '답글쓰기' + '</button>' + '</div>'
					// 							+ '</div>'
												
					// 							+ '<div class="notice-reply-parent-content-all">'
					// 								// 대댓글 그리기
					// 								// 답글 쓰기 수정 클릭시 textarea 불러오기
					// 								+ str3
					// 							+ '</div>'
												
					// 						+ '</div>'

					// 						// 댓글 수정시 기존 내용이 담긴 textarea display 불러오기
					// 						+ '<div id="appendReplyUpdate'+ list[i].noticeReplyNo +'" class="notice-reply-write-area" style="display: none;">'
					// 						+ '<div class="notice-reply-write-writer">' + list[i].empName + '</div>'
					// 						+ '<div class="notice-reply-write-content">'
					// 						+ 	'<textarea id="content' + i + '" class="replyContentUpdate" cols="100">' + list[i].noticeReplyContent + '</textarea>'
					// 						+ '</div>'
					// 						+ '<div class="notice-reply-write-btn">'
					// 						+ '<button onclick="addReplyUpdate(' + list[i].noticeReplyNo + ',' + "'" + 'content' + i + "'" + ')">' + '수정' + '</button>'
					// 						+ '<button id="addReplyCancel" onclick="addReplyCancel()">' + '취소' + '</button>'
					// 						+ '</div>'
					// 						+ '</div>'
											
											
					// 						// 답글 쓰기 클릭시 댓글 아래 빈 textarea 불러오기
					// 						+ '<div id="appendReply'+ list[i].noticeReplyNo +'" class="notice-reply-parent-bottom" style="display: none;">'
					// 						+ '<div class="notice-reply-write-area">'
					// 						+ '<div class="notice-reply-write-writer">' + '${loginUser.empName}' + '</div>'
					// 						+ '<div class="notice-reply-write-content">'
					// 						+ 	'<textarea id="contentChildReply'+i+'" rows="1" cols="100">' + '</textarea>'
					// 						+ '</div>'
					// 						+ '<div class="notice-reply-write-btn">'
					// 						+ '<button onclick="addChildReply(' + list[i].noticeReplyNo + ',' + list[i].childReply.parentReplyNo + ', '+i+')">' + '등록' + '</button>'
					// 						+ '<button id="addReplyCancel" onclick="addChildReplyCancel2('+ list[i].noticeReplyNo +')">' + '취소' + '</button>'
					// 						+ '</div>'
					// 						+ '</div>'
					// 						+ '</div>'
												
											
					// 						// 대댓글 비워주기
					// 						str3 = "";
					// 						str4 = "";
					// 						str5 = "";
											
					// 			}
					// 			// 부모 댓글 추가한 후, 해당 부모 댓글의 요소를 변경하려면
					// 			document.querySelector("#notice-reply").innerHTML = str1;
								
					// 			const totalCount = list.reduce((acc, item) => acc + item.childReply.length, list.length);
					// 			document.querySelector("#rcount").innerHTML = totalCount;
								
								
					// 			/* ----- textare 높이 자동 조절 ----- */
					// 			const DEFAULT_HEIGHT = 5;
					// 			document.querySelectorAll('textarea').forEach(($textarea) => {
					// 			    $textarea.addEventListener('input', (event) => {
					// 			        const $target = event.target;
					// 			        $target.style.height = 0;
					// 			        $target.style.height = DEFAULT_HEIGHT + $target.scrollHeight + 'px';
					// 			    })
					// 			})
								
					// 			// replyContentUpdate 클래스를 가진 textarea에 대해 높이를 자동으로 조절하는 코드
					// 			document.querySelectorAll('.replyContentUpdate').forEach(($textarea) => {
					// 			    $textarea.style.height = 'auto';
					// 			    $textarea.addEventListener('input', (event) => {
					// 			        const $target = event.target;
					// 			        $target.style.height = 'auto';
					// 			        $target.style.height = $target.scrollHeight + 'px';
					// 			    })
					// 			})

					// 		},
					// 		error: function(){
					// 			console.log("rlist.no ajax통신 실패");
					// 		}
					// 	})
					// }
					

					/* -----답글 쓰기 버튼 ----- */
					let currentlyShownReply = null;

					function appendReply(num) {
					    let replyElement = document.querySelector('#appendReply' + num);
					    let replyUpdateBtn = document.querySelector('#appendReplyUpdate' + num);
					    
					    if (replyUpdateBtn && replyUpdateBtn.style.display === 'block') {
					    	replyUpdateBtn.style.display = 'none';
					    }

					    if (replyElement) {
					        if (currentlyShownReply === replyElement && replyElement.style.display === 'block') {
					            replyElement.style.display = 'none';
					            currentlyShownReply = null;
					        } else {
					            if (currentlyShownReply) {
					                currentlyShownReply.style.display = 'none';
					            }
					            replyElement.style.display = 'block';
					            currentlyShownReply = replyElement;
					        }
					    }
					}
					
					/* -----답글 쓰기 취소 버튼 ----- */
					function addChildReplyCancel2(num){
						let appendReplyElement = document.querySelector('#appendReply' + num);
					    if (appendReplyElement) {
					        appendReplyElement.style.display = 'none';
					    }
					}
					
					
					/* ----- 댓글 수정 버튼 클릭 ----- */
					// 클릭한 댓글의 ID를 추적할 변수를 전역 범위에서 선언합니다.
					let currentReplyId = null;
					
					// 수정 버튼 클릭
					function noticeReplyUpdate(num) {
						// 수정하려고 보여주는 : 기존 내용이 담긴 댓글 textarea 영역
					    let replyUpdateBtn = document.querySelector('#appendReplyUpdate' + num);
						// 기존에 그려주는 댓글 영역
					    let noticeReplyContent = document.getElementById('notice-reply-content' + num);
						// 답글쓰기 버튼 누름
					    let appendReplyElement = document.querySelector('#appendReply' + num);
					    
						console.log(appendReplyElement)
					    if (appendReplyElement && appendReplyElement.style.display === 'block') {
					        appendReplyElement.style.display = 'none';
					    }
					    
					    // 현재 보여지는 수정창이 없거나, 다른 댓글을 클릭했을 경우
					    if (currentReplyId !== num || !replyUpdateBtn.style.display || replyUpdateBtn.style.display === 'none') {
					        // 현재 보여지고 있는 수정창을 숨깁니다.
					        hideCurrentReplyUpdate();
					        // 클릭한 댓글의 수정창을 보여줍니다.
					        replyUpdateBtn.style.display = 'block';
					        // 현재 클릭한 댓글의 ID를 추적합니다.
					        currentReplyId = num;
					    } else {
					        // 현재 클릭한 댓글의 수정창을 숨깁니다.
					        hideCurrentReplyUpdate();
					        // ID 추적 변수를 초기화합니다.
					        currentReplyId = null;
					    }

					    // 댓글 내용의 화면 표시 여부를 변경합니다.
					    if (noticeReplyContent) {
					        if (noticeReplyContent.style.display === 'none') {
					            noticeReplyContent.style.display = 'block';
					        } else {
					            noticeReplyContent.style.display = 'none';
					        }
					    }
					}

					// 현재 보여지는 수정창을 숨기는 함수
					function hideCurrentReplyUpdate() {
					    if (currentReplyId !== null) {
					        let currentReplyUpdateBtn = document.querySelector('#appendReplyUpdate' + currentReplyId);
					        if (currentReplyUpdateBtn) {
					            currentReplyUpdateBtn.style.display = 'none';
					        }

					        let currentNoticeReplyContent = document.getElementById('notice-reply-content' + currentReplyId);
					        if (currentNoticeReplyContent) {
					            currentNoticeReplyContent.style.display = 'block';
					        }
					    }
					}
					
					
					
					/* ----- 댓글 수정창 취소 버튼 클릭시 ----- */
					function addReplyCancel() {
					    let appendReplyUpdate = document.querySelectorAll('[id^=appendReplyUpdate]');
					    appendReplyUpdate.forEach(element => {
					        element.style.display = 'none';
					        let noticeReplyContentId = 'notice-reply-content' + element.id.slice(-1);
					        let noticeReplyContent = document.getElementById(noticeReplyContentId);
					        if (noticeReplyContent) {
					            noticeReplyContent.style.display = 'block';
					        }
					    })
					}
					
					/* ----- 댓글 수정 기능 ----- */
					function addReplyUpdate(noticeReplyNo, content){
					    $.ajax({
					        url: "rupdate.no",
					        data: {
					            noticeReplyNo: noticeReplyNo,
					            noticeReplyContent: document.getElementById(content).value
					        },
					        success: function(result){
					        	selectReplyList();
					        },
					        error: function(){
					            console.log("rupdate.no ajax통신 실패");
					        }
					    })    
					}
					
					/* ----- 댓글 삭제 기능 ----- */
					function noticeReplyDelete(noticeReplyNo){
						$.ajax({
							url: "rdelete.no",
							data: {
								noticeReplyNo: noticeReplyNo
							},
							success: function(result){
								selectReplyList();
								console.log(result);
							},
					        error: function(){
					            console.log("rdelete.no ajax통신 실패");
					        }
						})
					}

					/* ----- 댓글 쓰기 기능 ----- */
					function addReply(){
						$.ajax({
							url: "rinsert.no",
							data: {
								noticeNo: '${n.noticeNo}',
								empNo: '${loginUser.empNo}',
								noticeReplyContent: $("#contentReply").val()
							},
							success: function(res){
								console.log(res);
								
								if (res === "success"){
									selectReplyList();
									$("#contentReply").val("");
								}
							},
							error: function(){
								console.log("rinsert.no ajax통신 실패");
							}
						})
					}
					
					/* ----- 답글 수정 버튼 클릭 ----- */
					function noticeChildReplyUpdate(num) {
						
						// 대댓글 보여주는 곳
					    let noticeReplyMiddleRightElement = document.getElementById("notice-child-reply-content" + num);
					    // 기존 내용이 담긴 textarea
					    let appendChildReplyUpdateElement = document.getElementById("appendChildReplyUpdate" + num);
						
					    console.log(appendChildReplyUpdateElement);
					    
					    if (noticeReplyMiddleRightElement.style.display === "none") {
					        noticeReplyMiddleRightElement.style.display = "block";
					        appendChildReplyUpdateElement.style.display = "none";
					    } else {
					        noticeReplyMiddleRightElement.style.display = "none";
					        appendChildReplyUpdateElement.style.display = "block";
					    }
					}
					
					
					/* ----- 답글 수정창 취소 버튼 클릭시 ----- */
					function addChildReplyCancel(num) {
					    let appendReplyUpdate = document.querySelectorAll('[id^=appendChildReplyUpdate]');
					    appendReplyUpdate.forEach(element => {
					        element.style.display = 'none';
					        let noticeReplyContentId = 'notice-child-reply-content' + element.id.slice(-1);
					        let noticeReplyContent = document.getElementById(noticeReplyContentId);
					        if (noticeReplyContent) {
					            noticeReplyContent.style.display = 'block';
					        }
					    })
					}
					
					
					/* ----- 답글 수정 기능 ----- */					
					function appendChildReplyUpdate(noticeReplyNo, childReplyContent){
					    $.ajax({
					        url: "crupdate.no",
					        data: {
					            noticeReplyNo: noticeReplyNo,
					            noticeReplyContent: document.getElementById(childReplyContent).value
					        },
					        success: function(result){
					        	selectReplyList();
					        },
					        error: function(){
					            console.log("crupdate.no ajax통신 실패");
					        }
					    })    
					}	
					
					/* ----- 답글 삭제 기능 ----- */
					function noticeChildReplyDelete(noticeReplyNo){
						$.ajax({
							url: "crdelete.no",
							data: {
								noticeReplyNo: noticeReplyNo
							},
							success: function(result){
								selectReplyList();
							},
					        error: function(){
					            console.log("crdelete.no ajax통신 실패");
					        }
						})
					}
					
					/* ----- 답글 쓰기 기능 ----- */
					function addChildReply(noticeReplyNo, parentReplyNo, num){
						console.log(noticeReplyNo,parentReplyNo,num)
						$.ajax({
							url: "crinsert.no",
							data: {
								noticeNo: '${n.noticeNo}',
								noticeReplyNo: noticeReplyNo,
					            parentReplyNo: parentReplyNo,
								empNo: '${loginUser.empNo}',
								noticeReplyContent: $("#contentChildReply"+ num).val()
							},
							success: function(res){
								console.log(res);
								
								if (res === "success"){
									selectReplyList();
									$("#contentChildReply"+num).val("");
								}
							},
							error: function(){
								console.log("crinsert.no ajax통신 실패");
							}
						})
					}
				
					/* ----- textare 높이 자동 조절 ----- */
					const DEFAULT_HEIGHT = 5; // textarea 기본 height
					const $textarea = document.querySelector('#contentReply');
	
					$textarea.oninput = (event) => {
					  const $target = event.target;
	
					  $target.style.height = 0;
					  $target.style.height = DEFAULT_HEIGHT + $target.scrollHeight + 'px';
					}
					
				
				</script>
				 -->
				
			</div><!-- <div class="notice-detail-view"> -->

		</div><!-- <div class="notice-detail-area"> -->
	</div><!-- <div class="menu"> -->

</body>
</html>