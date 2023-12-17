<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.menu{
		justify-content: space-between;
		height: 100vh;
	}
	.communityList-area1{
		width: 300px;
		border-right: 1px solid rgba(112, 112, 112, 0.177);
	}
	.communityList-area2{
		flex: 1;
		padding: 30px;
		min-width: 600px;
	}
	.communityList-area3{
		display: flex;
		flex-direction: column;
		border-left: 1px solid rgba(112, 112, 112, 0.177);
		width: 300px;
		min-width: 200px;
	}
	.communityList-area1-button-div{
		display: flex;
		justify-content: center;
	}
	.communityList-area1-button{
		margin: 40px 0;
		border: 1px solid rgb(94, 94, 94);
		background-color: white;
		border-radius: 10px;
		width: 200px;
		height: 40px;
	}
	.communityList-area1-li li{
		padding-left: 80px;
		padding-top: 7px;
		padding-bottom: 7px;
	}
	.communityList-area1-li li:hover{
		background-color: rgba(112, 112, 112, 0.177);
	}
	.communityList-area1-title{
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 10px;
	}

	.communityList-area1-title h5{
		margin: 0 0 0 50px;
		align-items: center;
		font-weight: bold;
		
	}
	.communityList-area1-title > .plus-btn{
		margin-right: 30px;
		border: 1px solid rgb(190, 190, 190);
		color: rgb(190, 190, 190);
		background-color: white;
		width: 18px;
		height: 20px;
		font-size: 13px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.communityList-area3-title{
		height: 80px;
		border-bottom: 1px solid rgba(112, 112, 112, 0.177);
		display: flex;
		justify-content: center;
		align-items: center;
		justify-content: space-between;
		margin-bottom: 30px;
	}
	.communityList-area3-title > h5{
		margin: 0 0 0 40px;
		font-weight: bold;
	}
	.communityList-area3-title > div{
		margin: 0 40px 0 0;
	}

	.communityList-area3-member{
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin-bottom: 10px;
	}
	.communityList-area3-member h5{
		margin: 0 0 0 40px;
		align-items: center;
		font-weight: bold;		
	}
	.communityList-area3-title-btn{
		margin-right: 30px;
		border: 1px solid rgb(190, 190, 190);
		color: rgb(190, 190, 190);
		background-color: white;
		width: 55px;
		height: 20px;
		font-size: 10px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.communityList-area3-title-btn2{
		border: 1px solid rgb(190, 190, 190);
		color: rgb(190, 190, 190);
		background-color: white;
		width: 55px;
		height: 20px;
		font-size: 10px;
		align-items: end;
	}
	.communityList-area3-li li{
		padding-left: 60px;
		padding-top: 6px;
		padding-bottom: 6px;
		font-size: 14px;
	}
	.communityList-area3-title-btn2-box{
		flex: 1;
		display: flex;
		align-items: end;
		justify-content: flex-end;
		margin-right: 30px;
		margin-bottom: 30px;
	}
	.communityList-area2-detail-title-area{
		display : flex;
		flex-direction: row;
		height: 120px;
	}
	.communityList-area2-detail-title-title{
		flex: 1;
		display: flex;
		flex-direction: column;
		padding-top: 15px;
		padding-bottom: 15px;
	}
	.communityList-area2-detail-title-like{
		width: 150px;
		margin-top: 20px;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.communityList-area2-detail-title-title-title{
		flex: 1;
		display: flex;
		flex-direction: row;
		align-items: center;
	}
	.communityList-area2-detail-title-title-profile{
		flex: 1;
		display: flex;
		flex-direction: row;
		align-items: center;
	}
	.back-icon{
		font-size: 35px;
		margin: 0 20px;
	}
	.detail-title{
		font-size: 30px;
		font-weight: bold;
	}
	.profile-image{
		display: flex;
		align-items: center;
		margin-right: 20px;
		margin-left: 50px;
	}
	.profile-name{
		display: flex;
		align-items: center;
		margin-right: 20px;
	}
	.profile-date{
		display: flex;
		align-items: center;
		font-size: 14px;
		color: gray;
	}
	.detail-content{
		min-height: 130px;
		padding: 40px 70px 30px 40px;
	}
	.detail-file{
		padding: 20px 40px 30px 40px;
	}
	.communityList-area2-detail-reply{
		padding: 30px;
	}

	.reply-title-area{
		display: flex;
		justify-content: space-between;
		padding: 0 10px;
	}

	.reply-table{
		width: 100%;
	}
	.reply-table-tr{
		display: flex;
		justify-content: space-between;
		padding: 3px 0;
	}

	.reply-name{
		padding-left: 30px;
		width: 80px;
	}
	.reply-content{
		width: calc(100% - 310px);
		padding-left: 20px;
	}
	.reply-update-date-area{
		display: flex;
		justify-content: space-around;
		width: 230px;
		padding-right: 30px;
	}
	.reply-update-area{
		display: flex;
		justify-content: space-around;
		width: 80px;
		font-size: 14px;
		align-items: center;
	}

</style>


</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="menu">
		<div class="communityList-area1">
			<div class="communityList-area1-button-div"><button class="communityList-area1-button">글쓰기</button></div>
			<div class="communityList-area1-title">
				<div><h5>내 커뮤니티</h5></div>
				<button class="plus-btn"><div>+</div></button>
			</div>
			<ul class="communityList-area1-li">
				<li>영업팀</li>
				<li>동갑모입</li>
				<li>20년 입사동기</li>
				<li>점심동료</li>
			</ul>
		</div>


		<div class="communityList-area2">
			<div class="communityList-area2-detail-title-area">
				<div class="communityList-area2-detail-title-title">
					<div class="communityList-area2-detail-title-title-title">
						<div class="back-icon">&lt;</div>
						<div class="detail-title">${board.communityBoardTitle}</div>
					</div>
					<div class="communityList-area2-detail-title-title-profile">
						<div class="profile-image">사진</div>
						<div class="profile-name">${board.empName}</div>
						<div class="profile-date">${board.communityBoardCreateDate}</div>
					</div>
				</div>
				<div class="communityList-area2-detail-title-like">
					<div>하트</div>
					<div>${board.communityBoardLikeCount}</div>
				</div>
			</div>


			
			<div class="communityList-area2-detail-content">
				<div class="detail-content">${board.communityBoardContent}</div>
				<div class="detail-file">
					<div>파일1</div>
					<div>파일2</div>
				</div>
			</div>
			<div class="communityList-area2-detail-reply">
				<div class="reply-title-area">
					<div>댓글(${board.communityBoardReplyCount})</div>
					<div>작성</div>
				</div>
				<hr>
				<table class="reply-table">
					<tr class="reply-table-tr">
						<td class="reply-name">김나나</td>
						<td class="reply-content">확인하였습니다~</td>
						<td class="reply-update-date-area">
							<div class="reply-update-area">
								<div>수정</div>
								<div>|</div>
								<div>삭제</div>
							</div>
							<div>2023-11-28</div>
						</td>
					</tr>
					<tr class="reply-table-tr">
						<td class="reply-name">김나나</td>
						<td class="reply-content">확인하였습니다~</td>
						<td class="reply-update-date-area">
							<div class="reply-update-area">
								<div>수정</div>
								<div>|</div>
								<div>삭제</div>
							</div>
							<div>2023-11-28</div>
						</td>
					</tr>
					<tr class="reply-table-tr">
						<td class="reply-name">김나나</td>
						<td class="reply-content">확인하였습니다~</td>
						<td class="reply-update-date-area">
							<div class="reply-update-area">
								<div>수정</div>
								<div>|</div>
								<div>삭제</div>
							</div>
							<div>2023-11-28</div>
						</td>
					</tr>
				</table>
				<hr>
			</div>
		</div>


		<div class="communityList-area3">
			<div class="communityList-area3-title">
				<h5>영업팀</h5>
				<div>톱</div>
			</div>
			<div class="communityList-area3-member">
				<div><h5>멤버</h5></div>
				<button class="communityList-area3-title-btn"><div>초대하기</div></button>
			</div>
			<ul class="communityList-area3-li">
				<li>나차장 차장</li>
				<li>박주임 주임</li>
				<li>김대리 대리</li>
				<li>이사원 사원</li>
			</ul>
			<div class="communityList-area3-title-btn2-box">
				<button class="communityList-area3-title-btn2"><div>탈퇴하기</div></button>
			</div>	
		</div>
	</div>
</body>
</html>



