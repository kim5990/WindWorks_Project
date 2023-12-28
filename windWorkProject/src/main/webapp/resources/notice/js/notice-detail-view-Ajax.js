const noticeDetailViewController ={
    /* ----- 댓글 그려주기 -----*/
    selectReplyListAjax: (data, selectReplyListDraw) => {
        $.ajax({
            url: "rlist.no",
            data,
            success: function(result){
                console.log(result);
                selectReplyListDraw(result)
            },
            error : (error) =>{
              console.log(error)
            }
        })
    },

    /* ----- 댓글 쓰기 기능 ----- */
    addReplyAjax: (data, selectReplyList) => {
        $.ajax({
            url: "rinsert.no",
            data,
            success: function(result){
                if (result === "success"){
                    selectReplyList(data.noticeNo);
                    $("#contentReply").val("");
                }
            },
            error: function(){
                console.log("rinsert.no ajax통신 실패");
            }
        })
    },

    /* ----- 댓글 수정 기능 ----- */
    noticeReplyUpdateAjax: (data, selectReplyList) => {
        $.ajax({
            url: "rupdate.no",
            data,
            success: function(result){
                swal("", "댓글이 수정되었습니다.", "success");
                selectReplyList(data.noticeNo);
            },
            error: function(){
                console.log("rupdate.no ajax통신 실패");
            }
        })
    },

    /* ----- 댓글 삭제 기능 ----- */
    noticeReplyDeleteAjax: (data, selectReplyList) => {
        $.ajax({
            url: "rdelete.no",
            data,
            success: function(result){
                	
                    // 잘안됨..
                	// swal({
					// 	title: '',
					// 	text: '댓글을 삭제하시겠습니까?',
					// 	icon: 'warning',
						   
					// 	showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
					// 	confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
					// 	cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
					// 	confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
					// 	cancelButtonText: '취소', // cancel 버튼 텍스트 지정
						   
					// 	reverseButtons: true, // 버튼 순서 거꾸로
						   
					// }).then(result => {
					// 	// 만약 Promise리턴을 받으면,
					// 	if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
					// 	swal('', '삭제되었습니다.', 'success');
					// 	}
					// });
					
					selectReplyList(data.noticeNo);

            },
            error: function(){
                console.log("rdelete.no ajax통신 실패");
            }
        })
    },

    /* ----- 답글 쓰기 기능 ----- */
    addChildReplyAjax: (data, selectReplyList) => {
        $.ajax({
            url: "crinsert.no",
            data,
            success: function(result){
                
                if (result === "success"){
                    selectReplyList(data.noticeNo);
                }
            },
            error: function(){
                console.log("crinsert.no ajax통신 실패");
            }
        })
    },

    /* ----- 답글 수정 기능 ----- */
    appendChildReplyUpdateAjax: (data, selectReplyList) => {
        $.ajax({
            url: "crupdate.no",
            data,
            success: function(result){
                selectReplyList(data.noticeNo);
            },
            error: function(){
                console.log("crupdate.no ajax통신 실패");
            }
        })    
    },

    /* ----- 답글 삭제 기능 ----- */
    noticeChildReplyDeleteAjax: (data, selectReplyList) => {
        $.ajax({
            url: "crdelete.no",
            data,
            success: function(result){
                selectReplyList(data.noticeNo);
            },
            error: function(){
                console.log("crdelete.no ajax통신 실패");
            }
        })
    }
}