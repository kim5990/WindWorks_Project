<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- CSS -->
<link rel="stylesheet" href="resources/notice/css/notice-enroll-form.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />

	<div class="menu">
		
		<div class="notice-enroll-area">
			<div class="notice-enroll-top">
				<div class="notice-enroll-icon">
					<button onclick="history.back()" class="notice-back-btn"><ion-icon class="notice-back-icon" name="chevron-back-outline"></ion-icon></button>
				</div>
				<div class="notice-enroll-text">공지사항 작성</div>
			</div>
			
			<!-- 공지사항 작성 폼 -->
			<div class="notice-enroll-form-area-top">
				<div class="notice-enroll-form-area">
					<form id="notice-enroll-form" method="post" action="insert.no" enctype="multipart/form-data">
						<input type="hidden" name="empNo" value="${loginUser.empNo}">
						<table class="notice-enroll-table">
							<tr>
								<th><label for="title">제목</label></th>
								<td><input type="text" id="title" class="notice-enroll-title" name="noticeTitle" required /></td>
							</tr>
							<tr>
		                        <th><label>파일첨부</label></th>
		                        <td>
			                        <label for="upfile" class="notice-enroll-file">
			                        	<!-- <ion-icon class="notice-enroll-file-icon" name="document-attach-outline"></ion-icon>
			                        	첨부할 파일을 선택해주세요 -->
			                        	<input type="file" id="upfile" name="upfile" value="noticeOriginName">
			                        </label>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th><label for="content">내용</label></th>
		                        <td><textarea id="content" class="notice-enroll-content" rows="12" style="resize:none;" name="noticeContent" required></textarea></td>
		                    </tr>
						</table>
						
						<!-- 등록,취소 버튼 -->
						<div class="notice-enroll-btn">
							<button type="submit" class="notice-enroll-btn-submit">등록</button>
							<button type="reset" class="notice-enroll-btn-reset">취소</button>
						</div>
						
					</form>
				</div>
			</div>
			
		
			
		</div>
	</div>

</body>
</html>