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

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
						${n.noticeContent}
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
						
						<!-- 대댓글영역 
						<div id="parent-reply" class="notice-reply-parent-content-area">
							<div class="notice-reply-parent-writer">
								
							</div>
							<div class="notice-reply-parent-content">
								
							</div>
							<div class="notice-reply-parent-date">
								
								<div class="notice-reply-parent">
									<button type=""></button>
								</div>
							</div> 
						</div>-->
						
						
					</div> 
					
					<!-- 댓글작성영역 -->
					<div class="notice-reply-bottom">
						<div class="notice-reply-write-area">
							<div class="notice-reply-write-writer">${loginUser.empName}</div>
							<div class="notice-reply-write-content">
								<textarea id="contentReply" cols="100" placeholder="댓글을 입력해주세요" style="overflow-x:hidden; overflow-y:auto;"></textarea>
							</div>
							<div class="notice-reply-write-btn">
								<button onclick="addReply();">등록</button>
							</div>
						</div>
					</div>
				</div>
				
				<script>
					$(function(){
						// 댓글 조회하는 함수 호출
						selectReplyList();
					})
					
					/* 댓글 그려주기 */
					function selectReplyList(){
						$.ajax({
							url: "rlist.no",
							data: {
								nno: '${n.noticeNo}'
							},
							success: function(result){
								console.log(result);
								console.log(result.list);

								console.log(result.list.length);
								console.log(result.loginUser);
								
								let str1="";
								let str2="";
								let str3 = "";

								for (let i = 0; i < result.list.length; i++){
								if (result.loginUser === result.list[i].empNo) {
									str2 = '<button class="notice-reply-update-btn" onclick="noticeReplyUpdate('+ i +')">' + '수정' + '</button>'
											+ '<div>' + '|' + '</div>'
											+ '<button class="notice-reply-delete-btn" onclick="noticeReplyDelete(' + result.list[i].noticeReplyNo + ')">' + '삭제' + '</button>'
									}

									str1 += '<div id="notice-reply-content'+ result.list[i].noticeReplyNo +'" class="notice-reply-content">'
											/* += '<div id="parent-reply'+ result.list[i].noticeReplyNo +'" class="notice-reply-parent-content-area">' */
												+ '<div class="notice-reply-writer">' + result.list[i].empName
												+ '<div id="notice-reply-middle-right'+ i +'" class="notice-reply-middle-right">' + str2 +'</div>'
												+ '</div>'
												+ '<div class="notice-reply">' + result.list[i].noticeReplyContent + '</div>'
												+ '<div class="notice-reply-date">' + result.list[i].noticeReplyCreateDate 
												+ 	'<div class="notice-reply-parent">' + '<button onclick="appendReply('+ i +')">' + '답글쓰기' + '</button>' + '</div>'
												+ '</div>'
	
											+ '</div>'
											
											+ '<div id="appendReplyUpdate'+ i +'" class="notice-reply-write-area" style="display: none;">'
											+ '<div class="notice-reply-write-writer">' + result.list[i].empName + '</div>'
											+ '<div class="notice-reply-write-content">'
											+ 	'<textarea id="content' + i + '" rows="1" cols="100">' + result.list[i].noticeReplyContent + '</textarea>'
											+ '</div>'
											+ '<div class="notice-reply-write-btn">'
											+ '<button onclick="addReplyUpdate(' + result.list[i].noticeReplyNo + ',' + "'" + 'content' + i + "'" + ')">' + '수정' + '</button>'
											+ '<button id="addReplyCancel" onclick="addReplyCancel()">' + '취소' + '</button>'
											+ '</div>'
											+ '</div>'
											
											
											+ '<div class="notice-reply-parent-bottom" style="display: none;" id="appendReply'+ i +'">'
											+ '<div class="notice-reply-write-area">'
											+ '<div class="notice-reply-write-writer">' + '${loginUser.empName}' + '</div>'
											+ '<div class="notice-reply-write-content">'
											+ 	'<textarea id="content" rows="1" cols="100" placeholder="댓글을 입력해주세요">' + '</textarea>'
											+ '</div>'
											+ '<div class="notice-reply-write-btn">'
											+ '<button onclick="addReply();">' + '등록' + '</button>'
											+ '</div>'
											+ '</div>'
											+ '</div>'
											
									// 대댓글 조회			
									if (result.list[i].parentReplyNo !== null) {
								        // 부모 댓글에 해당하는 경우 str3에 부모 댓글 형태를 추가
								        str3 += '<div id="parent-reply' + result.list[i].parentReplyNo + '" class="notice-reply-parent-content-area">'
								             + '<div class="notice-reply-parent-writer">' + result.list[i].empName + '</div>'
								             + '<div class="notice-reply-parent-content">' + result.list[i].noticeReplyContent + '</div>'
								             + '<div class="notice-reply-parent-date">' + result.list[i].noticeReplyCreateDate
								             + '<div class="notice-reply-parent">' + str2 + '</div>'
								             + '</div>'
								             + '</div>';
								    }
											
									
								}
								// 부모 댓글 추가한 후, 해당 부모 댓글의 요소를 변경하려면
								document.querySelector("#notice-reply").innerHTML += str1;
								document.querySelector("#rcount").innerHTML = result.list.length;

								// 추가한 부모 댓글을 본문에 삽입
								document.querySelector("#parent-reply").innerHTML = str3;
								
								/* if (result.list[i].parentReplyNo !== null) {
								    // 대댓글을 부모 댓글로 변경
								    // document.querySelector("#parent-reply" + result.list[i].parentReplyNo).innerHTML = str3;
								    str3 = str1.replace('notice-reply-content', 'parent-reply');
								} */
								
								// 대댓글 조회
								/* let str4 = "";
								let str3 = "";
								for (let i = 0; i < result.list.length; i++){
								if (result.loginUser === result.list[i].empNo) {
									str4 = '<button class="notice-reply-update-btn" onclick="noticeReplyUpdate('+ i +')">' + '수정' + '</button>'
											+ '<div>' + '|' + '</div>'
											+ '<button class="notice-reply-delete-btn" onclick="noticeReplyDelete(' + result.list[i].noticeReplyNo + ')">' + '삭제' + '</button>'
									}
									
									str3 += '<div id="parent-reply' + result.list[i].parentReplyNo + '" class="notice-reply-parent-content-area">'
										 + '<div class="notice-reply-parent-writer">' + result.list[i].empName + '</div>'
										 + '<div class="notice-reply-parent-content">' + result.list[i].noticeReplyContent + '</div>'
										 + '<div class="notice-reply-parent-date">' + result.list[i].noticeReplyCreateDate
										 + '<div class="notice-reply-parent">' + str4 + '</div>'
										 + '</div>'
										 + '</div>'	
								}
								// 부모 EL찾아서 밑에 넣어주기
								if (result.list[i].parentReplyNo != 0) {
								    // 대댓글을 부모 댓글로 변경
								    str3 = str3.replace('notice-reply-content', 'parent-reply');
								} */
								
								
				               /* let selectEl = document.querySelector('#parent-reply' + result.list[i].parentReplyNo);
				               selectEl.insertAdjacentHTML('afterend', str3); */
				               
				               
				               
								
				               
				               
								
							},
							error: function(){
								console.log("rlist.no ajax통신 실패");
							}
						})
					}
					
					
					
					
					
					
					
					
					
					
					
					
				   // 댓글, 대댓글 리스트 조회
