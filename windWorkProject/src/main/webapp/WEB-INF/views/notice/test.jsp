<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

// 댓글 반복문 돌기
								for (let i = 0; i < list.length; i++){

									// 로그인유저만 수정,삭제 보이기
									if (result.loginUser === list[i].empNo) {
										str2 = '<button class="notice-reply-update-btn" onclick="noticeReplyUpdate('+ i +')">' + '수정' + '</button>'
											 + '<div>' + '|' + '</div>'
											 + '<button class="notice-reply-delete-btn" onclick="noticeReplyDelete(' + list[i].noticeReplyNo + ')">' + '삭제' + '</button>'
										}
									
									// 대댓글 반목문 돌기
									for (let j = 0; j < list[i].childReply.length; j++) {
										
										
										// 답글 수정시 textarea display 불러오기
										+ '<div id="appendChildReplyUpdate'+ i +'" class="notice-reply-write-area">'
										+ '<div class="notice-reply-write-writer">' + list[i].childReply[j].empName + '</div>'
										+ '<div class="notice-reply-write-content">'
										+ 	'<textarea id="content' + i + '" class="replyContentUpdate" cols="100">' + list[i].childReply[j].noticeReplyContent + '</textarea>'
										+ '</div>'
										+ '<div class="notice-reply-write-btn">'
										+ '<button onclick="appendChildReplyUpdate(' + list[i].childReply[j].noticeReplyNo + ',' + "'" + 'content' + i + "'" + ')">' + '수정' + '</button>'
										+ '<button id="addReplyCancel" onclick="addReplyCancel()">' + '취소' + '</button>'
										+ '</div>'
										+ '</div>'
										
										// 로그인유저만 수정,삭제 보이기
										let childIndex = j; // 대댓글의 인덱스를 변수에 저장
										if (result.loginUser === list[i].childReply[j].empNo) {
											str4 = '<button class="notice-reply-update-btn" onclick="noticeChildReplyUpdate(' + i + ',' + childIndex + ')">' + '수정' + '</button>'
												 + '<div>' + '|' + '</div>'
												 + '<button class="notice-reply-delete-btn" onclick="noticeChildReplyDelete(' + list[i].childReply[j].noticeReplyNo + ')">' + '삭제' + '</button>'
											}
											
										if (list[i].childReply.length !== 0) {
											str3 += '<div class="notice-reply-parent-writer">' + list[i].childReply[j].empName 
												 + '<div id="notice-reply-middle-right'+ i +'" class="notice-reply-middle-right">' + str4 +'</div>'
												 + '</div>'
									             + '<div class="notice-reply-parent-content">' + '<pre>' + list[i].childReply[j].noticeReplyContent + '</pre>' + '</div>'
									             + '<div class="notice-reply-parent-date">' + list[i].childReply[j].noticeReplyCreateDate
									             + '</div>'
										}
										
											
									}
									
									// 댓글 그리기
									str1 += '<div id="notice-reply-content'+ i +'" class="notice-reply-content">'
												+ '<div class="notice-reply-writer">' + list[i].empName
												+ '<div id="notice-reply-middle-right'+ i +'" class="notice-reply-middle-right">' + str2 +'</div>'
												+ '</div>'
												+ '<div class="notice-reply">' + '<pre>' + list[i].noticeReplyContent + '</pre>' + '</div>'
												+ '<div class="notice-reply-date">' + list[i].noticeReplyCreateDate 
												+ 	'<div class="notice-reply-parent">' + '<button onclick="appendReply('+ i +')">' + '답글쓰기' + '</button>' + '</div>'
												+ '</div>'
												
												+ '<div id="notice-child-reply-content'+ i +'" class="notice-reply-parent-content-area">'
													+ str3
												+ '</div>'
											+ '</div>'

											// 댓글 수정시 textarea display 불러오기
											+ '<div id="appendReplyUpdate'+ i +'" class="notice-reply-write-area" style="display: none;">'
											+ '<div class="notice-reply-write-writer">' + list[i].empName + '</div>'
											+ '<div class="notice-reply-write-content">'
											+ 	'<textarea id="content' + i + '" class="replyContentUpdate" cols="100">' + list[i].noticeReplyContent + '</textarea>'
											+ '</div>'
											+ '<div class="notice-reply-write-btn">'
											+ '<button onclick="addReplyUpdate(' + list[i].noticeReplyNo + ',' + "'" + 'content' + i + "'" + ')">' + '수정' + '</button>'
											+ '<button id="addReplyCancel" onclick="addReplyCancel()">' + '취소' + '</button>'
											+ '</div>'
											+ '</div>'
											
											
											// 답글 쓰기 클릭시 댓글 아래 textarea 불러오기
											+ '<div class="notice-reply-parent-bottom" style="display: none;" id="appendReply'+ i +'">'
											+ '<div class="notice-reply-write-area">'
											+ '<div class="notice-reply-write-writer">' + '${loginUser.empName}' + '</div>'
											+ '<div class="notice-reply-write-content">'
											+ 	'<textarea id="contentChildReply" rows="1" cols="100">' + '</textarea>'
											+ '</div>'
											+ '<div class="notice-reply-write-btn">'
											+ '<button onclick="addChildReply(' + list[i].noticeReplyNo + ',' + list[i].childReply.parentReplyNo + ')">' + '등록' + '</button>'
											+ '</div>'
											+ '</div>'
											+ '</div>'
											
											
											// 대댓글 비워주기
											str3 = "";
											str4 = "";

</body>
</html>