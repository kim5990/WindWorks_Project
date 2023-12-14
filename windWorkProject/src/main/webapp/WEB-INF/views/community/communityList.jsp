<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>

<!-- 부트스트랩 -->
<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>

	
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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
		overflow-y: auto;
	}
	.communityList-area3{
		display: flex;
		flex-direction: column;
		border-left: 1px solid rgba(112, 112, 112, 0.177);
		width: 300px;
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
		/* margin-top: 7px;
		margin-bottom: 7px; */
		padding-top: 7px;
		padding-bottom: 7px;
	}
	.communityList-area1-li li:hover{
		cursor: pointer;
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
	/* .communityList-area3-title-btn{
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
	} */
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


	/* 보드 리스트 관련 css */
	.communityList-area2-container{
		height: 150px;
		border-bottom: 1px solid rgba(112, 112, 112, 0.177);
		display: flex;
		justify-content: space-between;
	}
	.communityList-area2-container:hover{
		cursor: pointer;
		background-color: rgba(112, 112, 112, 0.177);
		border-color: white
		
	}
	.communityList-area2-container-content{
		flex: 1;
		padding: 15px 45px;
		min-width: 300px;
		display: flex;
		flex-direction: column;
	}
	.communityList-area2-container-like{
		margin-top: 40px;
		width: 150px;
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.communityList-area2-container-content-profile{
		display: flex;
		flex-direction: row;
	}
	.communityList-area2-container-content-title{
		flex: 1;
		display: flex;
		align-items: center;
	}
	.communityList-area2-container-content-title1{
		font-weight: bold;
		font-size: 18px;
		margin-right: 18px;
	}
	.communityList-area2-container-content-title2{
		margin-right: 10px;
	}

	.communityList-area2-container-content-content{
		flex: 1;
		display: flex;
		align-items: center;


	}
	.communityList-area2-container-content-profile{
		flex: 1;
	}
	.communityList-area2-container-content-profile-image{
		display: flex;
		align-items: center;
		margin-right: 14px;
		font-size: 14px;
	}
	.communityList-area2-container-content-profile-name{
		display: flex;
		align-items: center;
		margin-right: 14px;
		font-size: 14px;
	}
	.communityList-area2-container-content-profile-date{
		display: flex;
		align-items: center;
		font-size: 12px;
		color: gray;
	}

	.communityList-area2-container-pagebar-area{
		display: flex;
		align-items: center;
		justify-content: center;
		width: auto;
		height: 110px;
		
	}
	.communityList-area2-container-pagebar{
		height: 120px;
		/* position: fixed;
      	bottom: 0; */
		display: flex;
		align-items: center;
	}



	/* 보드 디테일 관련  */
	.communityList-area2-detail-title-area{
		display : flex;
		flex-direction: row;
		height: 120px;
		padding-top: 20px;
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
		padding: 40px 70px 0px 40px;
	}
	.detail-file{
		padding: 20px 40px 30px 40px;
	}
	.communityList-area2-detail-reply{
		padding: 30px 30px 10px 30px;
	}

	.reply-title-area{
		display: flex;
		justify-content: space-between;
		padding: 0 20px;
	}

	.reply-table{
		width: 100%;
	}
	.reply-table-tr{
		display: flex;
		justify-content: space-between;
		padding: 3px 0;
	}

	.reReply-table-tr{
		display: flex;
		justify-content: space-between;
		padding: 3px 0 3px 30px;
	}

	.reply-name{
		padding-left: 30px;
		width: 100px;
	}
	.reply-content{
		width: calc(100% - 310px);
		padding-left: 20px;
	}
	.reply-update-date-area{
		display: flex;
		justify-content: space-around;
		width: 270px;
		padding-right: 30px;
	}
	.reply-update-area{
		display: flex;
		justify-content: space-around;
		width: 80px;
		font-size: 14px;
		align-items: center;
	}
	.replyDate{
		font-size: 14px;
		display: flex;
		align-items: center;
	}


	/* 댓글작성 영역 */
	.notice-reply-bottom{
		margin-top: 10px;
		display: flex;
		justify-content: center;
	}
	.notice-reply-write-area{
		border: 1px solid #9e9e9e;
		border-radius: 5px;
		width: 90%;
	}
	.notice-reply-write-area textarea{
		border: none;
		resize: none;
		width: 100%;
		padding: 5px 0 0 10px;

		overflow-x:hidden;
		overflow-y:auto;
	}
	.notice-reply-write-area textarea:focus{
		outline: none;
	}
	.notice-reply-write-writer{
		font-size: 14px;
		padding: 10px 0 0 10px;
	}
	.notice-reply-write-btn{
		display: flex;
		justify-content: flex-end;
	}
	.notice-reply-write-btn button{
		height: 35px;
		width: 65px;
		border: 1px solid rgb(85, 175, 130);
		background-color: rgb(85, 175, 130);
		color: white;
		border-radius: 7px;
		margin: 0 10px 10px 0;
	}


	/* 커뮤 가입 영역 */
	.community-join-area{
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	.community-join-title{
		font-size: 30px;
		font-weight: bold;
		display: flex;
		justify-content: center;
		padding-top: 35px;
		padding-bottom: 10px;
	}
	.community-join-name{
		display: flex;
		align-items: center;
		font-weight: bold;
		width: 180px;
	}
	.community-join-point{
		display: flex;
		align-items: center;
		color: rgb(74, 74, 74);
	}
	.community-join-point{
		font-size: 14px;
		color: rgb(93, 93, 93);;
	}

	.join-btn{
		width: 70px;
		height: 25px;
		font-size: 12px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.join-btn2{
		border: 1px solid rgb(85, 175, 130);
		color: white;
		background-color: rgb(85, 175, 130);;
	}
	.join-btn1{
		border: 1px solid rgb(106, 106, 106);
		color: rgb(106, 106, 106);
		background-color: white;
	}
	.community-join-table{
		width: 100%;
	}
	.community-join-table-tr{
		width: 100%;
		display: flex;
    	justify-content: space-between;
		padding: 7px 10%;
	}
	.community-join-table-tr:hover{
		background-color: rgba(197, 197, 197, 0.177);
	}
	.community-join-table-td1{
		display: flex;
    	justify-content: space-between;
	}
	

	/* 커뮤 만들기 관련 */
	.comInsert{
		width: 80%;
		display: flex;
		justify-content: end;
	}
	.comInsert > div{
		color: white;
		background-color: black;
		padding: 3px 8px;
	}
	.comInsert > div:hover{
		cursor: pointer;
		background-color: rgb(50, 50, 50);
	}
	/* 모달 */
	#create-btn, #update-btn{
		width: 58px;
		height: 38px;
		border: 1px solid rgb(85, 175, 130);
		border-radius: 7px;
		color: white;
		background-color:rgb(85, 175, 130);
	}
	#delete-btn{
		width: 58px;
		height: 38px;
		border: 1px solid red;
		border-radius: 7px;
		color: white;
		background-color:red;
	}
	#modal-footer{
		display: flex;
		justify-content: space-between;
	}



	/* 글쓰기 폼 관련 */
	.communityList-area2-all{
		width: 100%;
		height: 100%;
		padding: 50px 100px 50px 60px;
	}
	.communityEnrollForm-title{
		font-weight: bold;
		font-size: 24px;
		margin-bottom: 20px;
	}
	.communityEnrollForm-table{
		width: 100%;
		border-collapse: separate;
      	border-spacing: 10px;
		padding-top: 10px;
	}
	.td1{
		width: 75px;
		font-weight: bold;
	}
	.td-name{
		background-color: #eeeeee;
	}
	.td2{
		width: calc(100%)
	}
	.communityEnrollForm-table textarea{
		height: 400px;
		resize: none;
		padding: 20px;
	}
	.table-title{
		height: 35px;
		padding-left: 10px;
	}
	.table-file{
		height:80px;
		border: 1px dotted;
	}
	.form-button-all{
		display: flex;
		align-items: center;
		justify-content: center;
		margin: 20px 0;
	}
	.form-button1{
		height: 40px;
		width: 65px;
		border: 1px solid rgb(85, 175, 130);
		background-color: rgb(85, 175, 130);
		color: white;
		border-radius: 7px;
		margin: 0 15px;
	}
	.form-button2{
		height: 40px;
		width: 65px;
		border: 1px solid rgb(85, 175, 130);
		background-color: white;
		color: rgb(85, 175, 130);
		border-radius: 7px;
		margin: 0 15px;
	}
	.test-up{
		display : flex;
		align-items: flex-start;
		padding-top: 6px;
	}






</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="menu">
	
		<!-- area1 : 커뮤 리스트 -->
		<div class="communityList-area1">

		</div>
		
		<div class="test1">
		</div>
		
		<!-- area2 : 리스트, 디테일, 수정 -->
		<div class="communityList-area2">
			<div class="communityList-container-box">
			</div>
		</div>

		<!-- area3 : 멤버 영역 -->
		<div class="communityList-area3">

		</div>
	</div>







	<!-- -------------------------------------- 모달 (커뮤 등록) ----------------------------------------------- -->

	<!-- The Modal -->
	<div class="modal" id="com-create">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">커뮤니티 만들기</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal" onclick="closeBtn()"></button>
				</div>

				<!-- Modal body -->
                    <div class="modal-body">
                        <h6>이름</h6>
                        <div class="input-group mb-3 input-group-lg">  
							<textarea id="modal-Name" name="comName" class="form-control" style="height: 50px;"></textarea>
                        </div>
                        <div>
                            <h6>소개</h6>
                            <textarea id="modal-point" name="comCont" class="form-control" style="height: 100px;"></textarea>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
						<button type="submit" id="create-btn" data-bs-dismiss="modal" onclick="createCom()">등록</button>
                    </div>
			</div>
		</div>
	</div>

	<script>
		// 모달 닫기 버튼 (내용 지우기)
		function closeBtn(){
			document.querySelector('#modal-Name').value = "";
			document.querySelector('#modal-point').value = "";
		}
		// 커뮤 등록
		function createCom(){
			let loginUserNo = '${loginUser.empNo}';
			$.ajax({
                url : "create.com",
                data : {
                    empNo : loginUserNo,
                    comName : $('#modal-Name').val(),
                    comPoint : $("#modal-point").val()
                },
                success: function(res){
					if(res == "success"){
						alert("등록 완료")
						$('#modal-Name').val("");
                		$("#modal-point").val("");
						myCommunityList();
						comListAll();
					} else {
						console.log("create 실패")
					}
                },
                error : function(){
                    console.log("실패");
                }
            })
		}
	</script>


<!-- -------------------------------------- 모달 (커뮤 수정) ----------------------------------------------- -->

	<!-- The Modal -->
	<div class="modal" id="com-update">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">커뮤니티 수정</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
                    <div class="modal-body">
                        <h6>이름</h6>
                        <div class="input-group mb-3 input-group-lg">  
							<textarea id="modal-name" name="comName" class="form-control" style="height: 50px;"></textarea>
                        </div>
                        <div>
                            <h6>소개</h6>
                            <textarea id="modal-point-" name="comCont" class="form-control" style="height: 100px;"></textarea>
                        </div>
                    </div>

                    <!-- Modal footer -->
                    <div id="modal-footer" class="modal-footer">
						<button type="submit" id="delete-btn" data-bs-dismiss="modal" onclick="daleteCom()">삭제</button>
						<button type="submit" id="update-btn" data-bs-dismiss="modal" onclick="updateCom()">수정</button>
                    </div>
			</div>
		</div>
	</div>
	
	<script>
		// 모달에 내용 채우기
	   	function comUpdateModal(){
			document.querySelector('#modal-name').value = document.querySelector('#select-com-name').textContent;
			document.querySelector('#modal-point-').value = document.querySelector('#select-com-point').value;
		}	

		// 커뮤 수정
		function updateCom(){
			$.ajax({
				url: "update.com",
				data: {
					comName: document.querySelector('#modal-name').value,
					comPoint: document.querySelector('#modal-point-').value,
					comNo: document.querySelector('#select-com-no-').value,
				},
				success: function (res) {
					if(res == "success"){
							alert("수정 완료")
							myCommunityList();
							selectCommunityMemberList(document.querySelector('#select-com-no-').value)
						} else {
							console.log("수정 실패")
						}
				},
				error: function () {
					console.log("실패");
				}
			});
		}

		// 커뮤 삭제
		function daleteCom(){
			if(window.confirm("※주의※ 삭제 후 복구할 수 없습니다.")){
				$.ajax({
					url: "delete.com",
					data: {
						comNo: document.querySelector('#select-com-no-').value,
					},
					success: function (res) {
						if(res == "success"){
								alert("삭제 완료")
								myCommunityList(function (startList) {
									selectCommunityOne(startList);
								});
							} else {
								console.log("수정 실패")
							}
					},
					error: function () {
						console.log("실패");
					}
				});
			}
		}

	


	</script>


	





	
	<!-- ------------------------------------------------ 스크립트 --------------------------------------------------------- -->
	
	<script>

	const currentCommunity = {
		
	}

	// 첫 로드시 실행될 함수
	onload = function () {
		myCommunityList(function (startList) {
			selectCommunityOne(startList);
		});
	};

	// 내 커뮤니티 리스트
	function myCommunityList(callback) {
		$.ajax({
			url: "myComList.com",
			data: {},
			success: function (res) {
				let str = "";
				str += '<div class="communityList-area1-button-div"><button class="communityList-area1-button" onclick="comBoardCreateForm()">글쓰기</button></div>' +
					'<div class="communityList-area1-title">' +
					'<div><h5>내 커뮤니티</h5></div>' +
					'<button class="plus-btn" onclick="comListAll()"><div>&#43;</div></button>' +
					'</div>' +
					'<ul class="communityList-area1-li">';
				for (let i = 0; i < res.length; i++) {
					str += '<li id="startList' + i + '" name="' + res[i].communityNo + '" onclick="selectCommunityOne(this)">' + res[i].communityName + '</li>';
				}
				str += '</ul>';
				document.querySelector(".communityList-area1").innerHTML = str;

				let startList = document.getElementById('startList0');
				callback(startList);
			},
			error: function () {
				console.log("실패");
			}
		});
	}



	// 리스트 선택시 실행될 함수
	function selectCommunityOne(clickedElement) {
		let selectComNo = clickedElement.getAttribute('name');

		selectCommunityColorChange(clickedElement); // 색바꾸기
		selectCommunityMemberList(selectComNo); // 멤버 리스트 조회
		// 게시글 조회
		$(".communityList-container-box").empty();
		selectCommunityBoardList(selectComNo, 1);
	}

	// 리스트 색 바꾸기
	function selectCommunityColorChange(clickedElement){
		// 전체 리스트색 초기화
		var allElements = document.querySelectorAll('.communityList-area1-li li');
		allElements.forEach(element => {
			element.style.backgroundColor = '';
		});
		// 선택 리스트색 바꾸기
		clickedElement.style.backgroundColor = 'rgba(85, 175, 130, 0.2)';
	}

	// 멤버 리스트 조회
	function selectCommunityMemberList(selectComNo){
		let loginUserNo = '${loginUser.empNo}';
		$.ajax({
			url: "memberList.com",
			data:{
				comNo : selectComNo,
			},
			success: function(res){
				// 전역변수에 값 저장
				currentCommunity.comNo = res[0].communityNo;  
				currentCommunity.comName = res[0].communityName;

				let str = "";
				str +=  '<div class="communityList-area3-title">' +
							'<h5 id="select-com-name">'+ res[0].communityName +'</h5>' +
							'<div data-bs-toggle="modal" data-bs-target="#com-update" onclick="comUpdateModal()">톱</div>' +
						'</div>' +
						'<div class="communityList-area3-member">' +
							'<div><h5>멤버</h5></div>' +
						'</div>' +
						'<ul class="communityList-area3-li">'
				for (let list of res){
					str += '<li>' + list.empName + " " + list.jobName + '</li>'
				}
				str += '</ul>' +
						'<div class="communityList-area3-title-btn2-box">' +
							'<button class="communityList-area3-title-btn2" onclick="comOut(' + res[0].communityNo + ',' + loginUserNo + '); location.reload(true);"><div>탈퇴하기</div></button>' +
							'</div>' +
							'<input type="hidden" id="select-com-point" value="' + res[0].communityPoint + '"/>'+
							'<input type="hidden" id="select-com-no-" value="' + res[0].communityNo + '"/>'

				document.querySelector(".communityList-area3").innerHTML = str;
			},
			error : function(){
                   console.log("실패")
			}
		})
	}

	// 게시글 리스트 가져오기
	function selectCommunityBoardList(selectComNo, cpage){
		$.ajax({
			url: "boardList.com",
			data:{
				comNo : selectComNo,
				cpage : cpage
			},
			success: function(res){
				let blist = res.boardList;
				let pi = res.pi;

				// 만약 위에 더보기 버튼이 있다면 없애주기
				if(document.getElementById('btn'+(cpage-1)) !== null){
					document.getElementById('btn'+(cpage-1)).style.display = "none";
				}
				
				let str = "";
				for (let list of blist){
					str += '<div class="communityList-area2-container" onclick="boardDetailView(' + list.communityBoardNo + ')">' +
								'<div class="communityList-area2-container-content">' +
									'<div class="communityList-area2-container-content-title">' +
										'<div class="communityList-area2-container-content-title1">' + list.communityBoardTitle + '</div>' +
										'<div class="communityList-area2-container-content-title2">' + '댓글 : ' + '</div>' +
										'<div class="communityList-area2-container-content-title3">' + list.communityBoardReplyCount + '</div>' +
									'</div>' +
									'<div class="communityList-area2-container-content-content">' + list.communityBoardContent + '</div>' +
									'<div class="communityList-area2-container-content-profile">' +
										'<div class="communityList-area2-container-content-profile-image">' + '사진' + '</div>' +
										'<div class="communityList-area2-container-content-profile-name">' + list.empName + '</div>' +
										'<div class="communityList-area2-container-content-profile-date">' + list.communityBoardCreateDate + '</div>' +
									'</div>' +
								'</div>' +
								'<div class="communityList-area2-container-like">' +
									'<div>' + '하트' + '</div>' +
									'<div>' + list.communityBoardLikeCount + '</div>' +
								'</div>' +
							'</div>'
				}

				// 이 부분에서 새로운 데이터를 기존 데이터 뒤에 추가
				$(".communityList-container-box").append(str);

				// 더보기 버튼 추가
				if(cpage != pi.maxPage){
					cpage++;
					str = '<div id="btn'+ (cpage-1) +'" onclick="selectCommunityBoardList(\'' + selectComNo + '\', \'' + cpage + '\')">더보기</div>';
					$(".communityList-container-box").append(str);
				}
               },
               error : function(){
                   console.log("실패")
               }
		})
	}

	// 게시글 디테일 (보드 + 댓글) 조회
	function boardDetailView(bno){
		selectBoard(bno);

	}

	// 보드 디테일 조회
	function selectBoard(bno){
		let loginUser = '${loginUser}';
		$.ajax({
			url: "board.com",
			data:{
				bno: bno
			},
			success: function(res){
				let board = res.board;
				let atList = res.atList;

				let str = "";
				
				str += '<div class="communityList-area2-detail-title-area">' +
							'<div class="communityList-area2-detail-title-title">' +
								'<div class="communityList-area2-detail-title-title-title">' +
									'<div class="back-icon">&lt;</div>' +
									'<div class="detail-title">' + board.communityBoardTitle + '</div>' +
								'</div>' +
								'<div class="communityList-area2-detail-title-title-profile">' +
									'<div class="profile-image">' + board.profileFilePath + '</div>' +
									'<div class="profile-name">' + board.empName + '</div>' +
									'<div class="profile-date">' + board.communityBoardCreateDate + '</div>' +
								'</div>' +
							'</div>' +
							'<div class="communityList-area2-detail-title-like">' +
								'<div>하트</div>' +
								'<div>' + board.communityBoardLikeCount + '</div>' +
							'</div>' +
						'</div>' +
						'<div class="communityList-area2-detail-content">' +
							'<div class="detail-content">' + board.communityBoardContent + '</div>' +
							'<div class="detail-file">' + // 파일 리스트 들어갈 곳

							'</div>' +
						'</div>' +
						'<div class="communityList-area2-detail-reply">' +
							'<div class="reply-title-area">' +
								'<div>댓글 (' + board.communityBoardReplyCount + ')</div>' +
								'<div>작성</div>' +
							'</div>' +
							'<hr>' +
							'<table class="reply-table">' +//댓글 들어갈 곳
							'</table>' +
						'</div>' +

						// 댓글 작성 영역
						'<div class="notice-reply-bottom">' +
							'<div class="notice-reply-write-area">' +
								'<div class="notice-reply-write-writer">${loginUser.empName}</div>' +
								'<div>' +
									'<textarea cols="100" placeholder="댓글을 입력해주세요"></textarea>' +
								'</div>' +
								'<div class="notice-reply-write-btn">' +
									'<button onclick="insertReply()">등록</button>' +
								'</div>' +
							'</div>' +
						'</div>'
				document.querySelector(".communityList-container-box").innerHTML = str;

				let str2 ="";
				for (let list of atList){
					str2 += '<div><a href="'+ list.communityChangeName +'" download="'+ list.communityOriginName +'">'+ list.communityOriginName +'</a></div>'
				}
				document.querySelector(".detail-file").innerHTML = str2;
				// 댓글 리스트 조회
				selectReplyList(bno)
			},
        	error : function(){
            	console.log("실패")
        	}
		})
	}

	// 댓글, 대댓글 리스트 조회
	function selectReplyList(bno){
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
						str += '<div class="reply-update-area">답글</div>'
					}

						str += '<div class="replyDate">'+ list.communityReplyCreateDate +'</div>' +
								'</td>' +
							'</tr>'		
				}
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
	}

	// 댓글 작성
	function insertReply(){
		$.ajax({
			url: "replyIn.com",
			data: {
				
			},
			success: function (res) {
				
			},
			error: function () {
				console.log("실패");
			}
		});
	}


	// 전체 커뮤 리스트
	function comListAll(){
		let loginUserEmpNo = '${loginUser.empNo}';
		$.ajax({
			url: "listAll.com",
			data:{
				empNo: loginUserEmpNo
			},
			success: function(res){
				let allList = res.allList;
				let myList = res.myList;
				let str = "";
				str +=  '<div class="community-join-area">' +
							'<div class="community-join-title">커뮤니티 목록</div><br>' +
							'<div class="comInsert">' +
							'<div data-bs-toggle="modal" data-bs-target="#com-create">커뮤니티 만들기</div>' +
						'</div>' +
						'<br>' +
						'<table class="community-join-table">'
				for (let list of allList){
					str += '<tr class="community-join-table-tr">' +
								'<td class="community-join-table-td1">' +
									'<div class="community-join-name">'+ list.communityName +'</div>' +
									'<div class="community-join-point">'+ list.communityPoint +'</div>' +
								'</td>' +
								'<td class="join-btn-area">'
						let checkCount = 0;
						for (let list2 of myList){
							if (list.communityNo == list2.communityNo){
								checkCount++;
							}
						}
						if (checkCount > 0){
							str += '<button class="join-btn1 join-btn" onclick="comOut(' + list.communityNo + ',' + loginUserEmpNo + '); comListAll();">탈퇴하기</button>'
						} else{
							str += '<button class="join-btn2 join-btn" onclick="comIn(' + list.communityNo + ',' + loginUserEmpNo + ')">가입하기</button>'
						}

						str += '</td></tr>'	
				}
				str +=	'</table></div>';
				document.querySelector(".communityList-container-box").innerHTML = str;
				// area3 비워주기
				document.querySelector(".communityList-area3").innerHTML = "";
			},
			error : function(){
				console.log("실패")
			}
		})
	}

	// 커뮤 가입
	function comIn(comNo, empNo){
		
		if (window.confirm("가입하시겠습니까?")){
			$.ajax({
				url: "comIn.com",
				data:{
					comNo: comNo,
					empNo: empNo
				},
				success: function(res){
					if(res == "success"){
						alert("가입 완료")
							myCommunityList();
							comListAll();
					} else {
						console.log("insert실패")
					}
				},
				error : function(){
					console.log("실패")
				}
			})
		}
	}

	// 커뮤 탈퇴
	function comOut(comNo, empNo){
		if(window.confirm("탈퇴하시겠습니까?")){
			$.ajax({
				url: "comOut.com",
				data:{
					comNo: comNo,
					empNo: empNo
				},
				success: function(res){
					if(res == "success"){
						alert("탈퇴 완료")
						myCommunityList();
					} else {
						console.log("delete 실패")
					}
				},
				error: function() {
					console.log("실패")
				}
			})
		}
	}


	// 글쓰기 폼
	function comBoardCreateForm(){

		console.log(currentCommunity.comNo)
		console.log(currentCommunity.comName)
		let str = "";
		str +='<div class="communityList-area2-all">' +
				'<div class="communityEnrollForm-title">글쓰기</div>' +
				'<form action="">' +
					'<table class="communityEnrollForm-table">' +
						'<tr>' +
							'<td class="td1">분류</td>' +
							'<td>' +
								'<input class="td-name" type="text" value="' + currentCommunity.comName + '" readonly>' +
							'</td>' +
						'</tr>' +
						'<tr>' +
							'<td class="td1">제목</td>' +
							'<td><input type="text" class="td2 table-title"></td>' +
						'</tr>' +
						'<tr>' +
							'<td class="td1 test-up">파일첨부</td>' +
							'<td><input type="text" class="td2 table-file"></td>' +
						'</tr>' +
						'<tr>' +
							'<td class="td1 test-up">내용</td>' +
							'<td><textarea class="td2" name="" id="" cols="30" rows="10"></textarea></td>' +
						'</tr>' +

					'</table>' +
					'<div class="form-button-all">' +
						'<button class="form-button1" type="submit">등록</button>' +
						'<button class="form-button2">취소</button>' +
					'</div>' +
				'</form>' +
			'</div>' 
			document.querySelector(".communityList-container-box").innerHTML = str;


	}

	</script>

</body>
</html>