/* 				   function selectReplyList(bno){
				      let loginUserEmpNo = '${loginUser.empNo}';
				      $.ajax({
				         url: "replyList.com",
				         data:{
				            bno: bno
				         },
				         success: function(res){
				            let reList = res.reList;
				            let reReList = res.reReList;

				            let str = "";
				            for (let list of reList){
				               str += '<tr class="reply-table-tr" id="rNo' + list.communityReplyNo + '">' +
				                        '<td class="reply-name">'+ list.empName +'</td>' +
				                        '<td class="reply-content">' + list.communityReplyComment + '</td>' +
				                        '<td class="reply-update-date-area">'
				               if(list.empNo == loginUserEmpNo){
				                  str += '<div class="reply-update-area">' +
				                              '<div>수정</div>' +
				                              '<div>|</div>' +
				                              '<div>삭제</div>' +
				                        '</div>'
				               } else{
				                  str += '<div class="reply-update-area"></div>'
				               }

				                  str += '<div class="replyDate">'+ list.communityReplyCreateDate +'</div>' +
				                        '</td>' +
				                     '</tr>'      
				            }
				            const check = document.querySelector(".reply-table")
				            document.querySelector(".reply-table").innerHTML = str;

				            // 대댓글 조회
				            for (let list of reReList){
				               let str2 = '<tr class="reReply-table-tr" id="rNo' + list.communityReplyNo + '">' +
				                        '<td class="reply-name">'+ list.empName +'</td>' +
				                        '<td class="reply-content">' + list.communityReplyComment + '</td>' +
				                        '<td class="reply-update-date-area">'
				                  if(list.empNo == loginUserEmpNo){
				                     str2 += '<div class="reply-update-area">' +
				                                 '<div>수정</div>' +
				                                 '<div>|</div>' +
				                                 '<div>삭제</div>' +
				                           '</div>'
				                  } else{
				                     str2 += '<div class="reply-update-area"></div>'
				                  }
				                     str2 += '<div class="replyDate">'+ list.communityReplyCreateDate +'</div>' +
				                           '</td>' +
				                        '</tr>'   

				               // 부모 EL찾아서 밑에 넣어주기
				               let selectEl = document.querySelector('#rNo' + list.parentReplyNo);
				               selectEl.insertAdjacentHTML('afterend', str2);
				            }


				         },
				         error : function(){
				            console.log("실패")
				         }
				      })

				   } */
					

				   
				   
				   
					
					/* 답글 쓰기 버튼 */
					let currentlyShownReply = null;

					function appendReply(num) {
					    let replyElement = document.querySelector('#appendReply' + num);

					    if (replyElement) {
					        if (currentlyShownReply === replyElement && replyElement.style.display === 'block') {
					            // 이미 보여지는 영역의 버튼을 다시 클릭하면 영역을 숨김 처리
					            replyElement.style.display = 'none';
					            currentlyShownReply = null; // 보여지는 영역 없음으로 설정
					        } else {
					            if (currentlyShownReply) {
					                // 현재 보여지고 있는 답글 영역이 있다면 숨김 처리
					                currentlyShownReply.style.display = 'none';
					            }
					            // 클릭된 버튼에 해당하는 답글 영역을 보여줌
					            replyElement.style.display = 'block';
					            currentlyShownReply = replyElement;
					        }
					    }
					}
					
					/* 수정 버튼 클릭 */
					function noticeReplyUpdate(num){
						let replyUpdateBtn = document.querySelector('#appendReplyUpdate' + num);
						let noticeReplyContent = document.getElementById('notice-reply-content' + num);
					    
					    if (replyUpdateBtn.style.display === 'none') {
					    	replyUpdateBtn.style.display = 'block';
					    	noticeReplyContent.style.display = 'none';
					    } else {
					    	replyUpdateBtn.style.display = 'none';
					    	noticeReplyContent.style.display = 'block';
					    }
		
					}
					
					/* 취소 버튼 클릭시  */
					function addReplyCancel() {
					    let appendReplyUpdate = document.querySelectorAll('[id^=appendReplyUpdate]');
					    appendReplyUpdate.forEach(element => {
					        element.style.display = 'none';
					        let noticeReplyContentId = 'notice-reply-content' + element.id.slice(-1);
					        let noticeReplyContent = document.getElementById(noticeReplyContentId);
					        if (noticeReplyContent) {
					            noticeReplyContent.style.display = 'block';
					        }
					    });
					}
					
					/* 댓글 수정 기능 */
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
					
					/* 댓글 삭제 기능 */
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

					/* 댓글 쓰기 기능 */
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
				
				
				</script>
				
				
			</div><!-- <div class="notice-detail-view"> -->

		</div><!-- <div class="notice-detail-area"> -->
	</div><!-- <div class="menu"> -->

</body>
</html>