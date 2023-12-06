<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<!-- CSS -->
<link rel="stylesheet" href="resources/notice/css/notice-detail-view.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />

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
					
						<c:if test="${loginUser.empNo eq n.empNo }">
							<button class="notice-update-btn">수정</button>
							<div>|</div>
							<button class="notice-delete-btn">삭제</button>
						</c:if>
						
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
				<!-- <div class="notice-reply-area">
					<div class="notice-reply-top">
						댓글 (<span id="rcount">3</span>)
					</div>
					<div class="notice-reply-middle">
						<div class="notice-reply-content">
							<div class="notice-reply-writer">
								김나나 사원
							</div>
							<div class="notice-reply">
								확인하였습니다~
							</div>
							<div class="notice-reply-date">
								2023-11-05
								<div class="notice-reply-parent">
									<button type="">답글쓰기</button>
								</div>
							</div>
						</div>
						<div class="notice-reply-content">
							<div class="notice-reply-writer">
								김다다 대리
								<div class="notice-reply-middle-right">
									<button class="notice-reply-update-btn">수정</button>
									<div>|</div>
									<button class="notice-reply-delete-btn">삭제</button>
								</div>
							</div>
							<div class="notice-reply">
								확인하였습니다~
							</div>
							<div class="notice-reply-date">
								2023-11-12
								<div class="notice-reply-parent">
									<button type="">답글쓰기</button>
								</div>
							</div>
						</div>
						<div class="notice-reply-content">
							<div class="notice-reply-writer">
								김라라 사원
							</div>
							<div class="notice-reply">
								확인하였습니다~
							</div>
							<div class="notice-reply-date">
								2023-11-20
								<div class="notice-reply-parent">
									<button type="">답글쓰기</button>
								</div>
							</div>
						</div>
						
						<div class="notice-reply-parent-content-area">
							<div class="notice-reply-parent-writer">
								김다다 사원
							</div>
							<div class="notice-reply-parent-content">
								확인하신거 맞죠?
							</div>
							<div class="notice-reply-parent-date">
								2023-11-20
								<div class="notice-reply-parent"> 클래스명 바꿀지
									<button type="">답글쓰기</button>
								</div>
							</div>
						</div>
						<div class="notice-reply-parent-content-area">
							<div class="notice-reply-parent-writer">
								최길동 강사
								<div class="notice-reply-middle-right">
									<button class="notice-reply-update-btn">수정</button>
									<div>|</div>
									<button class="notice-reply-delete-btn">삭제</button>
								</div>
							</div>
							<div class="notice-reply-parent-content">
								알겠습니다.
							</div>
							<div class="notice-reply-parent-date">
								2023-11-20
								<div class="notice-reply-parent"> 클래스명 바꿀지
									<button type="">답글쓰기</button>
								</div>
							</div>
						</div>
						
						<div class="notice-reply-content">
							<div class="notice-reply-writer">
								김나나 대리
							</div>
							<div class="notice-reply">
								확인하였습니다~!
							</div>
							<div class="notice-reply-date">
								2023-11-23
								<div class="notice-reply-parent">
									<button type="">답글쓰기</button>
								</div>
							</div>
						</div>
					</div>
					<div class="notice-reply-bottom">
						<div class="notice-reply-write-area">
							<div class="notice-reply-write-writer">
								김갑수 과장
							</div>
							<div class="notice-reply-write-content">
								<textarea rows="2" cols="100" placeholder="댓글을 입력해주세요" style="overflow: hidden"></textarea>
							</div>
							<div class="notice-reply-write-btn">
								<button>등록</button>
							</div>
						</div>
					</div>
				</div> -->
				
				
				
			</div>
			
			
		</div>
	</div>

</body>
</html>