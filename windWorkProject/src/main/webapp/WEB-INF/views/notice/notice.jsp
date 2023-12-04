<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- CSS -->
<link rel="stylesheet" href="resources/notice/css/notice.css">

<!-- bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
	
	<div class="menu">
		<div class="notice-area">
			<div class="notice-top">공지사항</div>
			
			<!-- 작성하기 버튼 -->
			<div class="notice-write-top">
				<div class="notice-write">
					<button class="notice-write-btn" type="button">작성하기</button>
				</div>
			</div>
				
			<!-- 공지사항 리스트 -->
			<div class="notice-content">
				<table class="notice-table">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>10</td>
							<td>
								<div class="notice-title">
								사내 체육대회 전체 안내
									<div class="notice-attachment-icon">
										<ion-icon class="attachment-icon" name="document-attach-outline"></ion-icon>
									</div>
									<div class="notice-reply-count">
										<span id="rcount">[9]</span>
									</div>
								</div>
							</td>

							<td>김과장</td>
							<td>285</td>
							<td>2023-11-23</td>
						</tr>
						<tr>
							<td>09</td>
							<td>
								<div class="notice-title">
								사내 체육대회 전체 안내
									<div class="notice-attachment-icon">
										
									</div>
									<div>
										<span id="rcount">[8]</span>
									</div>
								</div>
							</td>
							<td>박과장</td>
							<td>285</td>
							<td>2023-11-20</td>
						</tr>
						<tr>
							<td>08</td>
							<td>
								<div class="notice-title">
								사내 체육대회 전체 안내
									<div class="notice-attachment-icon">
										
									</div>
									<div>
										<span id="rcount">[2]</span>
									</div>
								</div>
							</td>
							<td>권과장</td>
							<td>444</td>
							<td>2023-11-02</td>
						</tr>
						<tr>
							<td>07</td>
							<td>
								<div class="notice-title">
								사내 체육대회 전체 안내
									<div class="notice-attachment-icon">
										<ion-icon class="attachment-icon" name="document-attach-outline"></ion-icon>
									</div>
									<div>
										<span id="rcount">[9]</span>
									</div>
								</div>
							</td>
							<td>최사원</td>
							<td>124</td>
							<td>2023-11-02</td>
						</tr>
						<tr>
							<td>06</td>
							<td>
								<div class="notice-title">
								사내 체육대회 전체 안내
									<div class="notice-attachment-icon">
										
									</div>
									<div>
										<span id="rcount"></span>
									</div>
								</div>
							</td>
							<td>김대리</td>
							<td>285</td>
							<td>2023-08-17</td>
						</tr>
						<tr>
							<td>05</td>
							<td>
								<div class="notice-title">
								사내 체육대회 전체 안내
									<div class="notice-attachment-icon">
										
									</div>
									<div>
										<span id="rcount">[5]</span>
									</div>
								</div>
							</td>
							<td>김대리</td>
							<td>285</td>
							<td>2023-08-17</td>
						</tr>
						<tr>
							<td>04</td>
							<td>
								<div class="notice-title">
								사내 체육대회 전체 안내
									<div class="notice-attachment-icon">
										
									</div>
									<div>
										<span id="rcount"></span>
									</div>
								</div>
							</td>
							<td>김대리</td>
							<td>285</td>
							<td>2023-08-17</td>
						</tr>
						<tr>
							<td>03</td>
							<td>
								<div class="notice-title">
								사내 체육대회 전체 안내
									<div class="notice-attachment-icon">
										
									</div>
									<div>
										<span id="rcount"></span>
									</div>
								</div>
							</td>
							<td>김대리</td>
							<td>285</td>
							<td>2023-08-17</td>
						</tr>
						<tr>
							<td>02</td>
							<td>
								<div class="notice-title">
								사내 체육대회 전체 안내
									<div class="notice-attachment-icon">
										
									</div>
									<div>
										<span id="rcount"></span>
									</div>
								</div>
							</td>
							<td>김대리</td>
							<td>285</td>
							<td>2023-08-17</td>
						</tr>
						<tr>
							<td>01</td>
							<td>
								<div class="notice-title">
								사내 체육대회 전체 안내
									<div class="notice-attachment-icon">
										
									</div>
									<div>
										<span id="rcount"></span>
									</div>
								</div>
							</td>
							<td>김대리</td>
							<td>285</td>
							<td>2023-08-17</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<!-- 페이지네이션 -->
			<div class="notice-pagenation">
				<ul class="pagination">
					<li class="page-item disabled"><a class="page-link" href="#"><</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">></a></li>
				</ul>
			</div>
		</div>
	</div>
	
</body>
</html>